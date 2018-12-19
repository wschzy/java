package com.sweet.bean;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserMenu implements Serializable {
	private static final long serialVersionUID = -1754964075512471491L;
	private Integer id;
	private Integer pid;
	private String name;
	private Integer display;
	private Integer level;
	private String url;
	
}
