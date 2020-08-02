package com.controller;

import com.bean.*;
import com.github.pagehelper.Page;
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
     *
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
     *
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

    /**
     * 查询出所有教师
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/teachers", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectTeachers(@RequestParam(defaultValue = "1", value = "pn") Integer pn) {

        //设置起始页码以及每页的记录条数
        PageHelper.startPage(pn, 5);

        List<Teacher> teachers = teacherService.selectTeachers();

        //如果没有督察信息
        if (teachers.size() == 0) {
            return Msg.fail();
        }

        //封装为page对象
        PageInfo pages = new PageInfo(teachers, 5);

        return Msg.success().add("pageInfo", pages);
    }

    /**
     * 检查教师账号是否可用
     *
     * @param teaNumber
     * @return
     */
    @RequestMapping(value = "/checkTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkTeacher(@RequestParam("teaNumber") Integer teaNumber) {

        boolean flag = teacherService.checkTeacher(teaNumber);

        if (flag) {
            return Msg.success();
        } else {
            return Msg.fail().add("msg", "教师账号已存在");
        }
    }

    /**
     * 新增单个教师
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/insertTeacher", method = RequestMethod.POST)
    @ResponseBody
    public Msg insertTeacher(Teacher teacher) {

        teacher.setPassword(String.valueOf(teacher.getTeaNumber()));
        teacherService.insertTeacher(teacher);

        return Msg.success();

    }

    /**
     * 删除单个教师信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteTeacher/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteTeacher(@PathVariable("id") Integer id) {

        teacherService.deleteTeacher(id);

        return Msg.success();
    }

    /**
     * 根据主键查询单个教师的信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/getTeacher/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getTeacher(@PathVariable("id") Integer id) {

        Teacher teacher = teacherService.selectByPrimaryKey(id);

        return Msg.success().add("teacherInfo", teacher);
    }

    /**
     * 根据主键更新教工信息
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/updateTeacher/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateTeacher(Teacher teacher) {

        teacherService.updateTeacher(teacher);

        return Msg.success();
    }

    /**
     * 条件查询
     * @param pn 起始页码
     * @param collegeId 学院id
     * @param keywords 关键字
     * @return
     */
    @RequestMapping(value = "/searchTeachers", method = RequestMethod.GET)
    @ResponseBody
    public Msg findTeachers(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam("collegeId") Integer collegeId, @RequestParam("keywords") String keywords) {

        //设置起始页码和页面记录数量
        PageHelper.startPage(pn, 5);

        //根据条件查询出所有教师
        List<Teacher> teachers = teacherService.selectTeacherWithCondition(collegeId, keywords);

        if (teachers.size() == 0) {
            return Msg.fail();
        }
        //包装数据
        PageInfo pages = new PageInfo(teachers, 5);

        return Msg.success().add("pageInfo", pages);
    }

}
