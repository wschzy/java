package com.sweet.service.imp;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.sweet.service.UserService;


@Service
public class UserServiceImp implements UserService{

	@Async
	public String login() {
		return "";
	}

	
}
