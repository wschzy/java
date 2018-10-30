package cn.edu.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ExceptionHandler;

public abstract class BaseController {

	protected Integer getUidFromSession(HttpSession session) {
		return Integer.valueOf(session.getAttribute("uid").toString());
	}
	
	@ExceptionHandler
	public String handlerException(Exception e,HttpServletRequest request) {
		if(e instanceof NumberFormatException) {
			request.setAttribute("errorMessage","数字格式错误");
		}else {
			request.setAttribute("errorMessage","未知错误");
		}
		return "error";
	}

}
