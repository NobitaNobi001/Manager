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

        return collegeStuMapper.selectStuNameWithCollegeId(tableName);
    }


    public List<String> getAllMajor(Integer collegeId) {
        String tableName = CollegeName.getTableName(collegeId);
        List<String> allMajor = collegeStuMapper.getAllMajor(tableName);
        return allMajor;
    }

    public List<String> getAllClass(Integer collegeId, String major) {
        String tableName = CollegeName.getTableName(collegeId);
        List<String> allClass = collegeStuMapper.getAllClass(tableName, major);
        return allClass;
    }


    public List<Student> conditionnSearch(Integer college, String major, String Class, String keyword) {
        String tableName = CollegeName.getTableName(college);
        List<Student> students = collegeStuMapper.conditionSearch(tableName, major, Class, keyword);
        return students;
    }
}
