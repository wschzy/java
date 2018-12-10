package com.sweet.bean;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class SysUserHomeRelation implements Serializable {
	private static final long serialVersionUID = -1306408614508552268L;
	private Integer id;
	private Integer homeid;
	private Integer userid;
	private Date lrsj;
}
