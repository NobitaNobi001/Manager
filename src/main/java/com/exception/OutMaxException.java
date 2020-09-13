package com.exception;

public class OutMaxException extends RuntimeException {

    public OutMaxException(String message) {
        super();
    }

    public OutMaxException(String message, Throwable cause) {
        super(message, cause);
    }

    public OutMaxException(Throwable cause) {
        super(cause);
    }

    protected OutMaxException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
