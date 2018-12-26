package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		if (request.getSession().getAttribute("id") == null) {
			response.getWriter().println("-2");
			log.info("拦截");
			return false;
		}
		log.info("放行");
		return true;
	}

}
