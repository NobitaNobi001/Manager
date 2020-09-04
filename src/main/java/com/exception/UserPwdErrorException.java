package com.exception;

// 密码错误抛出的异常
public class UserPwdErrorException extends RuntimeException {

    public UserPwdErrorException() {
        super();
    }

    public UserPwdErrorException(String message) {
        super(message);
    }

    public UserPwdErrorException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserPwdErrorException(Throwable cause) {
        super(cause);
    }

    protected UserPwdErrorException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
