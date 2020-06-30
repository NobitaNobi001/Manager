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

    /**
     * 查找教师账密
     * @param teaNumber 教工号
     * @return
     */
    Teacher selectUPByTeaNumber(Integer teaNumber);

    /**
     * 根据教工号查找信息
     * @param teaNumber 教工号
     * @return
     */
    Teacher selectTeacherByTeaNumber(Integer teaNumber);
}