package com.exception;

/**
 * @author hbk
 * @date 2020/9/10
 **/
/*
* 导入信息失败异常
* */
public class ImportExcelException extends RuntimeException {

    public ImportExcelException() {
        super();
    }

    public ImportExcelException(String message) {
        super(message);
    }

    public ImportExcelException(String message, Throwable cause) {
        super(message, cause);
    }

    public ImportExcelException(Throwable cause) {
        super(cause);
    }

    protected ImportExcelException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
