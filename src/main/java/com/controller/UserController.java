package com.controller;

import com.shrio.token.LoginToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {


    /**
     * 检验用户名密码是否匹配
     *
     * @param Number   用户名
     * @param password 密码
     * @param type     身份类型
     */
    @RequestMapping(value = "/checkuser", method = RequestMethod.POST)
    public String checkUser(@RequestParam("Number") Integer Number, @RequestParam("password") String password, @RequestParam("type") String type, HttpServletRequest request) {

        //1、获取实体对象
        Subject subject = SecurityUtils.getSubject();


        //2、将用户名 密码 用户类型 封装为一个Token对象
        LoginToken token = new LoginToken(Number, password, type);

        try {

            //3、进行登录认证
            subject.login(token);

            //4.认证成功后将用户名信息保存到session
            request.getSession().setAttribute("number", Number);

            //5.将用户类型转换为小写 以便进行页面跳转
            String page = type.toLowerCase();

            //实现页面的重定向
            return "redirect:/" + page + "/" + page.substring(0, 3) + "Index";

        } catch (AuthenticationException e) {   //认证失败

            request.getSession().setAttribute("msg", "用户名或密码错误");
        }

        //若登陆失败重定向到登录页面
        return "redirect:/login.jsp";
    }

    @RequestMapping("/forgetPassword")
    public String forgetPassword(){

        return "forget";
    }

}