package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CorsIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		 log.info("处理跨域....");
		 response.setHeader("Access-Control-Allow-Origin", "*");
		 response.setHeader("Access-Control-Allow-Methods", "*");
		 response.setHeader("Access-Control-Allow-Headers","*");
		 response.setHeader("Access-Control-Allow-Credentials", "true");
		 return true;
	}

}
