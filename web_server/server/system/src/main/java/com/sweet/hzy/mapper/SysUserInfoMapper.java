package com.sweet.hzy.mapper;

import java.util.List;

import com.sweet.hzy.mapper.provider.SysUserInfoProvider;
import org.apache.ibatis.annotations.*;
import com.sweet.bean.SysUserInfo;

public interface SysUserInfoMapper {

    //查询所有用户
    @Select("SELECT id,loginid,phone,sex,fullname,email,lrsj FROM SYS_USERINFO where tag = 1")
    List<SysUserInfo> findUserList();

    //查询用户总数
    @Select("SELECT count(*) FROM SYS_USERINFO where tag = 1")
    int findUserCount();

    //添加用户
    @Insert("INSERT INTO SYS_USERINFO(loginid, password,phone,sex,fullname,email,lrsj,tag) VALUES"
            + "(#{loginid}, #{password}, #{phone}, #{sex},#{fullname},#{email},now(),1)")
    int addUser(SysUserInfo user);

    //根据用户名查询用户
    @Select("SELECT id,loginid,isadmin,password,phone,sex,fullname,email,lrsj,tag FROM SYS_USERINFO WHERE loginid = #{loginid} ")
    SysUserInfo findUserByLoginid(@Param("loginid") String loginid);

    //删除用户
    @Update("Update SYS_USERINFO set tag = 0 WHERE id = #{id}")
    int deleteUserById(@Param("id") Integer id);

    //修改用户头像
    @Update("Update SYS_USERINFO set picture= #{picture} WHERE id = #{id}")
    int updateUserPictureById(@Param("picture") String picture, @Param("id") Integer id);

    //修改用户基本信息
    @UpdateProvider(type = SysUserInfoProvider.class, method = "updateUserById")
    Integer updateUserById(SysUserInfo user);

    //根据id查询用户
    @Select("SELECT loginid,fullname,picture FROM SYS_USERINFO WHERE id = #{id} ")
    SysUserInfo findUserByid(Integer id);
}



