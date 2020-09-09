package com.controller;

import com.bean.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeService;
import com.service.CollegeStuService;
import com.service.WatcherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    /*
     * 得到所有专业
     * */
    @RequestMapping(value = "/getMajor", method = RequestMethod.GET)
    @ResponseBody
    public String getAllMajor(Integer collegeId) throws JsonProcessingException {
        List<String> allMajor = collegeStuService.getAllMajor(collegeId);
        return objectMapper.writeValueAsString(allMajor);
    }

    /*
     * 得到所在专业所有班级
     * */
    @RequestMapping(value = "/getClass", method = RequestMethod.GET)
    @ResponseBody
    public String getAllMajor(Integer collegeId, String major) throws JsonProcessingException {
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

}
