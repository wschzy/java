package com.sweet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class Action {

	public static void main(String[] args) {
		SpringApplication.run(Action.class,args);
	}
	
}
