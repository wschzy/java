package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.sweet.util.ServletUtil;
import com.sweet.util.StringUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		log.info("开始拦截登录请求....");
		if (StringUtil.isEmpty(ServletUtil.getSessionVal("id"))) {
			response.getWriter().println("-2");
			return false;
			//重定向
			//response.sendRedirect("http://119.3.25.141:4200/");
		}
		return true;
	}

}
