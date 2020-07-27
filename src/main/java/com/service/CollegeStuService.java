package com.service;

import com.bean.Student;
import com.dao.CollegeStuMapper;
import com.github.pagehelper.PageHelper;
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

    /**
     * 查询一个学院所有学生的姓名
     * @param collegeId
     * @return
     */
    public List<String> selectStuNameWithCollegeId(int collegeId) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        return collegeStuMapper.selectStuNameWithCollegeId(tableName);
    }

    /**
     * 获取一个学院的所有专业
     * @param collegeId 学院id
     * @return
     */
    public List<String> getAllMajor(Integer collegeId) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        return collegeStuMapper.getAllMajor(tableName);
    }

    /**
     * 获取对应专业的所有班级
     * @param collegeId 学院id
     * @param major 专业
     * @return
     */
    public List<String> getAllClass(Integer collegeId, String major) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        return collegeStuMapper.getAllClass(tableName, major);
    }

    /**
     * 条件查询
     * @param college
     * @param major
     * @param Class
     * @return
     */
    public List<Student> conditionnSearch(Integer college, String major, String Class) {

        //获取表名
        String tableName = CollegeName.getTableName(college);

        return collegeStuMapper.conditionSearch(tableName, major, Class);
    }

    /**
     * 根据督查学院名查询所有学生
     * @param collegeId 学院id
     * @param page 当前页
     * @param pagesize 每一页的记录数
     * @return
     */
    public List<Student> selectAllStuByCollegeName(int collegeId, int page, int pagesize) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        PageHelper.startPage(page, pagesize);

        return collegeStuMapper.selectAllStuByCollegeName(tableName);
    }
}