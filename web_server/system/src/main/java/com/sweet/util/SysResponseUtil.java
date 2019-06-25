package com.sweet.util;

import com.sweet.bean.SysResponse;

import java.lang.reflect.Field;

public class SysResponseUtil {

    public static SysResponse response(Object obj){
        SysResponse sysResponse = new SysResponse();
        if(beanIsNull(obj)){
            sysResponse.setState(SysResponse.STATE_NULL);
            sysResponse.setMessage("响应内容为空");
        }else{
            sysResponse.setState(SysResponse.STATE_OK);
            sysResponse.setMessage("响应成功");
            sysResponse.setData(obj);
        }
        return  sysResponse;
    }

    public static boolean beanIsNull(Object o){
        try {
            for (Field field : o.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object object = field.get(o);
                if (object instanceof CharSequence) {
                    if (!StringUtil.isEmpty(object)) {
                        return false;
                    }
                } else {
                    if (null != object) {
                        return false;
                    }
                }
            }
        } catch (Exception e) {
        }
        return true;
    }

}
