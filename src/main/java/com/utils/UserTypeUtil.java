package com.utils;

/**
 * 用户类型的枚举类
 */
public enum UserTypeUtil {

    Student, Teacher, Watcher, Admin;

    public static String getUserType(int value) {
        return values()[value - 1].toString();
    }
}
