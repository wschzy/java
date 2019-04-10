package com.sweet.hzy.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.sweet.bean.UserPay;
import com.sweet.hzy.mapper.provider.UserPayProvider;

public interface UserPayMapper {

	@Select("select a.id,a.money,a.time,a.note,b.fullname,c.name zflx,d.name zfws from (SELECT * FROM user_pay where userid = #{userid} "
			+ "or userid in (select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = #{userid})) order by time desc) a "
			+ "left join sys_userinfo b on a.userid = b.id "
			+ "left join user_dictionary c on a.dicid = c.id left join user_dictionary d on a.way = d.id")
	@Results({
        @Result(property = "obj",  column = "fullname", javaType = Object.class),
        @Result(property = "obj2",  column = "zflx", javaType = Object.class),
        @Result(property = "obj3",  column = "zfws", javaType = Object.class)
    })
	List<UserPay> getUserPayList(Integer userid);

	@Select("SELECT count(*) FROM user_pay where userid = #{userid} or userid in (select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = #{userid})) ")
	int getUserPayCount(Integer userid);

	@Insert("insert into user_pay (userid,dicid,way,money,time,note) values (#{userid},#{dicid},#{way},#{money},now(),#{note})")
	int insertUserPay(UserPay pay);
	
	@Delete("delete from user_pay where id = #{id}")
	int deleteUserPay(Integer id);
	
	@Select("select time from user_pay where id = #{id}")
	UserPay getDeletePayTime(Integer id);
	
	@Update("update user_pay set dicid=#{dicid},way=#{way},money=#{money},note=#{note} where id = #{id}")
	int updateUserPay(UserPay pay);
	
	/**
	 * 查询本周每天消费消费
	 */
	@SelectProvider(type = UserPayProvider.class, method = "getMoneyListByWeek")
	List<UserPay> getMoneyListByWeek(Integer userid,Date time);
	
	/**
	 * 查询本月每天消费
	 */
	@SelectProvider(type = UserPayProvider.class, method = "getMoneyListByMonth")
	List<UserPay> getMoneyListByMonth(Integer userid,Date time);
	
	/**
	 * 查询本月每周消费
	 */
	@SelectProvider(type = UserPayProvider.class, method = "getMoneyListByMonthWeek")
	List<UserPay> getMoneyListByMonthWeek(Integer userid,Date time);
	
	/**
	 * 查询本年每月消费
	 */
	@SelectProvider(type = UserPayProvider.class, method = "getMoneyListByYear")
	List<UserPay> getMoneyListByYear(Integer userid,Date time);
	
	/**
	 * 查询本年各类消费
	 */
	@SelectProvider(type = UserPayProvider.class, method = "getMoneyListByDic")
	List<UserPay> getMoneyListByDic(Integer userid,Date time);
}
