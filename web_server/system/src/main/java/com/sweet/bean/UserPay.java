package com.sweet.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class UserPay implements Serializable{
	
	private static final long serialVersionUID = -3059410508995311145L;
	
	private Integer id;
	private Integer userid;
	
	@NotNull(message = "支付类型不能为空")
	private Integer dicid;
	
	@NotNull(message = "支付方式不能为空")
	private Integer way;
	
	@NotNull(message = "金额不能为空")
	private BigDecimal money;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date time;
	private String note;
}
