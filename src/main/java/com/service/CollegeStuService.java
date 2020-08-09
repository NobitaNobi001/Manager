package com.service;

import com.bean.Student;
import com.dao.CollegeStuMapper;
import com.utils.CollegeName;
import org.apache.ibatis.annotations.Param;
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
        if (!"".equals(tableName)) {
            return collegeStuMapper.selectStuNameWithCollegeId(tableName);
        } else {
            return null;
        }
    }


    public List<String> getAllMajor(Integer collegeId) {
        String tableName = CollegeName.getTableName(collegeId);
        if (!"".equals(tableName)) {
            List<String> allMajor = collegeStuMapper.getAllMajor(tableName);
            return allMajor;
        } else {
            return null;
        }
    }

    public List<String> getAllClass(Integer collegeId, String major) {
        String tableName = CollegeName.getTableName(collegeId);
        if (!"".equals(tableName)) {
            List<String> allClass = collegeStuMapper.getAllClass(tableName, major);
            return allClass;
        } else {
            return null;
        }
    }
}
