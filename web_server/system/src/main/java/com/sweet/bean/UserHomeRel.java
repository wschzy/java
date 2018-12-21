package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserHomeRel implements Serializable {
	private static final long serialVersionUID = -1306408614508552268L;
	private Integer id;
	private Integer homeid;
	private Integer userid;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lrsj;
}
