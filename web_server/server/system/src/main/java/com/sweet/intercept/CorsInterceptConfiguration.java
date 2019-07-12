package com.sweet.intercept;


import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsInterceptConfiguration implements WebMvcConfigurer{

	@Override
    public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new CorsIntercept()).addPathPatterns("/**").order(1);
    }

//	@Override
//    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/**")
//                .allowCredentials(true)
//                .allowedMethods("GET", "POST", "DELETE", "PUT")
//                .maxAge(3600);
//    }
}
