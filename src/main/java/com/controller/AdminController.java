package com.controller;


import com.bean.Admin;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private WatcherService watcherService;

    /**
     * 跳转管理员首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/admIndex")
    public String adminIndex(HttpServletRequest request, Model model) {

        Integer adminNumber = (Integer) request.getSession().getAttribute("number");

        //查询出管理员的基本信息
        Admin admin = adminService.selectAdminByAdminNumber(adminNumber);

        //查询出申报记录数量
        Integer records = recordService.selectCountRecord();

        //查询教师数量
        Integer teachers = teacherService.selectCountTeacher();

        //查询出学生数量
        Integer students = studentService.selectCountStudent();
        //查询出督察数量
        Integer watchers = watcherService.selectCountWatcher();

        //管理员的基本信息
        model.addAttribute("admin", admin);
        //申报记录数量
        model.addAttribute("records", records);
        //教师数量
        model.addAttribute("teachers", teachers);
        //学生数量
        model.addAttribute("students", students);
        //督察数量
        model.addAttribute("watchers", watchers);


        return "admin/admin";
    }

    /**
     * 申报管理界面
     * @return
     */
    @RequestMapping("/decManager")
    public String declareManager(){

        return "admin/declareManager";
    }

    /**
     * 学生管理界面
     * @return
     */
    @RequestMapping("/stuManager")
    public String studentManager(){

        return "admin/studentManager";
    }

    /**
     * 教师管理界面
     * @return
     */
    @RequestMapping("teaManager")
    public String teacherManager(){

        return "admin/teacherManager";
    }

    /**
     * 督察管理界面
     * @return
     */
    @RequestMapping("/watManager")
    public String watcherManager(){

        return "admin/watcherManager";
    }

    /**
     * 督察个人信息界面
     * @return
     */
    @RequestMapping("/admProfile")
    public String adminProdile(){

        return "admin/profile";
    }
}
