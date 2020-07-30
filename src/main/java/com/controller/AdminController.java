package com.controller;


import com.bean.Admin;
import com.bean.Record;
import com.github.pagehelper.PageInfo;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


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
     *
     * @return
     */
    @RequestMapping("/admProfile")
    public String adminProdile() {

        return "admin/profile";
    }

    /**
     * @Description: 学分记录表默认页面
     * @return:
     */
    @RequestMapping("/toSee/studentRecord.html")
    public String getAllStudentRecord(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model, HttpServletRequest request) {
        List<Record> allRecord = recordService.getAllRecordByadmin(page, 5);
        PageInfo<Record> info = new PageInfo(allRecord);
        request.setAttribute("direction", "toSee");
        model.addAttribute("info", info);
        return "admin/declareManager";
    }

    /**
     * @Description: 根据学院专业班级查到学生id后，查询学生的申报记录
     * @return:
     */
    @RequestMapping("/toQuery/studentRecord.html")
    public String getStudentRecordByFormSelect(@RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "college", required = false) Integer collegeId, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "stuClass", required = false) Integer stuClass, Model model, HttpServletRequest request) {
        List<Record> allRecordByadminQuery = recordService.getAllRecordByadminQuery(page, 5, collegeId, major, stuClass);
        PageInfo<Record> info = new PageInfo(allRecordByadminQuery);
        request.setAttribute("direction", "toQuery");
        request.setAttribute("college", collegeId);
        request.setAttribute("major", major);
        request.setAttribute("stuClass", stuClass);
        model.addAttribute("info", info);
        return "admin/declareManager";
    }
}
