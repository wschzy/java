package src;

import src.ExceptionLevel;

public class SMSException extends Exception{
	
	private static final long serialVersionUID = 3854427375537175453L;

	/**
	 * 错误代码
	 */
	private String errorCode;
	
	/**
	 * 手机号码
	 */
	private String phone;
	/**
	 * 错误信息
	 */
	private String errorMeg;
	
	/**
	 * 错误等级
	 */
	private ExceptionLevel exceptionLevel = ExceptionLevel.customer;
	
	public ExceptionLevel getExceptionLevel() {
		return exceptionLevel;
	}

	public void setExceptionLevel(ExceptionLevel exceptionLevel) {
		this.exceptionLevel = exceptionLevel;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMeg() {
		return errorMeg;
	}

	public void setErrorMeg(String errorMeg) {
		this.errorMeg = errorMeg;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
    public SMSException() {
    	super();
    }

    public SMSException(String message) {
    	super(message);
    }
    
    public SMSException(String message,ExceptionLevel level) {
    	super(message);
    	exceptionLevel = level;
    }

    public SMSException(String message, Throwable cause) {
        super(message, cause);
    }

    public SMSException(Throwable cause) {
        super(cause);
    }
    
    public String getMessage(){
    	if(errorMeg  == null || errorMeg.length() == 0)
    		return errorMeg;
    	else
    		return super.getMessage();
    }
}
