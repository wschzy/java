package com.sweet.hzy.service;

import com.github.pagehelper.PageInfo;
import com.sweet.bean.SysUserInfo;

public interface SysUserInfoService {
	int addUser(String loginid,String password, String phone, Integer sex) throws Exception;
	PageInfo<SysUserInfo> findUserList(Integer page,Integer pageSize);
}
