package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class CorsIntercept implements HandlerInterceptor {

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		 response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
		 response.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
		 response.setHeader("Access-Control-Allow-Headers","*");
		 response.setHeader("Access-Control-Allow-Credentials", "true");
		 return true;
	}

}
