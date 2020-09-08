package com.controller;

import com.bean.Msg;
import com.bean.Record;
import com.bean.Student;
import com.constant.StringConstant;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.service.StudentService;
import com.utils.DeclareSortUtil;
import com.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     修改学生个人信息
     */
    @RequestMapping("/updateStuNullInfo.html")
    public String updateStuNullInfo(Student student, HttpSession session) {
        studentService.updateStuInfoById(student);
        // 修改完信息之后重新存入session中
        Student stu = studentService.selectStuByPrimaryKey(student.getId());
        session.setAttribute(StringConstant.STUDENT_TYPE,stu);
        // 返回学生首页
        return "redirect:/student/stuIndex";
    }

    /**
     * 修改密码
     */
    @PostMapping(value = "/updateStuPassword.html")
    @ResponseBody
    public Msg updateStuPassword(@RequestParam("stuNumber") int stuNumber, @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword) {
        if (studentService.updateStuPwd(stuNumber, oldPassword, newPassword)) {//修改密码成功
            return Msg.success().add("result","修改密码成功，您将返回登录页面");
        } else {
            return Msg.fail().add("result", "输入的原密码错误,请重新输入");
        }
    }


    /*
    * 去学分申请页面并且存储下拉框属性
    * */
    @RequestMapping("/applyCreditWithSort/sort/{sort}/.html")
    public String applyCredit(@PathVariable("sort") Integer sort,HttpSession session) {
        session.setAttribute(StringConstant.APPLY_TYPE, DeclareSortUtil.getApplySort(sort));
        System.out.println(DeclareSortUtil.getApplySort(sort));
        return "student/creditDeclare";
    }


    /**
     * 提交学分申请
     */
    @RequestMapping(value = "/apply.html",method = RequestMethod.POST)
    @ResponseBody
    public String apply(
            @RequestParam("stuNumber") Integer stuNumber,
            @RequestParam("stuName") String stuName,
            @RequestParam("sort") String sort,
            @RequestParam("applyName") String applyName,
            @RequestParam("applyCredit") Double applyCredit,
            @RequestParam("words") String words,
            @RequestParam("file") CommonsMultipartFile file,
            HttpServletRequest request
    ){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try{
            // 项目路径
           String BasePath=request.getServletContext().getRealPath("/applyImg");
            if(!file.isEmpty()) {
                // 创建日历对象
                Calendar now = Calendar.getInstance();
                // 获取年月日
                int year = now.get(Calendar.YEAR);
                int month = now.get(Calendar.MONDAY) + 1;//0~11
                int day = now.get(Calendar.DAY_OF_MONTH);
                // 创建3级目录
                String RealPath=BasePath+"/"+year+"/"+month+"/"+day; // 文件真实路径
                // 数据库中文件名
                String fileName = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
                // 在系统中创建图片文件
                File fi = new File(RealPath, fileName);       //将path路径与图片名称联系在一起
                // 判断是否存在path路径下的文件夹
                if (!fi.getParentFile().exists()) {
                    // 不存在创建path路径下的文件夹
                    fi.getParentFile().mkdirs();
                }
                // 上传图片
                file.transferTo(fi);
                // 创建日期
                Date d = new Date();
                // 日期格式化
                String date = sdf.format(d);
                Record record = new Record(null, stuNumber, stuName, date, sort, year + "/" + month + "/" + day + "/" + fileName, applyName, applyCredit, words, null, null, null);
                // 保存在数据库中
                studentService.addCreditRecord(record);
            }
        }catch (Exception e){
             return JsonUtil.getJson(Msg.fail().add("result", "申报成功,请等待审核"));
        }
        return JsonUtil.getJson(Msg.success().add("result", "申报失败，请重新申报"));
    }

    /**
     * 学分列表
     */
    @RequestMapping("/viewCredit.html")
    public String viewCredit(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpServletRequest request) throws Exception {
        // 得到学生对象
        Student student= (Student) request.getSession().getAttribute(StringConstant.STUDENT_TYPE);
        // 查询学分列表
        List<Record> list = studentService.findAllRecordByStuNumber(student.getStuNumber(), page, 5);
        // 封装成pageInfo
        PageInfo<Record> info = new PageInfo(list);

        //查询总学分
        Double sumCredit = studentService.selectSumCreditByStuNumber(student.getStuNumber());
        model.addAttribute("sumCredit", sumCredit);
        model.addAttribute("info", info);
        return "student/creditList";
    }

    // 根据id查询学生信息 未用
    @RequestMapping("/toQueryStuInfoById/{stuID}")
    @ResponseBody
    public Msg toQueryStuInfoById(@PathVariable("stuID") Integer stuId) {
        Student student = studentService.selectStuByPrimaryKey(stuId);
        return Msg.success().add("student", student);
    }

    // 查看学号是否存在  未用
    @RequestMapping("/checkStuNumberIsExists")
    @ResponseBody
    public String checkStuNumberIsExists(@RequestParam("stuNumber") Integer stuNumber) throws JsonProcessingException {
        boolean flag = !(studentService.checkStudent(stuNumber));
        Map map = new HashMap();
        map.put("valid", flag);
        ObjectMapper objectMapper = new ObjectMapper();
        String result = objectMapper.writeValueAsString(map);
        return result;
    }
}