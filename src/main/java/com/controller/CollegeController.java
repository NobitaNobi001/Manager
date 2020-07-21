package com.controller;

import com.bean.College;
import com.bean.Msg;
import com.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/college")
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    /**
     * 获取学院表中的所有学院
     * @return
     */
    @RequestMapping(value = "/getColleges",method = RequestMethod.GET)
    @ResponseBody
    public Msg getColleges(){

        List<College> colleges = collegeService.getColleges();

        return Msg.success().add("colleges",colleges);
    }
}
