package com.exception;

public class UserPassException extends Exception {

    private String  msg;

    public UserPassException(String message) {
        super(message);
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
