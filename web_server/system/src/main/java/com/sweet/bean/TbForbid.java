package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class TbForbid implements Serializable{

	private static final long serialVersionUID = -7520739829187635829L;
	private Integer id;
	private String loginid;
	private Integer logintimes;
	private Integer isdisable;
	private Date disabletime;
	private Date enabletime;
	private String ip;
}
