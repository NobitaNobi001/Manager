package com.controller;


import com.shrio.token.LoginToken;
import com.utils.UserTypeUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {


    /**
     * 检验用户名密码是否匹配
     *
     * @param number   用户名
     * @param password 密码
     * @param type     身份类型
     */
    @PostMapping(value = "/login")
    public String checkUser(@RequestParam("stuNumber") Integer number, @RequestParam("password") String password, @RequestParam("type") Integer type, HttpServletRequest request) {

        //1、获取实体对象
        Subject subject = SecurityUtils.getSubject();

        //2、根据前台传入的值获取用户类型
        String loginType = UserTypeUtil.getUserType(type);

        //3、将用户名 密码 用户类型 封装为一个Token对象
        LoginToken token = new LoginToken(number, password, loginType);

            //4、进行登录认证
            subject.login(token);

            //6.将用户类型转换为小写 以便进行页面跳转
            String page = loginType.toLowerCase();

            //实现页面的重定向
            return "redirect:/" + page + "/" + page.substring(0, 3) + "Index";

    }
}