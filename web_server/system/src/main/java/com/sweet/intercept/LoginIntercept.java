package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sweet.bean.ResponseResult;
import com.sweet.util.ServletUtil;
import com.sweet.util.StringUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		log.info("开始拦截登录请求....");
		if (StringUtil.isEmpty(ServletUtil.getSessionVal("id"))) {
			ResponseResult<Void> rr = new ResponseResult<Void>();
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("没有权限");
			response.getWriter().println(rr);
			return false;
			//重定向
			//response.sendRedirect("http://119.3.25.141:4200/");
		}
		return true;
	}

}
