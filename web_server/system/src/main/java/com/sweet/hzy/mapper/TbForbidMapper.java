package com.sweet.hzy.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.*;

import com.sweet.bean.TbForbid;
@CacheNamespace(implementation=com.sweet.redis.RedisCache.class)
public interface TbForbidMapper {

	//查询所有还未禁用人员
	@Select("SELECT * FROM TB_FORBID where isdisable is null")
	List<TbForbid> findNotDisableUserList();
	
	//查询用户还未禁用记录
	@Select("SELECT * FROM TB_FORBID where isdisable is null and loginid = #{loginid}")
	TbForbid findNotDisableRecordUserForLoginid(@Param("loginid") String loginid);
	
	@Select("SELECT * FROM TB_FORBID where isdisable = 1 and loginid = #{loginid}")
	TbForbid findDisableUserForLoginid(@Param("loginid") String loginid);
	
	@Insert("insert into TB_FORBID (loginid,LOGINTIMES,ISDISABLE,DISABLETIME,ENABLETIME,IP) VALUES "
			+ "(#{loginid}, #{logintimes}, #{isdisable}, #{disabletime}, #{enabletime}, #{ip})")
	int insertTbForbid(@Param("loginid") String loginid,@Param("logintimes") Integer logintimes,@Param("isdisable") Integer isdisable,
			@Param("disabletime") Date disabletime,@Param("enabletime") Date enabletime,@Param("ip") String ip);
	//设置禁用用户
	@Update("update TB_FORBID set isdisable = 1,disabletime=now() where id = #{id}")
	int updateTbForbid(@Param("id") Integer id);
	
	//设置错误登录次数
	@Update("update TB_FORBID set logintimes = #{logintimes} where id = #{id}")
	int updateTbForbidTimes(@Param("id") Integer id,@Param("logintimes") Integer logintimes);
	
	//设置启用用户
	@Update("update TB_FORBID set isdisable = 0,enabletime=now() where isdisable is null and loginid = #{loginid}")
	int updateTbForbidEnable(@Param("loginid") String loginid);
}
