package com.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.bean.*;
import com.exception.ImportExcelException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.listener.ExportTeacherListener;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {


    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ExportTeacherListener teacherListener;


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
    public Msg updateInfo(Teacher teacher, HttpServletRequest request) {

        Teacher teacher1 = (Teacher) request.getSession().getAttribute("teacher");

        if ("".equals(teacher.getEmail()) || "".equals(teacher.getPhone()) || "".equals(teacher.getGender())) {

            teacherService.updateTeacher(teacher);

            Teacher teacher2 = teacherService.selectTeacherByTeaNumber(teacher1.getTeaNumber());

            request.getSession().setAttribute("teacher", teacher2);

            return Msg.success();

        }

        //如果要修改的电话号码和邮箱都是相同的
        if (teacher.getEmail().equals(teacher1.getEmail()) && teacher.getPhone().equals(teacher1.getPhone()) && teacher.getGender().equals(teacher1.getGender())) {
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            teacherService.updateTeacher(teacher);

            Teacher teacher2 = teacherService.selectTeacherByTeaNumber(teacher1.getTeaNumber());

            request.getSession().setAttribute("teacher", teacher2);

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

    @RequestMapping("/insertTeacherByExcel")
    @ResponseBody
    public Msg insertBatchTeacher(@RequestParam("ExcelFile") MultipartFile uploadExcel) {

        // 判断是否为null文件
        if (uploadExcel.getSize() == 0) {
            return Msg.fail().add("message", "请选择文件");
        }
        // 判断文件类型是否为xls
        int begin = uploadExcel.getOriginalFilename().indexOf(".");
        int last = uploadExcel.getOriginalFilename().length();
        //获得文件后缀名
        String suffix = uploadExcel.getOriginalFilename().substring(begin, last);
        if (!suffix.endsWith(".xls")) {
            return Msg.fail().add("message", "请上传xls文件,且根据模板导入");
        }

        try {
            // 工作簿
            ExcelReaderBuilder readWorkBook = EasyExcel.read(uploadExcel.getInputStream(), TeacherExcel.class, teacherListener);
            // 工作表
            ExcelReaderSheetBuilder sheet = readWorkBook.sheet();

            // 读
            sheet.doRead();

            return Msg.success().add("message", "导入成功");
        } catch (Exception e) {
            teacherListener.getTeachers().clear();
            if (e instanceof DuplicateKeyException) {
                int firstIndex = e.getMessage().indexOf("Duplicate entry");
                int endIndex = e.getMessage().indexOf("for key");
                String teacherNumberIsUsed = e.getMessage().substring(firstIndex + "Duplicate entry".length(), endIndex);
                throw new ImportExcelException("导入失败,ExceL中教师账号已存在" + teacherNumberIsUsed + "已被使用");
            } else {
                throw new ImportExcelException("导入失败,请检查excel格式");
            }
        }

    }

    /**
     * 根据学院查询出教师
     *
     * @param pn
     * @param collegeId
     * @return
     */
    @GetMapping("/teacherCondition")
    @ResponseBody
    public Msg selectTeacherWithCollege(@RequestParam("pn") Integer pn, @RequestParam("collegeId") Integer collegeId) {

        //设置起始页码和页面记录数量
        PageHelper.startPage(pn, 5);

        List<Teacher> teachers = teacherService.selectTeacherWithCollege(collegeId);

        if (teachers.size() == 0) {
            return Msg.fail();
        }
        //包装数据
        PageInfo pages = new PageInfo(teachers, 5);

        return Msg.success().add("pageInfo", pages);
    }
}