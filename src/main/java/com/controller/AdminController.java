package com.controller;

import com.bean.Admin;
import com.bean.Msg;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admins")
    @ResponseBody
    public Msg getAdmins() {
        List<Admin> list = adminService.getAdmins();
        return Msg.success().add("admins", list);
    }
}
