package com.sweet.redis;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import com.sweet.config.RedisConfig;
import com.sweet.util.SpringContextUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import redis.clients.jedis.*;


@Slf4j
public class RedisCache implements Cache{
    private String id;
    private static JedisCluster jedisCluster;
    private ReadWriteLock readWriteLock = new ReentrantReadWriteLock(); //读写锁


    private final static RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();


    public void setReadWriteLock(ReadWriteLock readWriteLock) {
        this.readWriteLock = readWriteLock;
    }

    private  void createRedis() {//从连接池获取redis连接
        if(jedisCluster==null){
            synchronized (RedisCache.class) {
                if(jedisCluster==null){
                    jedisCluster = RedisConfig.getJedisClus();
                }
            }
        }
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

    public void putObject(Object key, Object value) {
        createRedis();
        jedisCluster.set(serializer.serialize(key), serializer.serialize(value));
    }

    public Object getObject(Object key) {
        createRedis();
        //缓存穿透
        byte[] values=jedisCluster.get(serializer.serialize(key));
        if(values==null){
            return null;
        }
        return serializer.deserialize(values);
    }

    public Object removeObject(Object key) {
        createRedis();
        return  jedisCluster.expire(serializer.serialize(key), 0);
    }

    public void clear() {
        Set<byte[]> keys=keys(("*"+id+"*").getBytes());
        //遍历key  进行删除  可以用多线程
        for(byte[] key:keys){
            jedisCluster.del(key);
        }
    }

    public static Set<byte[]> keys(byte[] pattern){
        Set<byte[]> keys = new HashSet<>();
        Map<String, JedisPool> clusterNodes = jedisCluster.getClusterNodes();
        for(String k : clusterNodes.keySet()){
            JedisPool jp = clusterNodes.get(k);
            Jedis connection = jp.getResource();
            try {
                keys.addAll(connection.keys(pattern));
            } catch(Exception e){
                log.error( e.getMessage());
            } finally{
                connection.close();
            }
        }
        return keys;
    }

    public int getSize() {
        return 0;
    }

    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }
}
