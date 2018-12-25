package com.sweet.bean;

import java.io.Serializable;

import lombok.Data;
@Data
public class ResponseResult<T> implements Serializable {

	private static final long serialVersionUID = 3297519564155363057L;
	public static final int STATE_OK = 1;
	public static final int STATE_ERROR = -1;
	
	
	private int state;
	private String message;
	private T data;

}

