package com.service;

import com.bean.Student;
import com.bean.Teacher;
import com.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    /**
     *
     * @param teaNumber 学生学号
     * @return 查询到的学生
     */
    public Teacher selectUPByTeaNumber(Integer teaNumber) {

        //通过dao层将数据进行查出
        Teacher teacher = teacherMapper.selectUPByTeaNumber(teaNumber);

        return teacher;
    }
}
