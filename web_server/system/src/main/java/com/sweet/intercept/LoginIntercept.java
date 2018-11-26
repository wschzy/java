package com.sweet.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sweet.bean.ResponseResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginIntercept implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		log.info("开始拦截登录请求....");
		HttpSession session = request.getSession();
		if (session.getAttribute("loginid") == null) {
			rr.setMessage("请登录");
			rr.setState(ResponseResult.STATE_ERROR);
			response.getWriter().println(rr);
			return false;
		}
		return true;
	}

}
