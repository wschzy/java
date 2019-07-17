package com.sweet.hzy.mapper;

import org.apache.ibatis.annotations.*;

@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface UserHomeRelMapper {

	@Insert("insert into user_home_rel (homeid,userid,lrsj) values (#{homeid},#{userid},now())")
	int insertUserHomeRel(@Param("homeid")Integer homeid,@Param("userid")Integer userid);
	
	@Delete("delete from user_home_rel where userid = #{userid}")
	int deleteUserHomeRelByUserid(Integer userid);
	
	@Select("select count(*) from  user_home_rel where homeid = #{homeid} and userid = #{userid}")
	int isUserByUserHomeRel(@Param("homeid")Integer homeid,@Param("userid")Integer userid);
}
