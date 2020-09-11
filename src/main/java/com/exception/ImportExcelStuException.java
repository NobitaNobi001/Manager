package com.exception;

/**
 * @author hbk
 * @date 2020/9/10
 **/
/*
* 导入学生信息失败异常
* */
public class ImportExcelStuException extends RuntimeException {

    public ImportExcelStuException() {
        super();
    }

    public ImportExcelStuException(String message) {
        super(message);
    }

    public ImportExcelStuException(String message, Throwable cause) {
        super(message, cause);
    }

    public ImportExcelStuException(Throwable cause) {
        super(cause);
    }

    protected ImportExcelStuException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
