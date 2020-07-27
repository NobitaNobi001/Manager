package com.controller;

import com.bean.Msg;
import com.bean.Record;
import com.bean.Student;
import com.bean.Teacher;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeStuService;
import com.service.RecordService;
import com.service.TeacherService;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {


    @Autowired
    private TeacherService teacherService;

    /**
     * 教工信息查询并存放到model中
     *
     * @param request
     * @param model
     */
    public void teaSelect(HttpServletRequest request, Model model) {

        //获取登陆成功的教工号
        Integer teaNumber = (Integer) request.getSession().getAttribute("number");

        //根据教工号查找教师信息
        Teacher teacher = teacherService.selectTeacherByTeaNumber(teaNumber);

        //将查找的教工信息添加到model中
        model.addAttribute("teacher", teacher);
    }

    /**
     * 教师首页
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/teaIndex")
    public String teaIndex(HttpServletRequest request, Model model) {

        teaSelect(request, model);

        //跳转到教室首页页面
        return "teacher/teacher";
    }

    /**
     * 教师个人信息
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/teaProfile")
    public String teaProfile(HttpServletRequest request, Model model) {

        teaSelect(request, model);

        //跳转到teaProfile.jsp页面
        return "teacher/profile";
    }

    /**
     * 教师修改密码页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/teaPassword")
    public String teaPassword(HttpServletRequest request, Model model) {

        teaSelect(request, model);

        //跳转到teaPassword.jsp页面
        return "teacher/password";
    }

    /**
     * 学生列表
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/stuList")
    public String stuList(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, Model model) {
        //获取登陆成功的教工号
        Integer teaNumber = (Integer) request.getSession().getAttribute("number");

        //根据教工号查找教师信息
        Teacher teacher = teacherService.selectTeacherByTeaNumber(teaNumber);

        //将查找的教工信息添加到model中
        model.addAttribute("teacher", teacher);

        //查询教师的学院id得到学院表名称
        String tableName = CollegeName.getTableName(teacher.getCollegeId());
        List<Student> students = teacherService.selectStuByCollegeName(tableName, page, 5);
        PageInfo<Record> info = new PageInfo(students);
        model.addAttribute("info", info);


        //跳转到stuList页面
        return "teacher/studentList";
    }

    /**
     * 条件查询学生
     * @param page
     * @param stuNumber
     * @param stuName
     * @param stuClass
     * @param major
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/queryStu")
    public String queryStu(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam("stuNumber") Integer stuNumber, @RequestParam("stuName") String stuName, @RequestParam("stuClass") String stuClass, @RequestParam("major") String major, Model model, HttpServletRequest request) {
        //获取登陆成功的教工号
        Integer teaNumber = (Integer) request.getSession().getAttribute("number");

        //根据教工号查找教师信息
        Teacher teacher = teacherService.selectTeacherByTeaNumber(teaNumber);

        //将查找的教工信息添加到model中
        model.addAttribute("teacher", teacher);
        String tableName = CollegeName.getTableName(teacher.getCollegeId());
        List<Student> students = teacherService.selectStuByCondition(tableName, stuNumber, stuName, stuClass, page, 5, major);
        PageInfo<Record> info = new PageInfo(students);
        model.addAttribute("info", info);
        return "teacher/studentList";
    }

    @RequestMapping("/declareManager")
    public String stuDeclareManager(HttpServletRequest request, Model model) {

        teaSelect(request, model);

        //跳转到申报审核页面
        return "teacher/declareManager";
    }

    /**
     * 更新教工的密码
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/updatePassword/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updatePassword(Teacher teacher) {

        //如果要修改的密码和原密码相同
        if (teacherService.selectByPrimaryKey(teacher.getId()).getPassword().equals(teacher.getPassword())) {
            return Msg.fail();
        } else {
            teacherService.updateTeacher(teacher);
            return Msg.success();
        }
    }

    /**
     * 更新教工的个人信息
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/updateInfo/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateInfo(Teacher teacher) {

        Teacher teacher1 = teacherService.selectByPrimaryKey(teacher.getId());

        //如果要修改的电话号码和邮箱都是相同的
        if (teacher1.getEmail().equals(teacher.getEmail()) && teacher1.getPhone().equals(teacher.getPhone()) && teacher1.getGender().equals(teacher.getGender())) {
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            teacherService.updateTeacher(teacher);

            return Msg.success();
        }
    }




}
