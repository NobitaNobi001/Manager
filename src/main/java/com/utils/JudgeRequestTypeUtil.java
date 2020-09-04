package com.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * @author hbk
 * @date 2020/8/31
 **/
public class JudgeRequestTypeUtil {
    public static boolean getType(HttpServletRequest request){
        //1、获取请求消息头
        String accept = request.getHeader("Accept");
        String XRequestHeader = request.getHeader("X-Requested-With");
        //2、判断
        return ((accept!=null&&accept.contains("application/json"))||(XRequestHeader!=null&&XRequestHeader.equals("XMLHttpRequest")));
    }

}
