package com.sweet.wsc.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.util.MD5;
import com.sweet.wsc.mapper.SysUserMapper;
import com.sweet.wsc.service.SysUserService;


@Service
public class SysUserServiceImp implements SysUserService{

	@Resource
	private SysUserMapper sysUserMapper;
	
	@Transactional(transactionManager="wscTransactionManager")
	public int addUser(String loginid, String password, String phone, Integer sex) {
		//MD5º”√‹
		return sysUserMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex);
	}

	
}
