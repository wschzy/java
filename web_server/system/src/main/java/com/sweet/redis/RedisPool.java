package com.sweet.redis;

import java.util.ResourceBundle;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisPool {
    private static JedisPool pool;

    private RedisPool(){
    ResourceBundle bundle =ResourceBundle.getBundle("application");
    //bundle类似一个map
    if(bundle==null){
        throw new IllegalArgumentException("[redis.properties] is not find ");
       }
    JedisPoolConfig config = new JedisPoolConfig();
    config.setMaxTotal(Integer.valueOf(bundle.getString("spring.redis.jedis.pool.max-active")));
    config.setMaxIdle(Integer.valueOf(bundle.getString("spring.redis.jedis.pool.max-idle")));
    config.setMaxWaitMillis(Long.valueOf(bundle.getString("spring.redis.jedis.pool.max-wait")));
    config.setTestOnBorrow(Boolean.valueOf(bundle.getString("spring.redis.jedis.pool.testOnBorrow")));
    config.setTestOnReturn(Boolean.valueOf(bundle.getString("spring.redis.jedis.pool.testOnReturn")));

    //创建连接池
    pool =new JedisPool(config,bundle.getString("spring.redis.host"),Integer.valueOf(bundle.getString("spring.redis.port")),Integer.valueOf(bundle.getString("spring.redis.timeout")));
    }

    public synchronized static JedisPool getPool() {
        if(pool==null){
            new RedisPool();
        }
        return pool;
    }
}
