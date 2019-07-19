package com.sweet.util;

public class SysException extends Exception {

	private static final long serialVersionUID = -958278487498313962L;

	public SysException() {
		super();
	}

	public SysException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public SysException(String message, Throwable cause) {
		super(message, cause);
	}

	public SysException(String message) {
		super(message);
	}

	public SysException(Throwable cause) {
		super(cause);
	}
 
    
    
}

