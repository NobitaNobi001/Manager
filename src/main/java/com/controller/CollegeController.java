package com.controller;

import com.bean.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeService;
import com.service.CollegeStuService;
import com.service.TeacherService;
import com.service.WatcherService;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/college")
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    @Autowired
    private CollegeStuService collegeStuService;

    @Autowired
    private WatcherService watcherService;

    @Autowired
    private TeacherService teacherService;

    ObjectMapper objectMapper = new ObjectMapper();


    /**
     * 获取学院表中的所有学院
     *
     * @return
     */
    @RequestMapping(value = "/getColleges", method = RequestMethod.GET)
    @ResponseBody
    public String getColleges() throws JsonProcessingException {
        List<College> Allcolleges = collegeService.getColleges();
        String colleges = objectMapper.writeValueAsString(Allcolleges);
        return colleges;
    }

    /**
     * 获得所有年级
     * @param collegeId
     * @return
     * @throws JsonProcessingException
     */
    @GetMapping("/grade")
    @ResponseBody
    public String getGrade(Integer collegeId) throws JsonProcessingException{
        List<String> allGrade = collegeStuService.getAllGrade(collegeId);
        return objectMapper.writeValueAsString(allGrade);
    }

    /*
     * 得到所有专业
     * */
    @GetMapping("/getMajor")
    @ResponseBody
    public String getAllMajor(Integer collegeId,String grade) throws JsonProcessingException {
        List<String> allMajor = collegeStuService.getAllMajorWithGrade(collegeId,grade);
        return objectMapper.writeValueAsString(allMajor);
    }

    /*
     * 得到所在专业所有班级
     * */
    @GetMapping("/getClass")
    @ResponseBody
    public String getAllClass(Integer collegeId, String major) throws JsonProcessingException {
        List<String> allClass = collegeStuService.getAllClass(collegeId, major);
        return objectMapper.writeValueAsString(allClass);
    }


    /**
     * 条件查询
     *
     * @param college
     * @param major
     * @param stuClass
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/conditionSearch")
    public Msg conditionSearch(@RequestParam(value = "college", defaultValue = "1") Integer college, @RequestParam("major") String major, @RequestParam("stuClass") String stuClass, Model model, HttpServletRequest request) {

        List<Student> students = collegeStuService.selectWithCondition(college, major, stuClass);

        //获取登陆成功的督察账号
        Integer watcherNumber = (Integer) request.getSession().getAttribute("number");

        //根据督察账号查找督察信息
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(watcherNumber);

        PageInfo<Record> info = new PageInfo(students);

        model.addAttribute("info", info);
        model.addAttribute("watcher", watcher);

        return Msg.success().add("students", students);
    }

    /**
     * 根据学院 专业 班级来查询所有学生
     *
     * @param college
     * @param major
     * @param stuClass
     * @return
     */
    @RequestMapping("/selectStudent")
    public Msg selectStudents(@RequestParam("college") Integer college, @RequestParam("major") String major, @RequestParam("stuClass") String stuClass) {

        List<Student> students = collegeStuService.selectAllStuByCollegeName(college, 1, 5);

        return Msg.success().add("students", students);
    }

    /**
     * 获取此学院的申报规则
     *
     * @param collegeId
     * @return
     */
    @GetMapping("/rule")
    @ResponseBody
    public Msg getRule(@RequestParam("collegeId") Integer collegeId) {
        return Msg.success().add("rule", collegeService.getAll(collegeId));
    }

    @PutMapping("/rule")
    @ResponseBody
    public Msg updateRule(@RequestParam("collegeId") Integer collegeId, @RequestParam("rule") String rule, HttpServletRequest request) {

        College college = new College();
        college.setId(collegeId);
        college.setName(CollegeNameUtil.getCollegeName(collegeId));
        college.setRule(rule);

        collegeService.updateCollegeRule(college);

        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");

        teacher.setCollege(college);

        request.getSession().setAttribute("teacher", teacher);

        return Msg.success();
    }

}
