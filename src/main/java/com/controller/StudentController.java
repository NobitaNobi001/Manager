package com.controller;

import com.bean.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    //访问学生首页 根据学号来查找学生对象
    @RequestMapping("/stuIndex")
    public String stuIndex(HttpServletRequest request, Model model){

        Integer stuNumber = (Integer) request.getSession().getAttribute("number");

        Student student = studentService.selectStudentByStuNumber(stuNumber);

        model.addAttribute("student", student);

        return "student";
    }
    //根据主键来查找学生信息
    @RequestMapping("/stuInfo/{stuID}")
    public String selectByPrimaryKey(@PathVariable("stuID")int stuID,Model model){
        Student student = studentService.selectByPrimaryKey(stuID);
        model.addAttribute("student", student);
        return "profile";
    }
    //根据表单提交的数据对学生表中的性别，手机，邮箱进行更新
    @RequestMapping("/Index")
    public String updataStuNullInfo(Student student,Model model){
        boolean flag = studentService.updataStuByNullInfo(student);
        Student student1 = studentService.selectByPrimaryKey(student.getId());
        model.addAttribute("student", student1);
        return "student";
    }

}
