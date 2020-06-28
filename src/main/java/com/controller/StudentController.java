package com.controller;

import com.bean.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/index")
    public String stuIndex(HttpServletRequest request, Model model){
        Integer stuNumber = (Integer) request.getSession().getAttribute("stu_number");
        Student student = studentService.selectByPrimaryKey(stuNumber);
        model.addAttribute("student", student);
        return "student";
    }
}
