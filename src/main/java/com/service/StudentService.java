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
    //根据学号来查找学生
    public Student selectStudentByStuNumber(Integer stuNumber){

        Student student = studentMapper.selectStudentByStuNumber(stuNumber);

        return student;

    }
    //根据主键查找学生
    public Student selectByPrimaryKey(Integer id){
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    //更新学生表中为null的数据
    public boolean updataStuByNullInfo(Student student){
        return  studentMapper.updataStuByNullInfo(student);
    }

    //判断输入的密码和原有密码是否相同，相同的话更新密码
    public boolean updateStuPwd(int stuNumber,String oldPwd,String newPwd){
        String password = studentMapper.selectUPByStuNumber(stuNumber).getPassword();
        if(password.equals(oldPwd)){
            studentMapper.updateStuPwdByStuNumber(stuNumber, newPwd);
            return true;
        }else{
            return false;
        }
    }
}
