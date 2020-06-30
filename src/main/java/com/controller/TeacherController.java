package com.controller;


import com.bean.Teacher;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/teaIndex")
    public String adminIndex(HttpServletRequest request, Model model) {

        Integer teaNumber = (Integer) request.getSession().getAttribute("number");

        Teacher teacher = teacherService.selectUPByTeaNumber(teaNumber);

        request.getSession().setAttribute("teacher", teacher);

        return "teacher";
    }
}
