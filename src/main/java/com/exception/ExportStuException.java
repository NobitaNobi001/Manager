package com.exception;

/**
 * @author hbk
 * @date 2020/9/11
 **/
/*
 * 导出学生申报记录异常
 * */
public class ExportStuException extends RuntimeException{
    public ExportStuException() {
        super();
    }

    public ExportStuException(String message) {
        super(message);
    }

    public ExportStuException(String message, Throwable cause) {
        super(message, cause);
    }

    public ExportStuException(Throwable cause) {
        super(cause);
    }

    protected ExportStuException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
