package com.dao;

import com.bean.Teacher;
import com.bean.TeacherExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {

    int countByExample(TeacherExample example);

    int deleteByExample(TeacherExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    List<Teacher> selectByExample(TeacherExample example);

    Teacher selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    Teacher selectTeacherByTeaNumber(Integer teaNumber);

    List<Teacher> selectTeacherWithCondition(@Param("collegeId") Integer collegeId,@Param("keywords") String keywords);

    int selectEmailByTeacher(@Param("number") Integer number,@Param("email") String email);

    int updatePasswordByTeacherNumber(@Param("number") Integer number,@Param("password") String password);

    int updateAuditGradeByPrimaryKey(@Param("auditGrade") String auditGrade,@Param("id") Integer id);

    int insertBatchTeacherByExcel(@Param("list") List<Teacher> teachers);

    List<Teacher> selectTeachersWithCollegeId(Integer collegeId);

}