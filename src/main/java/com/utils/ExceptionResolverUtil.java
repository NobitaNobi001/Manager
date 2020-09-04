package com.utils;

import com.bean.Msg;
import com.constant.StringConstant;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author hbk
 * @date 2020/7/20
 **/
/*
* 这个类用来注解式声明异常处理类
* */
@ControllerAdvice
public class ExceptionResolverUtil {
    // 用户不存在异常
    @ExceptionHandler(value = UnknownAccountException.class)
    public ModelAndView resolveUnknownAccountException(UnknownAccountException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName="/login";
        return commonResolver(viewName, exception, request, response);
    }

    // 密码错误异常
    @ExceptionHandler(value = IncorrectCredentialsException.class)
    public ModelAndView resolveIncorrectCredentialsException(IncorrectCredentialsException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName="/login";
        return commonResolver(viewName, exception, request, response);
    }


    @ExceptionHandler(value = Exception.class)
    public ModelAndView UserUpdateOrResolveMathOrNotLoggedOrAssignException(
            Exception exception,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        String viewName = "common.404";
        return commonResolver(viewName, exception, request, response);
    }

    // 将方法封装
    private ModelAndView commonResolver(String viewName, Exception exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 判断当前请求的类型
        boolean isAjaxType = JudgeRequestTypeUtil.getType(request);
        // 如果是ajax请求
        if(isAjaxType){
            // 创建ResultEntity对象,将异常信息存放
            Msg.fail().add("failed",exception.getMessage());
            // 转为字符串
            String json = jsonUtil.getJson(request);
            // 将字符串返回给浏览器
            response.getWriter().write(json);
            // 由于response已经做出了响应，所以不使用ModelAndView对象
            return  null;
        }else{
            // 如果不是ajax请求
            ModelAndView modelAndView=new ModelAndView();
            // 将Exception存入模型
            modelAndView.addObject(StringConstant.COMMON_EXCEPTION_NAME,exception);
            // 设置对应的视图名称
            modelAndView.setViewName(viewName);
            return modelAndView;
        }
    }
}