package com.dao;


import com.bean.Student;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hbk
 * @date 2020/7/6
 **/
public interface CollegeStuMapper {

    //根据学院id查询对应学院的学号
    List<Integer> selectStuNumberWithCollegeName(@Param("tableName") String tableName);

    //条件查询学生列表
    List<Student> selectStuByCondition(@Param("tableName") String tableName, @Param("stuNumber") Integer stuNumber, @Param("stuName") String stuName, @Param("stuClass") String stuClass, @Param("major") String major);

    // 查询所有学生
    List<Student> selectAllStuByCollegeName(@Param("tableName") String tableName);

    // 查询所有学生姓名
    List<String> selectStuNameWithCollegeId(@Param("tableName") String tableName);

    // 模糊查询
    List<Student> selectStuByLikeSearch(@Param("tableName") String tableName, @Param("keyword") String keyword);

    List<String> getAllMajor(@Param("tableName") String tableName);

    List<String> getAllClass(@Param("tableName") String tableName, @Param("major") String major);

    List<Student> conditionSearch(String tableName, String major, String aClass, String keyword);
}
