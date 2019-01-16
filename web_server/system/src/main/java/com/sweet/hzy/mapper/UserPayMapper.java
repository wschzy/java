package com.sweet.hzy.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sweet.bean.UserPay;

public interface UserPayMapper {

	@Select("select a.*,b.fullname from (SELECT * FROM user_pay where userid = #{userid}"
			+ " or userid in (select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = #{userid})) order by time) a left join sys_userinfo b on a.userid = b.id")
	@Results({
        @Result(property = "time",  column = "time", javaType = Date.class)
    })
	List<UserPay> getUserPayList(Integer userid);
}
