package com.dao;

import com.bean.Student;
import com.bean.StudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    int countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);
    //根据主键来查询学生
    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    //根据学号查询密码
    Student selectUPByStuNumber(Integer stuNumber);
    //根据学号来查询学生
    Student selectStudentByStuNumber(Integer stuNumber);

    //修改学生的空白信息
    boolean updataStuByNullInfo(Student student);

    //根据id查询到学生 更换密码
    boolean updateStuPwdByStuNumber(@Param("stuNumber")Integer stuNumber,@Param("password")String password);
}