package com.service;


import com.bean.Student;
import com.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;


    /**
     *
     * @param stuNumber 学生学号
     * @return 查询到的学生
     */
    public Student selectUPByStuNumber(Integer stuNumber) {

        //通过dao层将数据进行查出
        Student student = studentMapper.selectUPByStuNumber(stuNumber);

        return student;
    }

    public Student selectStudentByStuNumber(Integer stuNumber){

        Student student = studentMapper.selectStudentByStuNumber(stuNumber);

        return student;

    }
}
