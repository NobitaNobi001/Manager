package com.controller;

import com.bean.Msg;
import com.bean.Teacher;
import com.bean.User;
import com.service.AdminService;
import com.service.StudentService;
import com.service.TeacherService;
import com.service.WatcherService;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private WatcherService watcherService;

    //判断用户名是否和密码匹配
    boolean isSuccess;

    /**
     * 检验用户名密码是否匹配
     *
     * @param stuNumber 用户名
     * @param password  密码
     * @param type      身份类型
     */
    @RequestMapping(value = "/checkuser", method = RequestMethod.POST)
    public String checkUser(@RequestParam("stuNumber") Integer stuNumber, @RequestParam("password") String password, @RequestParam("type") Integer type, HttpServletRequest httpServletRequest) {

        //学生身份
        if (type == 1) {

            //判断查询是否成功
            isSuccess = studentService.check(stuNumber, password);

            if (isSuccess) {    //如果用户名和密码成功匹配
                //重定向到学生的首页
                return "redirect:/student/index";

            } else {    //失败就向session中存放失败的信息 前台可以获取到
                httpServletRequest.getSession().setAttribute("msg", "用户名或密码错误");
                return "redirect:/login.jsp";
            }
        } else if (type == 2) {     //教师身份

        } else if (type == 3) {     //管理员身份

        } else if (type == 4) {     //督察身份

        }

        return "";
    }

}
