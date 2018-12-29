package com.sweet.hzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sweet.bean.SysMenu;
import com.sweet.bean.UserDictionary;

public interface UserDictionaryMapper {

	@Select("SELECT * FROM USER_DICTIONARY ")
	List<SysMenu>getDictionaryList();
	
	
	@Insert("insert into USER_DICTIONARY (name,supnumber,dicclass,note,levels,serial,tagone,tagtwo) "
			+ "values (#{name},#{supnumber},#{dicclass},#{note},#{levels},#{serial},#{tagone},#{tagtwo})")
	int insertDictionary(UserDictionary dic);
	
	@Update("update USER_DICTIONARY set name = #{name},supnumber = #{supnumber},dicclass=#{dicclass}"
			+ ",note=#{note},levels=#{levels},serial=#{serial},tagone=#{tagone},tagtwo=#{tagtwo} where id = #{id}")
	int updateDictionary(UserDictionary dic);
}
