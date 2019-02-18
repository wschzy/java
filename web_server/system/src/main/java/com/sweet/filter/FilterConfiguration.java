//package com.sweet.filter;
//
//import javax.servlet.Filter;
//
//import org.springframework.boot.web.servlet.FilterRegistrationBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//
//@Configuration
//public class FilterConfiguration {
//	@Bean
//	@Order(Integer.MIN_VALUE)
//	public FilterRegistrationBean<Filter> characterFilter() {
//		FilterRegistrationBean<Filter> registration = new FilterRegistrationBean<Filter>();
//		registration.setFilter(new CharacterEncodingFilter());
//		registration.addUrlPatterns("/*");
//		registration.setName("characterEncodingFilter");
//		return registration;
//	}
//}
