package com.controller;

import com.bean.Record;
import com.bean.Student;
import com.github.pagehelper.PageInfo;
import com.service.StudentService;
import com.utils.applySort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 学生首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/stuIndex")
    public String stuIndex(HttpServletRequest request, Model model) {
        //从session中获取学生学号
        Integer stuNumber = (Integer) request.getSession().getAttribute("number");
        Student student = studentService.selectStudentByStuNumber(stuNumber);
        model.addAttribute("student", student);
        return "student/student";
    }

    /**
     * 根据学生id修改信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/updateInfo/{stuID}")
    public String updateInfo(@PathVariable("stuID") int id, Model model) {
        Student student = studentService.selectByPrimaryKey(id);
        model.addAttribute("student", student);
        return "student/profile";
    }

    /**
     * 将完善信息封装为学生对象 修改数据 之后回到学生首页
     * @param student
     * @param model
     * @return
     */
    @RequestMapping("/updateStuNullInfo")
    public String updateStuNullInfo(Student student, Model model) {
        boolean flag = studentService.updateStuInfoById(student);
        return "redirect:/student/stuIndex";
    }

    /**
     * 去修改密码页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/updatepwd/{stuID}")
    public String updatepwd(Model model, @PathVariable("stuID") int id) {
        Student student = studentService.selectByPrimaryKey(id);
        model.addAttribute("student", student);
        return "student/password";
    }

    /**
     * 修改密码
     * @param stuNumber
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "/updateStupwd", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String updateStupwd(@RequestParam("stuNumber") int stuNumber, @RequestParam("password") String oldPwd, @RequestParam("pass") String newPwd) {
        if (oldPwd.equals(newPwd)) {//新旧密码一致的话
            return "您输入的新密码和原密码一致，请重新输入!";
        } else if (studentService.updateStuPwd(stuNumber, oldPwd, newPwd)) {//修改密码成功
            return "修改密码成功，将返回登录页面";
        } else {
            return "输入的原密码错误";
        }
    }

    /**
     * 去申请学分页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/applyCredit/{stuID}")
    public String applyCredit(Model model, @PathVariable("stuID") int id) {
        Student student = studentService.selectByPrimaryKey(id);
        model.addAttribute("student", student);
        return "student/creditDeclare";
    }

    /**
     * 提交学分申请
     * @param stuNumber
     * @param name
     * @param number
     * @param applyName
     * @param applyCredit
     * @param words
     * @param file
     * @param request
     * @param model
     * @return
     * @throws IOException
     */
    @RequestMapping("/apply")
    public String apply(@RequestParam("stuNumber") Integer stuNumber, @RequestParam("stuName") String name, @RequestParam("sort") String number, @RequestParam("applyName") String applyName, @RequestParam("applyCredit") Double applyCredit, @RequestParam("words") String words, @RequestParam("file") CommonsMultipartFile file, HttpServletRequest request, Model model) throws IOException {
        StringBuilder path =new StringBuilder(request.getServletContext().getRealPath("/applyImg"));
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //获取申请日期
        String date = sdf.format(d);
        //创建3级目录
        Calendar now = Calendar.getInstance();
        //获取年月日
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONDAY) + 1;//0~11
        int day = now.get(Calendar.DAY_OF_MONTH);
        String uploadingName= UUID.randomUUID().toString() +file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        path = path.append("/").append(year).append("/").append(month).append("/").append(day);
        //如果路径不保存，创建一个
        File realPath = new File(path.toString());
        if (!realPath.exists()) {
            realPath.mkdirs();
        }
        //获取文件输入流
        InputStream is = file.getInputStream();
        //获取文件输出流
        FileOutputStream os = new FileOutputStream(new File(realPath, uploadingName));
        //读取写出
        int len = 0;
        byte[] buffer = new byte[10240];
        while ((len = is.read(buffer)) != -1) {
            os.write(buffer, 0, len);
            os.flush();
        }
        os.close();
        is.close();
        //上传成功之后数据库中增加信息
        String sort = applySort.getApplyName(number);
        studentService.addCreditRecord(new Record(stuNumber, name, date, sort, year+"/"+month+"/"+day+"/"+uploadingName, applyName, applyCredit, words));
        Student student = studentService.selectStudentByStuNumber(stuNumber);
        model.addAttribute("student", student);
        return "redirect:/student/viewCredit";
    }

    /**
     * 学分列表
     * @param page
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/viewCredit")
    public String viewCredit(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpServletRequest request) throws Exception {

        Integer stuNumber = (Integer) request.getSession().getAttribute("number");

        Student student = studentService.selectStudentByStuNumber(stuNumber);
        if (page < 0) {
            page = 1;
        }

        List<Record> list = studentService.findAllBystuNumber(stuNumber, page, 5);

        PageInfo<Record> info = new PageInfo(list);

//        System.out.println("当前页码:" + info.getPageNum());
//        System.out.println("总页码:" + info.getPages());
//        System.out.println("总记录数:" + info.getTotal());
//        System.out.println("当前页有几条记录:" + info.getSize());
//        System.out.println("当前页的pageSize:" + info.getPageSize());
//        System.out.println("前一页:" + info.getPrePage());
//        System.out.println("后一页:" + info.getNextPage());
//        System.out.println("查询结果:" + info.getList());

        //查询总学分
        Double sumCredit = studentService.selectSumCreditBystuNumber(stuNumber);
        model.addAttribute("sumCredit", sumCredit);
        model.addAttribute("student", student);
        model.addAttribute("info", info);

        return "student/creditList";
    }
}