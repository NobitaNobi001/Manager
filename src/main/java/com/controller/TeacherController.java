package com.controller;

import com.bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.TeacherService;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {


    @Autowired
    private TeacherService teacherService;

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

        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");

        //查询教师的学院id得到学院表名称
        String tableName = CollegeNameUtil.getTableName(teacher.getCollegeId());
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

        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");

        String tableName = CollegeNameUtil.getTableName(teacher.getCollegeId());

        List<Student> students = teacherService.selectStuByCondition(tableName, stuNumber, stuName, stuClass, page, 5, major);

        PageInfo<Record> info = new PageInfo(students);

        model.addAttribute("info", info);

        return "teacher/studentList";
    }


    /**
     * 更新教工的密码
     *
     * @param oldPass 旧密码
     * @param newPass 新密码
     * @param resPass 重复输入的新密码
     * @param request
     * @return
     */
    @PutMapping(value = "/updatePassword/{id}")
    @ResponseBody
    public Msg updatePassword(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("resPass") String resPass, HttpServletRequest request) {

        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");


        if (!(newPass.equals(resPass))) {
            return Msg.fail().add("msg", "两次密码输入不一致!");
        } else if (!(teacher.getPassword().equals(oldPass))) {
            return Msg.fail().add("msg", "原密码输入错误!");
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
    @PutMapping(value = "/updateInfo/{id}")
    @ResponseBody
    public Msg updateInfo(Teacher teacher,HttpServletRequest request) {

        Teacher teacher1 = (Teacher) request.getSession().getAttribute("teacher");

        //如果要修改的电话号码和邮箱都是相同的
        if (teacher1.getEmail().equals(teacher.getEmail()) && teacher1.getPhone().equals(teacher.getPhone()) && teacher1.getGender().equals(teacher.getGender())) {
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            teacherService.updateTeacher(teacher);

            Teacher teacher2 = teacherService.selectTeacherByTeaNumber(teacher1.getTeaNumber());

            request.getSession().setAttribute("teacher",teacher2);

            return Msg.success();
        }
    }

    /**
     * 查询出所有教师
     *
     * @param pn
     * @return
     */
    @GetMapping(value = "/teachers")
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
    @PostMapping(value = "/checkTeacher")
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
    @PostMapping(value = "/insertTeacher")
    @ResponseBody
    public Msg insertTeacher(Teacher teacher) {

        teacher.setPassword(String.valueOf(teacher.getTeaNumber()));
        teacherService.insertTeacher(teacher);

        return Msg.success();

    }


    /**
     * 删除单个及多个教师信息
     *
     * @param id
     * @return
     */
    @DeleteMapping(value = "/deleteTeacher/{id}")
    @ResponseBody
    public Msg deleteTeacher(@PathVariable("id") String id) {

        if (id.contains("-")) {

            //存放待删除id
            List<Integer> delete_ids = new ArrayList<>();

            //将传过来的id进行格式化
            String[] ids = id.split("-");

            //存到集合中
            for (String temp : ids) {
                delete_ids.add(Integer.valueOf(temp));
            }

            //批量删除
            teacherService.batchDeleteTeachers(delete_ids);

        } else {
            teacherService.deleteTeacher(Integer.parseInt(id));
        }


        return Msg.success();
    }

    /**
     * 根据主键查询单个教师的信息
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/getTeacher/{id}")
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
    @PutMapping(value = "/updateTeacher/{id}")
    @ResponseBody
    public Msg updateTeacher(Teacher teacher) {

        teacherService.updateTeacher(teacher);

        return Msg.success();
    }

    /**
     * 条件查询
     *
     * @param pn        起始页码
     * @param collegeId 学院id
     * @param keywords  关键字
     * @return
     */
    @GetMapping(value = "/searchTeachers")
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
