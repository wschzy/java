package com.sweet.filter;

import javax.servlet.Filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CharacterEncoingConfiguration {

    @Bean
    public FilterRegistrationBean<Filter> someFilterRegistration() {
        FilterRegistrationBean<Filter> registration = new FilterRegistrationBean<Filter>();
        registration.setFilter(commonDataFilter());
        registration.addUrlPatterns("/*");
        registration.setName("characterEncodingFilter");
        registration.setOrder(1);
        return registration;
    }
 
    /**
     * 创建一个bean
     */
    @Bean(name = "characterEncodingFilter")
    public Filter commonDataFilter() {
        return new CharacterEncodingFilter();
    }


}
