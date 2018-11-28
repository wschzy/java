package com.sweet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.sweet.bean.ResponseResult;
/**
 * 全局捕获异常
 */
public abstract class BaseController {
	protected String getSessionVal(HttpSession session,String param) {
		return String.valueOf(session.getAttribute(param).toString());
	}
	
	@ExceptionHandler
	public ResponseResult<Void> handlerException(Exception e,HttpServletRequest request) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		e.printStackTrace();
		if(e instanceof NullPointerException) {
			rr.setMessage("未知错误，请联系管理员");
		}else {
			rr.setMessage(e.getMessage());
		}
		rr.setState(ResponseResult.STATE_ERROR);
		return rr;
	}
}
