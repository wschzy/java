package com.sweet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.EnableAsync;

import com.sweet.config.DBConfig1;
import com.sweet.config.DBConfig2;

@SpringBootApplication// same as @Configuration @EnableAutoConfiguration @ComponentScan
@EnableAsync//异步
@EnableConfigurationProperties(value = { DBConfig1.class, DBConfig2.class })//多数据源
public class Action {

	/**
	 * maven clear package
	 * jvm参数调优 
	 * -XX:+PrintGCDetails -Xmx4096M -Xms4096M 
	 * java -server -Xms32m -Xmx32m  -jar springboot.jar
	 */
	public static void main(String[] args) {
		SpringApplication.run(Action.class,args);
	}
	
}
