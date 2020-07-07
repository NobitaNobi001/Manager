package com.service;


import com.bean.Record;
import com.bean.Teacher;
import com.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    /**
     *
     * @param teaNumber 教工号
     * @return 查询到的教师账密
     */
    public Teacher selectUPByTeaNumber(Integer teaNumber) {

        //通过dao层将数据进行查出
        Teacher teacher = teacherMapper.selectUPByTeaNumber(teaNumber);

        return teacher;
    }

    /**
     *
     * @param teaNumber 教工号
     * @return 查询到的教工信息
     */
    public Teacher selectTeacherByTeaNumber(Integer teaNumber){

        //通过dao层将数据进行查出
        Teacher teacher = teacherMapper.selectTeacherByTeaNumber(teaNumber);

        return teacher;
    }

    /**
     * 更新教师信息
     * @param teacher
     */
    public void updateTeacher(Teacher teacher){

        teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public Teacher selectByPrimaryKey(Integer id){

       return teacherMapper.selectByPrimaryKey(id);
    }

}
