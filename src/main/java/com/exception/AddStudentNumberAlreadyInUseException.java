package com.exception;

/**
 * @author hbk
 * @date 2020/8/31
 **/
// 新增学生时学号已经被使用异常
public class AddStudentNumberAlreadyInUseException extends RuntimeException {
    public AddStudentNumberAlreadyInUseException() {
        super();
    }

    public AddStudentNumberAlreadyInUseException(String message) {
        super(message);
    }

    public AddStudentNumberAlreadyInUseException(String message, Throwable cause) {
        super(message, cause);
    }

    public AddStudentNumberAlreadyInUseException(Throwable cause) {
        super(cause);
    }

    protected AddStudentNumberAlreadyInUseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
