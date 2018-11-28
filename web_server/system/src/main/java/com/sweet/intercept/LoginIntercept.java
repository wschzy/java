package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("开始拦截登录请求....");
		HttpSession session = request.getSession();
		if (session.getAttribute("loginid") != null) {
			response.getWriter().println("login");
			//重定向
			return false;
		}
		return true;
	}

}
