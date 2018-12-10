package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class SysHome implements Serializable {
	private static final long serialVersionUID = 629056561757105648L;
	private Integer id;
	private String name;
	private String picture;
	private String note;
	private Date lrsj;
}
