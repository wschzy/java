package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserHome implements Serializable {
	private static final long serialVersionUID = 629056561757105648L;
	private Integer id;
	
	@NotNull(message = "名称不能为空")
	@Size(max = 39, message = "名称最大39位")
	private String name;
	
	private String picture;
	private String note;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lrsj;
}
