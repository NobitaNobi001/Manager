package com.controller;

import com.bean.CreditDetail;
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
     * 功能描述:学生修改个人信息
     *
     * @Param:[student, session]
     * @Return:java.lang.String
     * @Author:h1656
     * @Date:2020/9/8 16:08
     */
    @RequestMapping("/updateStuNullInfo.html")
    public String updateStuNullInfo(Student student, HttpSession session) {
        studentService.updateStuInfoById(student);
        // 修改完信息之后重新存入session中
        Student stu = studentService.selectStuByPrimaryKey(student.getId());
        session.setAttribute(StringConstant.STUDENT_TYPE,stu);
        // 返回学生首页
        return "redirect:/student/index";
    }

    /**
     *功能描述:学生修改个人密码
     *@Param:[stuNumber, oldPassword, newPassword]
     *@Return:com.bean.Msg
     *@Author:h1656
     *@Date:2020/9/8 16:08
     */
    @PostMapping(value = "/updateStuPassword.html")
    @ResponseBody
    public String updateStuPassword(@RequestParam("stuNumber") int stuNumber, @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword) {
        if (studentService.updateStuPwd(stuNumber, oldPassword, newPassword)) {//修改密码成功
            return JsonUtil.getJson(Msg.success().add("result", "修改密码成功，您将返回登录页面"));
        } else {
            return JsonUtil.getJson(Msg.fail().add("result", "输入的原密码错误,请重新输入"));
        }
    }


    /**
     * 功能描述:首页到学分申请页  存储下拉框属性
     *
     * @Param:[sort, session]
     * @Return:java.lang.String
     * @Author:h1656
     * @Date:2020/9/8 16:07
     */
    @RequestMapping("/applyCreditWithSort/sort/{sort}/.html")
    public String applyCredit(@PathVariable("sort") Integer sort, HttpSession session) {
        session.setAttribute(StringConstant.APPLY_TYPE, DeclareSortUtil.getApplySort(sort));
        System.out.println(DeclareSortUtil.getApplySort(sort));
        return "student/creditDeclare";
    }


    /**
     *功能描述:学生申报创新学分记录
     *@Param:[stuNumber, stuName, sort, applyName, applyCredit, words, file, request]
     *@Return:java.lang.String
     *@Author:h1656
     *@Date:2020/9/8 16:07
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
        } catch (Exception e) {
            return JsonUtil.getJson(Msg.fail().add("result", "申报失败，请重新申报"));
        }
        return JsonUtil.getJson(Msg.success().add("result", "申报成功,请等待审核,即将返回学分列表页面"));
    }

    /**
     *功能描述:学生查看创新学分列表
     *@Param:[page, model, request]
     *@Return:java.lang.String
     *@Author:h1656
     *@Date:2020/9/8 16:07
     */
    @RequestMapping("/viewCredit.html")
    public String viewCredit(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpServletRequest request) throws Exception {
        // 得到学生对象
        Student student = (Student) request.getSession().getAttribute(StringConstant.STUDENT_TYPE);
        // 查询学分列表
        PageInfo<Record> info = studentService.findAllRecordByStuNumber(student.getStuNumber(), page, 5);
        //查询总学分
        Double sumCredit = studentService.selectSumCreditByStuNumber(student.getStuNumber());
        model.addAttribute("sumCredit", sumCredit);
        model.addAttribute("info", info);
        return "student/creditList";
    }

    // 查看创新总学分明细
    @RequestMapping("/checkCreditDetail")
    @ResponseBody
    public String checkCreditDetail(@RequestParam("stuNumber") Integer stuNumber) {
        List<CreditDetail> list = studentService.selectCreditRecordGroupBySort(stuNumber);
        String json = JsonUtil.getJson(list);
        return json;
    }
}