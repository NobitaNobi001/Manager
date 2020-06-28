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

    Student student = null;

    public boolean check(Integer stuNumber, String password) {

        student = new Student(stuNumber, password);

        List<Student> students = studentMapper.selectBase(student);

        for (Student student : students) {
            if (student.getStuNumber().equals(stuNumber) && student.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
    public Student selectByPrimaryKey(Integer id){
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }
}
