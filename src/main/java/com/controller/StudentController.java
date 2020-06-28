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

    @RequestMapping("/stuIndex")
    public String stuIndex(HttpServletRequest request, Model model){

        Integer stuNumber = (Integer) request.getSession().getAttribute("number");

        Student student = studentService.selectStudentByStuNumber(stuNumber);

        model.addAttribute("student", student);

        return "student";
    }
}
