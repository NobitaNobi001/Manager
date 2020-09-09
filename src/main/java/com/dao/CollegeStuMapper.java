package com.dao;


import com.bean.CollegeStu;
import com.bean.Student;

import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    //根据学院查到专业
    List<String> getAllMajor(@Param("tableName") String tableName);

    // 查询所在学院的班级
    List<String> getAllClass(@Param("tableName") String tableName, @Param("major") String major);

    List<Student> conditionSearch(@Param("tableName") String tableName,@Param("major") String major,@Param("stuClass") String stuClass);

    // 根据学院 专业  班级 查询学生学号
    List<Integer> selectStuNumber(@Param("tableName") String tableName, @Param("major") String major, @Param("stuClass") Integer stuClass);

    // 根据学院 专业 班级 关键字来查询学生学号
    List<Integer> selectStuNumberByKeyword(@Param("tableName") String tableName, @Param("major") String major, @Param("stuClass") Integer stuClass, @Param("keyword") String keyword);

    // 根据学号删除当个学生
    int deleteStuByStuNumber(@Param("tableName") String tableName, @Param("stuNumber") Integer stuNumber);

    // 新增学生
    int insertSelective(@Param("tableName") String tableName, @Param("student") Student student);

    // 批量删除
    int deleteStuBatchByList(@Param("tableName") String tableName, @Param("list") List<Integer> list);

    List<CollegeStu> selectInfo(@Param("tableName") String tableName, @Param("major") String major, @Param("stuClass") String stuClass, @Param("order") Integer order);

    // 如果学院名一样的话批量插入学生
    int insertBatchCollegeStu(@Param("tableName") String firstTableName, @Param("list") List<Student> students);
}
