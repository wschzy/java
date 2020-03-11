package com.sweet;

import com.sweet.util.SpringContextUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ServletComponentScan;
import com.sweet.config.DBConfig1;
import com.sweet.config.DBConfig2;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication// same as @Configuration @EnableAutoConfiguration @ComponentScan
@EnableAsync//开启异步
@EnableConfigurationProperties(value = { DBConfig1.class, DBConfig2.class })//多数据源
@ServletComponentScan//在 SpringBootApplication 上使用@ServletComponentScan 注解后，Servlet、Filter、Listener 可以直接通过 @WebServlet、@WebFilter、@WebListener 注解自动注册，无需其他代码
public class Action {

	/**
	 * maven clear package
	 * jvm参数调优 
	 * -XX:+PrintGCDetails -Xmx4096M -Xms4096M 
	 * java -server -Xms32m -Xmx32m  -jar springboot.jar
	 */
	public static void main(String[] args) {
		ApplicationContext context= SpringApplication.run(Action.class,args);
		SpringContextUtil.setApplicationContext(context);
	}
	
}
