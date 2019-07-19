package com.sweet.bean;

import java.io.Serializable;

import lombok.Data;

@Data
public class SysMenu implements Serializable {
	private static final long serialVersionUID = -2291835015096047216L;
	private Integer id;
	private Integer pid;
	private String name;
	private Integer display;
	private Integer level;
	private String url;
	private String serial;
}
