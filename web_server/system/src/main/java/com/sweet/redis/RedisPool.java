package com.sweet.redis;

import java.util.HashSet;
import java.util.ResourceBundle;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisPool {
    private static JedisCluster pool;

    @Value("${spring.redis.jedis.cluster.nodes}")
    private String clusterNodes;
    @Value("${spring.redis.jedis.pool.max-idle}")
    private int maxIdle;
    @Value("${spring.redis.jedis.pool.max-wait}")
    private long maxWaitMillis;
    @Value("${spring.redis.jedis.pool.max-active}")
    private String maxActive;
    @Value("${spring.redis.jedis.timeout}")
    private int timeout;
    @Value("${spring.redis.jedis.commandTimeout}")
    private int commandTimeout;
    @Value("${spring.redis.jedis.password}")
    private String password;
    @Value("${spring.redis.jedis.pool.testOnBorrow}")
    private String testOnBorrow;
    @Value("${spring.redis.jedis.pool.testOnReturn}")
    private String testOnReturn;

    private RedisPool(){
        //ResourceBundle bundle =ResourceBundle.getBundle("application");if(bundle==null){ throw new IllegalArgumentException("[redis.properties] is not find "); }
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxIdle(Integer.valueOf(maxIdle));
        config.setMaxWaitMillis(Long.valueOf(maxWaitMillis));
        config.setMaxTotal(Integer.valueOf(maxActive));
        config.setTestOnBorrow(Boolean.valueOf(testOnBorrow));
        config.setTestOnReturn(Boolean.valueOf(testOnReturn));
        String[] cNodes = clusterNodes.split(",");
        Set<HostAndPort> nodes = new HashSet<>();
        //分割出集群节点
        for (String node : cNodes) {
            String[] nd = node.split(":");
            nodes.add(new HostAndPort(nd[0], Integer.parseInt(nd[1])));
        }
        //创建连接池
        //pool =new JedisPool(config,bundle.getString("spring.redis.host"),Integer.valueOf(bundle.getString("spring.redis.port")),Integer.valueOf(bundle.getString("spring.redis.timeout")));
        pool = new JedisCluster(nodes,commandTimeout,timeout,5,password, config);
    }

    public  static JedisCluster getPool() {
        if(pool==null){
            synchronized (RedisPool.class) {
                if(pool==null){
                    new RedisPool();
                }
            }
        }
        return pool;
    }
}
