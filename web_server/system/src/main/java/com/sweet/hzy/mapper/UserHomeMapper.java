package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;

public interface UserHomeMapper {

	/**
	 * 根据用户id查询home
	 */
	@Select("select * from user_home where id in (select homeid from user_home_rel where userid = #{userid}) ")
	List<UserHome> getHomeByUserid(Integer userid);
	
	/**
	 * 根据homeid查询用户列表
	 */
	@Select("select * from sys_userinfo where id in (select userid from user_home_rel where homeid = #{homeid})")
	List<SysUserInfo> getUserListByHomeid(Integer homeid);
	
	//添加home
	@Insert("insert into user_home (name,picture,note,lrsj) values (#{name},#{picture},#{note},now())")
	@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
	int insertHome(UserHome home);
	
	
}
