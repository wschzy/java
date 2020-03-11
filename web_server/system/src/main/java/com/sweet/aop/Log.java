package com.sweet.aop;

import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.sweet.util.FinalString;
import com.sweet.util.ServletUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;
import redis.clients.jedis.JedisCluster;

@Aspect
@Component
@Slf4j
public class Log {


	@Autowired
	private JedisCluster jedisCluster;

	@Pointcut("execution(public * com.sweet.controller.*.*(..))")
	public void webLog() {
	}

	@Before("webLog()")
	public void doBefore(JoinPoint joinPoint) {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		log.info("URL : " + request.getRequestURL().toString());
		log.info("HTTP_METHOD : " + request.getMethod());
		log.info("IP : " + request.getRemoteAddr());
		Enumeration<String> enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = enu.nextElement();
			log.info("name:{},value:{}", name, request.getParameter(name));
		}
		try {
			operationRecords();
		}catch (Exception e){
			log.debug(e.getMessage());
		}
	}

	@AfterReturning(returning = "ret", pointcut = "webLog()")
	public void doAfterReturning(Object ret) {
		log.info("RESPONSE : " + ret);
	}


	@Async
	public void operationRecords(){
		String id = ServletUtil.getSessionVal("id");
		if(!StringUtils.isEmpty(id)){
			String dateStr = FinalString.getDateStr(new Date(),null);
			jedisCluster.zincrby(FinalString.key+":"+dateStr,1,id);
		}
	}
}

