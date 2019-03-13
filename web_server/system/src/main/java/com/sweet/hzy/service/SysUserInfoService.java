package com.sweet.hzy.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import com.sweet.bean.SysUserInfo;
import com.sweet.util.SysException;

public interface SysUserInfoService {
	int addUser(String loginid,String password, String phone, Integer sex,String fullname,String email,String picture)throws SysException;
	List<SysUserInfo> findUserList(Integer page,Integer pageSize);
	SysUserInfo findUserByLoginidAndPassword (String loginid,String password,HttpSession session)throws SysException;
	List<?> getMenu();
	int updateUserPictureById(String picture);
	SysUserInfo findUserByid(Integer id);
}
