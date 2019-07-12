package com.sweet.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.web.bind.annotation.*;

import com.sweet.bean.UserPay;
import com.sweet.hzy.service.UserPayService;
import com.sweet.util.SysException;

@RestController
@RequestMapping(value="/pay")
public class UserPayController extends BaseController{

	@Resource
	private UserPayService userPayService;
	
	@PostMapping(value="/getUserPayList")
	public Map<String,Object> getUserPayList(Integer page, Integer pageSize) {
		return userPayService.getUserPayList(page,pageSize);
	}
	
	
	@PostMapping(value="/addUserPay")
	public int addUserPay(@Valid UserPay pay) {
		return userPayService.insertUserPay(pay);
	}
	
	@DeleteMapping(value="/delete/{id}")
	public int deleteUserPay(@NotNull(message = "参数不能为空") @PathVariable Integer id) throws SysException{
		return userPayService.deleteUserPay(id);
	}
	
	@PostMapping(value="/updateUserPay")
	public int updateUserPay(@Valid UserPay pay) {
		return userPayService.updateUserPay(pay);
	}
	
	@PostMapping(value="/getMoneyListByWeek")
	public List<UserPay> getMoneyListByWeek(Date time) {
		return userPayService.getMoneyListByWeek(time);
	}

	@PostMapping(value="/getMoneyListByMonth")
	public List<UserPay> getMoneyListByMonth(Date time) {
		return userPayService.getMoneyListByMonth(time);
	}
	
	@PostMapping(value="/getMoneyListByMonthWeek")
	public List<UserPay> getMoneyListByMonthWeek(Date time) {
		return userPayService.getMoneyListByMonthWeek(time);
	}

	@PostMapping(value="/getMoneyListByYear")
	public List<UserPay> getMoneyListByYear(Date time) {
		return userPayService.getMoneyListByYear(time);
	}
	
	@PostMapping(value="/getMoneyListByDic")
	public List<UserPay> getMoneyListByDic(Date time) {
		return userPayService.getMoneyListByDic(time);
	}

	@PostMapping(value="/getMoneyListByDicMonth")
	public List<UserPay> getMoneyListByDicMonth(Date time) {
		return userPayService.getMoneyListByDicMonth(time);
	}
}
