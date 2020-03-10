package com.sweet.config;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
@ConditionalOnClass({ JedisCluster.class }) // 初始化一个类
public class RedisConfig {
	@Value("${spring.redis.cluster.nodes}")
	private String clusterNodes;
	@Value("${spring.redis.timeout}")
	private int timeout;
	@Value("${spring.redis.commandTimeout}")
	private int commandTimeout;
	@Value("${spring.redis.password}")
	private String password;
	@Value("${spring.redis.maxAttempts}")
	private int maxAttempts;


	@Value("${spring.redis.jedis.pool.max-active}")
	private int maxActive;

	@Value("${spring.redis.jedis.pool.max-wait}")
	private Long maxWait;

	@Value("${spring.redis.jedis.pool.max-idle}")
	private int maxIdle;

	@Value("${spring.redis.jedis.pool.min-idle}")
	private int minIdle;

	/**
	 * 连接耗尽时是否阻塞, false报异常,ture阻塞直到超时, 默认true
	 */
	private static boolean BLOCK_WHEN_EXHAUSTED = false;

	/**
	 * 设置的逐出策略类名, 默认DefaultEvictionPolicy(当连接超过最大空闲时间,或连接数超过最大空闲连接数)
	 */
	private static String EVICTION_POLICY_CLASSNAME="org.apache.commons.pool2.impl.DefaultEvictionPolicy";

	/**
	 * 是否启用pool的jmx管理功能, 默认true
	 */
	private static boolean JMX_ENABLED=true;

	/**
	 * MBean ObjectName = new ObjectName("org.apache.commons.pool2:type=GenericObjectPool,name=" + "pool" + i); 默认为"pool", JMX不熟,具体不知道是干啥的...默认就好.
	 */
	private static String JMX_NAME_PREFIX="pool";

	/**
	 * 是否启用后进先出, 默认true
	 */
	private static boolean LIFO=true;

	/**
	 * 逐出连接的最小空闲时间 默认1800000毫秒(30分钟)
	 */
	private static long MIN_EVICTABLE_IDLE_TIME_MILLIS=30000;

	/**
	 * 对象空闲多久后逐出, 当空闲时间>该值 且 空闲连接>最大空闲数 时直接逐出,不再根据MinEvictableIdleTimeMillis判断  (默认逐出策略)
	 */
	private static long SOFT_MIN_EVICTABLE_IDLE_TIME_MILLIS=30000;

	/**
	 * 每次逐出检查时 逐出的最大数目 如果为负数就是 : 1/abs(n), 默认3
	 */
	private static int NUM_TESTS_PER_EVICYION_RUN=50;

	/**
	 * 如果为true，表示有一个idle object evitor线程对idle object进行扫描，如果validate失败，此object会被从pool中drop掉；这一项只有在 timeBetweenEvictionRunsMillis大于0时才有意义；
	 */
	private static boolean TEST_WHILE_IDLE=true;

	/**
	 * 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
	 * 逐出扫描的时间间隔(毫秒) 如果为负数,则不运行逐出线程, 默认-1
	 */
	private static long TIME_BERWEEN_EVICTION_RUNS_MILLIS=30000;

	/**
	 * 检查连接归还可用性
	 */
	@Value("${spring.redis.jedis.pool.testOnBorrow}")
	private boolean testOnBorrow;

	/**
	 * 检查连接归还可用性
	 */
	@Value("${spring.redis.jedis.pool.testOnReturn}")
	private boolean testOnReturn;

	private static JedisCluster jedisCluster;

	@Bean
	public JedisCluster getJedisCluster() {
		String[] cNodes = clusterNodes.split(",");
		Set<HostAndPort> nodes = new HashSet<HostAndPort>();
		// 分割出集群节点
		for (String node : cNodes) {
			String[] hp = node.split(":");
			nodes.add(new HostAndPort(hp[0], Integer.parseInt(hp[1])));
		}
		JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.setMaxIdle(maxIdle);
		jedisPoolConfig.setMinIdle(minIdle);
		jedisPoolConfig.setMaxWaitMillis(maxWait);
		jedisPoolConfig.setMaxTotal(maxActive);
		jedisPoolConfig.setTestOnBorrow(testOnBorrow);
		jedisPoolConfig.setTestOnReturn(testOnReturn);
		jedisPoolConfig.setBlockWhenExhausted(BLOCK_WHEN_EXHAUSTED);
		jedisPoolConfig.setEvictionPolicyClassName(EVICTION_POLICY_CLASSNAME);
		jedisPoolConfig.setJmxEnabled(JMX_ENABLED);
		jedisPoolConfig.setJmxNamePrefix(JMX_NAME_PREFIX);
		jedisPoolConfig.setLifo(LIFO);
		jedisPoolConfig.setMinEvictableIdleTimeMillis(MIN_EVICTABLE_IDLE_TIME_MILLIS);
		jedisPoolConfig.setNumTestsPerEvictionRun(NUM_TESTS_PER_EVICYION_RUN);
		jedisPoolConfig.setSoftMinEvictableIdleTimeMillis(SOFT_MIN_EVICTABLE_IDLE_TIME_MILLIS);
		jedisPoolConfig.setTimeBetweenEvictionRunsMillis(TIME_BERWEEN_EVICTION_RUNS_MILLIS);
		jedisPoolConfig.setTestWhileIdle(TEST_WHILE_IDLE);
		//集群地址，连接超时时间，返回值的超时时间，连接尝试次数，密码和配置文件
		jedisCluster  = new JedisCluster(nodes,commandTimeout,timeout,maxAttempts,password,jedisPoolConfig);
		return jedisCluster;
	}


	public static JedisCluster getJedisClus(){
		return jedisCluster;
	}
	
}