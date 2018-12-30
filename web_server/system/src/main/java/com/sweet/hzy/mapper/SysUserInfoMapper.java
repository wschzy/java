package com.sweet.hzy.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.sweet.bean.SysUserInfo;

public interface SysUserInfoMapper {
	
	//查询所有用户
	@Select("SELECT * FROM SYS_USERINFO ")
	List<SysUserInfo> findUserList();
	
	//添加用户
	@Insert("INSERT INTO SYS_USERINFO(loginid, password,phone,sex,fullname,email,lrsj,picture) VALUES"
			+ "(#{loginid}, #{password}, #{phone}, #{sex},#{fullname},#{email},now(),#{picture})")
	int addUser(@Param("loginid") String loginid, @Param("password") String password,
				@Param("phone") String phone,@Param("sex") Integer sex,@Param("fullname") String fullname,@Param("email")String email,@Param("picture")String picture);
	
	//根据用户名密码查询用户
	@Select("SELECT * FROM SYS_USERINFO WHERE loginid = #{loginid} and password= #{password}")
	@Results({
        @Result(property = "lrsj",  column = "lrsj", javaType = Date.class)
    })
	SysUserInfo findUserByLoginidAndPassword(@Param("loginid") String loginid,@Param("password") String password);
	
	//根据用户名查询用户
	@Select("SELECT * FROM SYS_USERINFO WHERE loginid = #{loginid} ")
	@Results({
        @Result(property = "lrsj",  column = "lrsj", javaType = Date.class)
    })
	SysUserInfo findUserByLoginid(@Param("loginid") String loginid);
	
	//删除用户
	@Delete("DELETE SYS_USERINFO WHERE id = #{id}")
	int deleteUserById(@Param("id") String id);
	
	//修改用户密码
	@Update("Update SYS_USERINFO set password= #{password} WHERE id = #{id}")
	int updateUserPasswordById(@Param("id") String id,@Param("password") String password);
	
	//修改用户头像
	@Update("Update SYS_USERINFO set picture= #{picture} WHERE id = #{id}")
	int updateUserPictureById(@Param("picture") String picture,@Param("id") Integer id);
	
	//根据用户名查询用户
	@Select("SELECT * FROM SYS_USERINFO WHERE id = #{id} ")
	@Results({
        @Result(property = "lrsj",  column = "lrsj", javaType = Date.class)
    })
	SysUserInfo findUserByid(Integer id);
}



