package com.sweet.hzy.service;

import java.util.List;

import com.sweet.bean.UserPay;

public interface UserPayService {

	List<UserPay> getUserPayList();
	
	int insertUserPay(UserPay pay);
	
	int deleteUserPay(Integer id);
	
	int updateUserPay(UserPay pay);
}
