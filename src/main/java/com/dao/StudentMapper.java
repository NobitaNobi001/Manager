package com.dao;

import com.bean.Student;
import com.bean.StudentExample;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    //根据学号查询密码
    Student selectUPByStuNumber(Integer stuNumber);

    //根据主键来查询学生
    Student selectByPrimaryKey(Integer id);

    //根据学号来查询学生
    Student selectStudentByStuNumber(Integer stuNumber);

    //修改学生的空白信息
    boolean updateStuInfoById(Student student);

    //根据id查询到学生 更换密码
    boolean updateStuPwdByStuNumber(@Param("stuNumber") Integer stuNumber, @Param("password") String password);

    //根据id来查询major专业
    String selectMajorBystuNumber(@Param("stuNumber") Integer stuNumber);

    Integer countByExample(StudentExample example);
}