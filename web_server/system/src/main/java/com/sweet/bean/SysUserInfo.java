package com.sweet.bean;

import java.io.Serializable;

import lombok.Data;

@Data
public class SysUserInfo implements Serializable {

	private static final long serialVersionUID = 4334330165533269006L;
	private Integer id;
	private String loginid;
	private String password;
	private String phone;
	private Integer sex;
}
