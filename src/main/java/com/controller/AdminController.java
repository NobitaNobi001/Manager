package com.controller;

import com.bean.Admin;
import com.bean.Msg;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和管理员相关的请求
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin")
    @ResponseBody
    public Msg getAdmins(){
        List<Admin> admin = adminService.getAdmins();
        return Msg.success().add("admins",admin);
    }
}
