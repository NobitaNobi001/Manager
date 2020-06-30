package com.controller;

import com.bean.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    //学生首页
    @RequestMapping("/stuIndex")
    public String stuIndex(HttpServletRequest request, Model model){

        Integer stuNumber = (Integer) request.getSession().getAttribute("number");

        Student student = studentService.selectStudentByStuNumber(stuNumber);

        model.addAttribute("student", student);

        return "student";
    }

    //去完善信息页面
    @RequestMapping("/toupdateInfo/{stuID}")
    public String selectByPrimaryKey(@PathVariable("stuID")int stuID,Model model){
        Student student = studentService.selectByPrimaryKey(stuID);
        model.addAttribute("student", student);
        return "profile";
    }

    //完善信息之后回到首页
    @RequestMapping("/updateInfo")
    public String updataStuNullInfo(Student student,Model model){
        boolean flag = studentService.updataStuByNullInfo(student);
        Student student1 = studentService.selectByPrimaryKey(student.getId());
        model.addAttribute("student", student1);
        return "redirect:/student/stuIndex";
    }
    //去修改密码页面
    @RequestMapping("/toupdatepwd/{stuID}")
    public String updatepwd(@PathVariable("stuID")int stuId,Model model){
        Student student = studentService.selectByPrimaryKey(stuId);
        model.addAttribute("student",student);
        return "password";
    }
    //修改密码后去登录页面
    @ResponseBody
    @RequestMapping(value = "/updatepwd", method = {RequestMethod.POST,RequestMethod.GET})
    public String updatepwd(@RequestParam("stuNumber")int stuNumber,@RequestParam("password")String oldPwd,@RequestParam("pass")String newPwd){
        if(studentService.updateStuPwd(stuNumber, oldPwd, newPwd)){//修改密码成功
            return "修改密码成功，将返回登录页面";
        }else{
            return "输入的原密码错误";
        }
    }
}
