package com.exception;

/**
 * @author hbk
 * @date 2020/8/31
 **/
// 用户未登录访问资源异常
public class AccountNoLoginInException extends RuntimeException {
    public AccountNoLoginInException() {
        super();
    }

    public AccountNoLoginInException(String message) {
        super(message);
    }

    public AccountNoLoginInException(String message, Throwable cause) {
        super(message, cause);
    }

    public AccountNoLoginInException(Throwable cause) {
        super(cause);
    }

    protected AccountNoLoginInException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
