package com.service;

import com.dao.CollegeStuMapper;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeStuService {

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    /**
     * 查询到一个学院所有学生的学号信息
     *
     * @param collegeId
     * @return
     */
    public List<Integer> selectStuNumberWithCollegeId(int collegeId) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        List<Integer> stuNumbers = collegeStuMapper.selectStuNumberWithCollegeName(tableName);

        return stuNumbers;

    }

    public List<String> selectStuNameWithCollegeId(int collegeId) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        return collegeStuMapper.selectStuNameWithCollegeId(tableName);
    }
}
