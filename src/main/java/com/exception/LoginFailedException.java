package com.exception;

/**
 * @author hbk
 * @date 2020/7/20
 **/
/*
* 登录失败后抛出的异常
* */
public class LoginFailedException extends RuntimeException{

    public LoginFailedException() {
    }

    public LoginFailedException(String message) {
        super(message);
    }

    public LoginFailedException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginFailedException(Throwable cause) {
        super(cause);
    }

}
