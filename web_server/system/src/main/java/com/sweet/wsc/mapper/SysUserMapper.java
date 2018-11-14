package com.sweet.wsc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sweet.bean.SysUserInfo;

public interface SysUserMapper {

	@Select("SELECT * FROM SYS_USERINFO WHERE loginid = #{loginid}")
	SysUserInfo findUserByName(@Param("name") String name);
	
	@Insert("INSERT INTO SYS_USERINFO(loginid, password,phone,sex) VALUES(#{loginid}, #{password}, #{phone}, #{sex})")
	int addUser(@Param("loginid") String loginid, @Param("password") String password,
				@Param("phone") String phone,@Param("sex") Integer sex);

}
