package com.sweet.hzy.service;

import java.util.List;
import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
import com.sweet.util.SysException;

public interface UserHomeService {

	/**
	 * 根据用户id查询home
	 */
	UserHome getHomeByUserid() throws SysException;
	
	/**
	 * 根据homeid查询用户列表
	 */
	List<SysUserInfo> getUserListByHomeid(Integer homeid);
	
	//添加home
	int addHome(UserHome home)throws SysException;
	
	/**
	 * 添加home中的人员
	 */
	int addUserForHome (String loginid,Integer homeid);
	
	int deleteUserForHome(Integer userid);
	
	int updateHomePictureById(String picture,Integer id);
}
