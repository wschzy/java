package com.sweet.hzy.service.imp;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sweet.bean.UserPay;
import com.sweet.hzy.mapper.UserPayMapper;
import com.sweet.hzy.service.UserPayService;
import com.sweet.util.ServletUtil;
@Service
public class UserPayServiceImp implements UserPayService{

	@Resource
	private UserPayMapper userPayMapper;
	
	@Override
	public List<UserPay> getUserPayList() {
		return userPayMapper.getUserPayList(Integer.valueOf(ServletUtil.getSessionVal("id")));
	}

	@Override
	public int insertUserPay(UserPay pay) {
		pay.setUserid(Integer.valueOf(ServletUtil.getSessionVal("id")));
		return userPayMapper.insertUserPay(pay);
	}

	@Override
	public int deleteUserPay(Integer id) {
		return userPayMapper.deleteUserPay(id);
	}

	@Override
	public int updateUserPay(UserPay pay) {
		return userPayMapper.updateUserPay(pay);
	}

	@Override
	public List<UserPay> getMoneyListByWeek(Date time) {
		return userPayMapper.getMoneyListByWeek(Integer.valueOf(ServletUtil.getSessionVal("id")), time);
	}

	@Override
	public List<UserPay> getMoneyListByMonth(Date time) {
		return userPayMapper.getMoneyListByMonth(Integer.valueOf(ServletUtil.getSessionVal("id")), time);
	}

	@Override
	public List<UserPay> getMoneyListByYear(Date time) {
		return userPayMapper.getMoneyListByYear(Integer.valueOf(ServletUtil.getSessionVal("id")), time);
	}

}
