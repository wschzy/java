package com.sweet.hzy.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sweet.hzy.mapper.SysUserInfoMapper;
import com.sweet.hzy.service.SysUserInfoService;
import com.sweet.util.MD5;


@Service
public class SysUserInfoServiceImp implements SysUserInfoService{

	@Resource
	private SysUserInfoMapper sysUserInfoMapper;
	
	@Transactional(transactionManager = "hzyTransactionManager")
	public int addUser(String loginid, String password, String phone, Integer sex) {
		//MD5º”√‹
		return sysUserInfoMapper.addUser(loginid, MD5.getMD5(password.getBytes()), phone, sex);
		
	}

	
}
