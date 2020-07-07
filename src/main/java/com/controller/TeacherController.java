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
    @Autowired
    private CollegeStuService collegeStuService;
    @Autowired
    private RecordService recordService;

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

        //跳转到teacher.jsp页面
        return "teacher";
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
        return "teaProfile";
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
        return "teaPassword";
    }

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
        return "stuList";
    }

    @RequestMapping("/queryStu")
    public String queryStu(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam("stuNumber") Integer stuNumber, @RequestParam("stuName") String stuName, @RequestParam("stuClass") String stuClass, Model model, HttpServletRequest request) {
        //获取登陆成功的教工号
        Integer teaNumber = (Integer) request.getSession().getAttribute("number");

        //根据教工号查找教师信息
        Teacher teacher = teacherService.selectTeacherByTeaNumber(teaNumber);

        //将查找的教工信息添加到model中
        model.addAttribute("teacher", teacher);
        String tableName = CollegeName.getTableName(teacher.getCollegeId());
        List<Student> students = teacherService.selectStuByCondition(tableName, stuNumber, stuName, stuClass, page, 5);
        PageInfo<Record> info = new PageInfo(students);
        model.addAttribute("info", info);
        return "stuList";
    }

    @RequestMapping("/declareManager")
    public String stuDeclareManager(HttpServletRequest request, Model model) {

        teaSelect(request, model);

        //跳转到declareManager页面
        return "declareManager";
    }

    /**
     * 更新教工的密码
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/updatePassword/{id}", method = RequestMethod.POST)
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
    @RequestMapping(value = "/updateInfo/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateInfo(Teacher teacher) {

        teacherService.updateTeacher(teacher);

        return Msg.success();
    }

    /**
     * 获取学生的申报信息
     *
     * @param pn        页码
     * @param collegeId 学院id
     * @return
     */
    @RequestMapping(value = "/declare",method = RequestMethod.GET)
    @ResponseBody
    public Msg declareInfo(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam("collegeId") int collegeId) {

        System.out.println(collegeId);
        //将对应学院的学生学号进行查出
        List<Integer> stuNumbers = collegeStuService.selectStuNumberWithCollegeId(collegeId);

        //设置起始页码以及每页的记录条数
        PageHelper.startPage(pn, 5);

        //根据学号进行申报记录的查出
        List<Record> stuRecords = recordService.getAllRecords(stuNumbers);

        //使用pageInfo包装查询后的结果
        PageInfo page = new PageInfo(stuRecords, 5);

        return Msg.success().add("pageInfo", page);
    }



}
