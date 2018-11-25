package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sweet.bean.SysUserInfo;

public interface SysUserInfoMapper {
	//根据用户名查询用户
	@Select("SELECT * FROM SYS_USERINFO WHERE loginid = #{loginid}")
	SysUserInfo findUserByloginid(@Param("loginid") String loginid);
	
	//查询所有用户
	@Select("SELECT * FROM SYS_USERINFO ")
	List<SysUserInfo> findUserList();
	
	@Insert("INSERT INTO SYS_USERINFO(loginid, password,phone,sex) VALUES(#{loginid}, #{password}, #{phone}, #{sex})")
	int addUser(@Param("loginid") String loginid, @Param("password") String password,
				@Param("phone") String phone,@Param("sex") Integer sex);

}
