package com.service;


import com.bean.Record;
import com.bean.Student;
import com.dao.CreditMapper;
import com.dao.RecordMapper;
import com.dao.StudentMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private CreditMapper creditMapper;

    //通过学号查询密码
    public Student selectUPByStuNumber(Integer stuNumber) {
        Student student = studentMapper.selectUPByStuNumber(stuNumber);
        return student;
    }

    //根据学号来查找学生
    public Student selectStudentByStuNumber(Integer stuNumber) {
        Student student = studentMapper.selectStudentByStuNumber(stuNumber);
        return student;
    }

    //根据主键查找学生
    public Student selectByPrimaryKey(Integer id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    //更新学生表中为null的数据
    public boolean updateStuInfoById(Student student) {
        return studentMapper.updateStuInfoById(student);
    }

    //判断输入的密码和原有密码是否相同，相同的话更新密码
    public boolean updateStuPwd(int stuNumber, String oldPwd, String newPwd) {
        String password = studentMapper.selectUPByStuNumber(stuNumber).getPassword();
        if (password.equals(oldPwd)) {
            studentMapper.updateStuPwdByStuNumber(stuNumber, newPwd);
            return true;
        } else {
            return false;
        }
    }

    //新增创建学分申报记录
    public boolean addCreditRecord(Record record) {
        if (record != null) {
            recordMapper.insertSelective(record);
            return true;
        } else {
            return false;
        }
    }

    //分页查询申报记录
    public List<Record> findAllBystuNumber(int stuNumber, int page, int size) throws Exception {
        PageHelper.startPage(page, size);
        return recordMapper.findAllBystuNumber(stuNumber);
    }

    //查询学生的总分
    public Double selectSumCreditBystuNumber(int stuNumber) {
        return creditMapper.selectBystuNumber(stuNumber);
    }

    public Integer selectCountStudent() {
        return studentMapper.countByExample(null);
    }
}