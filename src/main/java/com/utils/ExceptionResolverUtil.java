package com.utils;

import com.bean.Msg;
import com.constant.StringConstant;

import com.exception.ImportExcelStuException;
import com.exception.ExportStuException;
import com.exception.OutMaxException;
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

    // 登录失败异常
    @ExceptionHandler(value = UnknownAccountException.class)
    public ModelAndView UnknownAccountException(UnknownAccountException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName = "forward:/login.jsp";
        return commonResolver(viewName, exception, request, response);
    }

    @ExceptionHandler(value = IncorrectCredentialsException.class)
    public ModelAndView IncorrectCredentialsException(IncorrectCredentialsException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName = "forward:/login.jsp";
        return commonResolver(viewName, exception, request, response);
    }

    // 导入学生excel异常
    @ExceptionHandler(value = ImportExcelStuException.class)
    public ModelAndView ImportExcelStuException(ImportExcelStuException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName = "admin/studentManager";
        return commonResolver(viewName, exception, request, response);
    }

    // 导出学生excel异常
    @ExceptionHandler(value = ExportStuException.class)
    public ModelAndView ExportExcelStuException(ExportStuException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String viewName = "admin/declareManager";
        return commonResolver(viewName, exception, request, response);
    }


    // 通用异常
    @ExceptionHandler(value = RuntimeException.class)
    public ModelAndView Exception(
            Exception exception,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        String viewName = "common/404";
        return commonResolver(viewName, exception, request, response);
    }

    // 超出数据异常
    @ExceptionHandler(value = OutMaxException.class)
    public ModelAndView OutMaxException(
            Exception exception,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        String viewName = "admins/studentList";
        return commonResolver(viewName, exception, request, response);
    }


    // 将方法封装
    private ModelAndView commonResolver(String viewName, Exception exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 判断当前请求的类型
        boolean isAjaxType = JudgeRequestTypeUtil.getType(request);
        // 如果是ajax请求
        if (isAjaxType) {
            // 转为字符串
            String json = JsonUtil.getJson(Msg.fail().add("message", exception.getMessage()));
            // 将字符串返回给浏览器
            response.getWriter().write(json);
            // 由于response已经做出了响应，所以不使用ModelAndView对象
            return null;
        } else {
            // 如果不是ajax请求
            ModelAndView modelAndView = new ModelAndView();
            // 将Exception存入模型
            modelAndView.addObject(StringConstant.COMMON_EXCEPTION_NAME, exception);
            // 设置对应的视图名称
            modelAndView.setViewName(viewName);
            return modelAndView;
        }
    }
}