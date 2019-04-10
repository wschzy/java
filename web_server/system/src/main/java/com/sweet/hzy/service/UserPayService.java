package com.sweet.hzy.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sweet.bean.UserPay;
import com.sweet.util.SysException;

public interface UserPayService {

	Map<String,Object> getUserPayList(Integer page, Integer pageSize);
	
	int insertUserPay(UserPay pay);
	
	int deleteUserPay(Integer id)throws SysException;
	
	int updateUserPay(UserPay pay);
	
	List<UserPay> getMoneyListByWeek(Date time);
	
	List<UserPay> getMoneyListByMonth(Date time);
	
	List<UserPay> getMoneyListByMonthWeek(Date time);
	
	List<UserPay> getMoneyListByYear(Date time);
	
	List<UserPay> getMoneyListByDic(Date time);
}
