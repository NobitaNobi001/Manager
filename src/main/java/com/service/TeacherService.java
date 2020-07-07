package com.service;


import com.bean.Student;
import com.bean.Teacher;
import com.dao.CollegeStuMapper;
import com.dao.TeacherMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

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

    //查询所在学院的学生列表
    public List<Student> selectStuByCollegeName(String tableName,int page,int size){
        PageHelper.startPage(page, size);
        return  collegeStuMapper.selectAllStuByCollegeName(tableName);
    }

    //条件查询学生列表
    public List<Student> selectStuByCondition(String tableName,Integer stuNumber,String stuName,String stuClass,int page,int size){
        PageHelper.startPage(page, size);
        return collegeStuMapper.selectStuByCondition(tableName,stuNumber, stuName, stuClass);
    }
}
