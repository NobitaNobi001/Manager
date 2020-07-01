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
        //从session中获取学生学号
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

    //将完善信息封装为学生对象 修改数据 之后回到学生首页
    @RequestMapping("/updateInfo")
    public String updateStuNullInfo(Student student,Model model){
        boolean flag = studentService.updateStuInfoById(student);
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
    //修改密码
    @ResponseBody//ajax请求
    @RequestMapping(value = "/updatepwd", method = {RequestMethod.POST,RequestMethod.GET})
    public String updatepwd(@RequestParam("stuNumber")int stuNumber,@RequestParam("password")String oldPwd,@RequestParam("pass")String newPwd){
        if(oldPwd.equals(newPwd)){//新旧密码一致的话
            return "您输入的新密码和原密码一致，请重新输入!";
        }else if(studentService.updateStuPwd(stuNumber, oldPwd, newPwd)){//修改密码成功
            return "修改密码成功，将返回登录页面";
        }else{
            return "输入的原密码错误";
        }
    }

    @RequestMapping("/toViewCredit/{stuID}")
    public String credit(@PathVariable("stuID")int stuId,Model model){
        Student student = studentService.selectByPrimaryKey(stuId);
        model.addAttribute("student",student );
        return "credit";
    }
    @RequestMapping("/toApply/{stuID}")
    public String declare(@PathVariable("stuID")int stuId,Model model){
        Student student = studentService.selectByPrimaryKey(stuId);
        model.addAttribute("student",student );
        return "declare";
    }
}
