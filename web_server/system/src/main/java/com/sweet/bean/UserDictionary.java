package com.sweet.bean;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserDictionary implements Serializable {
	private static final long serialVersionUID = -376514074939215877L;
	private Integer id;
	@Pattern(regexp="^\\S*$",message="名称格式错误")
	@NotNull(message = "名称不能为空")
	@Size(max = 39, message = "用户名最大39位")
	private String name;
	private Integer supnumber;
	@NotNull(message = "类别不能为空")
	private String dicclass;
	private String note;
	private Integer levels;
	private Integer serial;
	private String tagone;
	private String tagtwo;
	private Integer userid;
}
