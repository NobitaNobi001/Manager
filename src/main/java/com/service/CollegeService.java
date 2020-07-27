package com.service;

import com.bean.College;
import com.dao.CollegeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeService {

    @Autowired
    private CollegeMapper collegeMapper;

    /**
     * 获取所有学院
     * @return
     */
    public List<College> getColleges(){
        return collegeMapper.selectByExample(null);
    }

}
