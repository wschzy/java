package com.sweet.hzy.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface UserHomeRelMapper {

	@Insert("insert into user_home_rel (homeid,userid,lrsj) values (#{homeid},#{userid},now())")
	int insertUserHomeRel(@Param("homeid")Integer homeid,@Param("userid")Integer userid);
	
	@Delete("delete user_home_rel where userid = '#{userid}'")
	int deleteUserHomeRelByUserid(Integer userid);
}
