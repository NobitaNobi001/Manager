package com.dao;

import com.bean.Student;
import com.bean.StudentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    //根据学号来查询学生
    Student selectStudentByStuNumber(Integer stuNumber);

    //修改学生的空白信息
    boolean updateStuInfoById(Student student);

    //根据id查询到学生 更换密码
    boolean updateStuPwdByStuNumber(@Param("stuNumber") Integer stuNumber, @Param("password") String password);

    //根据学号来查询major专业
    String selectMajorBystuNumber(@Param("stuNumber") Integer stuNumber);

    // 根据关键字(学号、姓名)查询学生
    List<Student> selectStuBykeyword(@Param("keyword") String keyword);

    // 批量插入学生
    int insertBatchStuByExcel(@Param("list") List<Student> students);

    // list<Integer>集合封装学生学号得到list<student>
    List<Student> selectStuByStuNumberList(@Param("list") List<Integer> stuNumbers);

    // 下面逆向工程

    // 查询学生的数量
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    Student selectUPByStuNumber(Integer stuNumber);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    int selectEmailByStudent(@Param("number") Integer number,@Param("email") String email);

    int updatePasswordByStudentNumber(@Param("number") Integer number,@Param("password") String password);


}