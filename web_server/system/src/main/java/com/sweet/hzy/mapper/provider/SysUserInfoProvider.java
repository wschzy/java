package com.sweet.hzy.mapper.provider;

import com.sweet.bean.SysUserInfo;
import com.sweet.util.MD5;
import com.sweet.util.StringUtil;

public class SysUserInfoProvider {

    public String updateUserById(SysUserInfo user) {
        String where;
        if(StringUtil.isEmpty(user.getPassword())){
            where = "";
        }else{
            where = "password= '"+MD5.getMD5(user.getPassword().getBytes())+"',";
        }
        return "Update SYS_USERINFO set "+where+"phone='"+user.getPhone()+"',sex='"+user.getSex()+"',fullname='"+user.getFullname()+"',email='"+user.getEmail()+"' WHERE id = "+user.getId();
    }
}
