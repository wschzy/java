package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;
import com.sweet.bean.UserDictionary;
@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface UserDictionaryMapper {

	@Select("SELECT * FROM USER_DICTIONARY where userid = #{userid}"
			+ " or userid in (select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = #{userid})) order by dicclass")
	List<UserDictionary>getDictionaryList(Integer userid);
	
	@Select("select id,name,dicclass from user_dictionary where userid is null order by id")
	List<UserDictionary>getPayWayList();
	
	@Insert("insert into USER_DICTIONARY (name,supnumber,dicclass,note,levels,serial,tagone,tagtwo,userid) "
			+ "values (#{name},#{supnumber},#{dicclass},#{note},#{levels},#{serial},#{tagone},#{tagtwo},#{userid})")
	int insertDictionary(UserDictionary dic);
	
	@Update("update USER_DICTIONARY set name = #{name},supnumber = #{supnumber},dicclass=#{dicclass}"
			+ ",note=#{note},levels=#{levels},serial=#{serial},tagone=#{tagone},tagtwo=#{tagtwo} where id = #{id}")
	int updateDictionary(UserDictionary dic);
	
	@Delete("delete from user_dictionary where id = #{id}")
	int deleteDictionaryById(Integer id);
	
	/**
	 * 判断用户类别是否存在支付中
	 */
	@Select("select count(*) from user_pay where dicid = #{id} or way = #{id}")
	int inPayByid(Integer id);
}
