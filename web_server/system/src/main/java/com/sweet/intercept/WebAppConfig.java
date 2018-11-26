package com.sweet.intercept;

import javax.annotation.Resource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebAppConfig extends WebMvcConfigurationSupport{
	@Resource
	private LoginIntercept loginIntercept;

	@Bean
	public WebAppConfig webMvcConfigurer() {
		return new WebAppConfig() {
			public void addInterceptors(InterceptorRegistry registry) {
				registry.addInterceptor(loginIntercept).addPathPatterns("*.do");
			};
		};
	}

}
