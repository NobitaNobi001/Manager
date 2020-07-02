package com.controller;

import com.bean.Credit;
import com.bean.Record;
import com.bean.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

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
    public String toViewCredit(@PathVariable("stuID")int stuId,Model model){
        Student student = studentService.selectByPrimaryKey(stuId);
        model.addAttribute("student",student );
        return "credit";
    }
    @RequestMapping("/toApply/{stuID}")
    public String toApply(@PathVariable("stuID")int stuId,Model model){
        Student student = studentService.selectByPrimaryKey(stuId);
        model.addAttribute("student",student );
        return "declare";
    }

    @RequestMapping("/credit")
    //提交数据 学号 姓名 申请日期 申请类型 申请材料  申请学分 申请描述(可以为null) 审核学分(教师出处理)  审核老师(教师处理)
    public String apply(@RequestParam("stuNumber")Integer stuNumber,@RequestParam("stuName")String name,@RequestParam("sort")String number,@RequestParam("applyCredit") Double applyCredit,@RequestParam("words")String words,@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request,Model model) throws IOException {
        StringBuilder path=new StringBuilder(request.getServletContext().getRealPath("/WEB-INF/apply"));
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //获取申请日期
        String date = sdf.format(d);
        //获取文件名：file.getOriginalFilename()
        String uploadFileName=file.getOriginalFilename();
        //上传路径保存设置 (保存在WEB-INF下面的apply文件夹)
        //创建3级目录
        Calendar now = Calendar.getInstance();
        //获取年月日
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONDAY) + 1;//0~11
        int day=now.get(Calendar.DAY_OF_MONTH);
        path=path.append("/").append(year).append("/").append(month).append("/").append(day);
        //如果路径不保存，创建一个
        File realPath=new File(path.toString());
        if(!realPath.exists()){
            realPath.mkdirs();
        }
        //获取文件输入流
        InputStream is=file.getInputStream();
        //获取文件输出流
        FileOutputStream os = new FileOutputStream(new File(realPath,uploadFileName));
        //读取写出
        int len=0;
        byte[]buffer=new byte[10240];
        while((len=is.read(buffer))!=-1){
            os.write(buffer, 0, len);
            os.flush();
        }
        os.close();
        is.close();
        //上传成功之后数据库中增加信息
        String sort="";
        switch (Integer.valueOf(number)){
            case 1:sort="大学生学科竞赛活动（含大学生创新创业训练项目）";break;
            case 2:sort="大学生文体竞赛活动";break;
            case 3:sort="创新创业实践训练";break;
            case 4:sort="论文、专利、作品发表";break;
            case 5:sort="职业（等级）证书";break;
            case 6:sort="参与教师科研（或实验室工作）";break;
            case 7:sort="社会实践（调查）";break;
            case 8:sort="读书活动";break;
            case 9:sort="学生工作与社团活动";break;
            case 10:sort="专业认定的其他创新实践活动";break;
        }
        studentService.addCreditRecord(new Record(stuNumber,name,date,sort,path.append("/").append(uploadFileName).toString(),applyCredit,words));
        Student student = studentService.selectStudentByStuNumber(stuNumber);
        model.addAttribute("student",student );
        return "credit";
    }
}
