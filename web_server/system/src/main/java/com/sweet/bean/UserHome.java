package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserHome implements Serializable {
	private static final long serialVersionUID = 629056561757105648L;
	private Integer id;
	private String name;
	private String picture;
	private String note;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lrsj;
}
