package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SysUserInfo implements Serializable {

	private static final long serialVersionUID = 4334330165533269006L;
	private Integer id;
	@NotNull(message = "用户名不能为空")
	@Size(max = 39, message = "用户名最大39位")
	@Size(min = 3, message = "用户名最小3位")
	private String loginid;
	
	@NotNull(message = "密码不能为空")
	@Size(min = 6, message = "密码最小6位")
	private String password;
	
	@Pattern(regexp="^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$",message="手机格式错误")
	private String phone;
	private Integer sex;
	private String fullname;
	
	@Email
	private String email;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lrsj;
	private String picture;
	private Integer isadmin;
	private Integer tag;
}
