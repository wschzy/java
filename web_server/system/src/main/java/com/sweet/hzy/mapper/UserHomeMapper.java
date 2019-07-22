package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.sweet.bean.SysUserInfo;
import com.sweet.bean.UserHome;
@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface UserHomeMapper {

	/**
	 * 根据用户id查询home
	 */
	@Select("select * from user_home where id in (select homeid from user_home_rel where userid = #{userid}) ")
	List<UserHome> getHomeByUserid(Integer userid);
	
	//添加home
	@Insert("insert into user_home (name,picture,note,lrsj) values (#{name},#{picture},#{note},now())")
	@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
	int insertHome(UserHome home);
	
	//修改家庭头像
	@Update("Update user_home set picture= #{picture} WHERE id = #{id}")
	int updateHomePictureById(@Param("picture") String picture,@Param("id") Integer id);
}
