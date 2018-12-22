package com.sweet.hzy.service;

import java.util.List;
import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.util.SysException;

public interface UserHomeService {

	/**
	 * 根据用户id查询home
	 */
	List<UserHome> getHomeByUserid() throws SysException;
	
	/**
	 * 根据homeid查询用户列表
	 */
	List<SysUserInfo> getUserListByHomeid(String homeid);
	
	//添加home
	int insertHome(UserHome home);
	
	/**
	 * 添加home中的人员
	 */
	int addUserForHome (String loginid,String homeid);
}
