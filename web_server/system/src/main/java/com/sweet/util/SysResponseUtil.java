package com.sweet.util;

import com.sweet.bean.SysResponse;

public class SysResponseUtil {

    public static SysResponse response(Object obj){
        SysResponse sysResponse = new SysResponse();
        sysResponse.setState(SysResponse.STATE_OK);
        sysResponse.setMessage("响应成功");
        sysResponse.setData(obj);
        return  sysResponse;
    }
}
