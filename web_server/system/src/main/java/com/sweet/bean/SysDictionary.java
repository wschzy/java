package com.sweet.bean;

import java.io.Serializable;
import lombok.Data;

@Data
public class SysDictionary implements Serializable {
	private static final long serialVersionUID = 2056500059714068395L;
	private Integer id;
	private String name;
	private String supnumber;
	private String dicclass;
	private String note;
	private Integer levels;
	private Integer serial;
	private String tagone;
	private String tagtwo;
}
