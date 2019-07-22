package com.sweet.redis;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.cache.Cache;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Slf4j
public class RedisCache implements Cache{
    private String id;
    private JedisPool redisClient=createRedis();
    private ReadWriteLock readWriteLock = new ReentrantReadWriteLock(); //读写锁

    public void setReadWriteLock(ReadWriteLock readWriteLock) {
        this.readWriteLock = readWriteLock;
    }

    public RedisCache(String id) {
        if(id==null){
            throw new IllegalArgumentException("Cache instance requires an ID");
        }
        log.debug("create an cache instance with id"+id);
        this.id=id;
    }

    public String getId() {
        return this.id;
    }

    /**从连接池中取
     * @return
     */
    private static JedisPool createRedis() {//从连接池获取redis连接
        return RedisPool.getPool();
    }

    public void putObject(Object key, Object value) {
        byte[] keybyte=SerializableUtil.serialize(key);
        byte[]valuebyte=SerializableUtil.serialize(value);
        try (Jedis jedis = this.redisClient.getResource();){
            jedis.set(keybyte, valuebyte);
        }
    }

    public Object getObject(Object key) {
        //缓存穿透
        try (Jedis jedis = this.redisClient.getResource();){
            byte[] values=jedis.get(SerializableUtil.serialize(key));
            if(values==null){
                return null;
            }
            Object obj =SerializableUtil.unserizlize(values);
            return obj;
        }
    }

    public Object removeObject(Object key) {
        byte[]keybyte=SerializableUtil.serialize(key);
        try (Jedis jedis = this.redisClient.getResource();){
            return  jedis.expire(keybyte, 0);
        }
    }

    public void clear() {
        execute(new RedisCallback() {
            @Override
            public Object doWithRedis(Jedis jedis) {
                jedis.del(id);
                return null;
            }
        });
    }

    private Object execute(RedisCallback callback) {
        try (Jedis jedis = this.redisClient.getResource();){
            return callback.doWithRedis(jedis);
        }
    }

    public int getSize() {
        try (Jedis jedis = this.redisClient.getResource();){
            Long size = jedis.dbSize();
            return Integer.valueOf(size+"");
        }
    }

    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }

}
