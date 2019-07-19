package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserSpbz implements Serializable {
	private static final long serialVersionUID = 5013550231005188677L;
	private Integer id;
	private Integer userid;
	private Integer relateid;
	private Integer czlx;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date cztime;
	private Integer xbbj;
	private String taskname;
	private String taskdesc;
	private String relatetable;
}
