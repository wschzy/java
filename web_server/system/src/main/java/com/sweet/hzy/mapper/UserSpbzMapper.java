package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.sweet.bean.UserSpbz;

//@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface UserSpbzMapper {

	@Select("select * from user_spbz where id = #{id}")
	UserSpbz getUserSpbz(Integer id);
	
	@Select("select * from user_spbz where userid = #{userid} and xbbj = 1")
	List<UserSpbz> getUserSpbzList(Integer userid);
	
	@Select("select count(*) from user_spbz where userid = #{userid} and xbbj = 1")
	int getUserSpbzCount(Integer userid);
	
	@Insert("insert into user_spbz (userid,relateid,czlx,cztime,xbbj,taskname,taskdesc,relatetable) "
	+ "values (#{userid},#{relateid},#{czlx},now(),#{xbbj},#{taskname},#{taskdesc},#{relatetable})")
	int addUserSpbz(UserSpbz userSpbz);
	
	@Update("update user_spbz set xbbj=#{xbbj},czlx=#{czlx},cztime=now() where id = #{id}")
	int updateUserSpbz(UserSpbz userSpbz);
	
	@Delete("delete from user_spbz where xbbj = 1 and relatetable = #{relatetable} and userid =#{userid} and relateid =#{relateid}")
	int deleteUserSpbz(@Param("relatetable")String relatetable,@Param("userid")Integer userid,@Param("relateid")Integer relateid);
}
