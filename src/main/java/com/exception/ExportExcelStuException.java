package com.exception;

/**
 * @author hbk
 * @date 2020/9/10
 **/
/*
* 导入学生信息失败异常
* */
public class ExportExcelStuException extends RuntimeException {
    public ExportExcelStuException() {
        super();
    }

    public ExportExcelStuException(String message) {
        super(message);
    }

    public ExportExcelStuException(String message, Throwable cause) {
        super(message, cause);
    }

    public ExportExcelStuException(Throwable cause) {
        super(cause);
    }

    protected ExportExcelStuException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
