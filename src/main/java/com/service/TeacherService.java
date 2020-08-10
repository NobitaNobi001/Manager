package com.service;


import com.bean.Student;
import com.bean.Teacher;
import com.bean.TeacherExample;
import com.bean.WatcherExample;
import com.dao.CollegeStuMapper;
import com.dao.TeacherMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    /**
     * 根据教工号查询账密
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
     * 根据教工号查询教师个人信息
     *
     * @param teaNumber 教工号
     * @return 查询到的教工信息
     */
    public Teacher selectTeacherByTeaNumber(Integer teaNumber) {

        //通过dao层将数据进行查出
        Teacher teacher = teacherMapper.selectTeacherByTeaNumber(teaNumber);

        return teacher;
    }

    /**
     * 更新教师信息
     *
     * @param teacher
     */
    public void updateTeacher(Teacher teacher) {

        teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    /**
     * 根据主键查出教师信息
     *
     * @param id
     * @return
     */
    public Teacher selectByPrimaryKey(Integer id) {

        return teacherMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询所在学院的学生列表
     *
     * @param tableName
     * @param page
     * @param size
     * @return
     */
    public List<Student> selectStuByCollegeName(String tableName, int page, int size) {
        PageHelper.startPage(page, size);
        return collegeStuMapper.selectAllStuByCollegeName(tableName);
    }

    /**
     * 条件查询学生列表
     *
     * @param tableName 学院
     * @param stuNumber 学生学号
     * @param stuName   学生姓名
     * @param stuClass  学生班级
     * @param page      起始页
     * @param size      一页显示的数据量
     * @param major     学生专业
     * @return
     */
    public List<Student> selectStuByCondition(String tableName, Integer stuNumber, String stuName, String stuClass, int page, int size, String major) {
        PageHelper.startPage(page, size);
        return collegeStuMapper.selectStuByCondition(tableName, stuNumber, stuName, stuClass, major);
    }

    /**
     * 查询教师数量
     *
     * @return
     */
    public Integer selectCountTeacher() {
        return teacherMapper.countByExample(null);
    }

    /**
     * 查询出所有教师信息
     *
     * @return
     */
    public List<Teacher> selectTeachers() {
        return teacherMapper.selectByExample(null);
    }

    /**
     * 校验教工号是否已经存在
     *
     * @param teaNumber
     * @return
     */
    public boolean checkTeacher(Integer teaNumber) {

        //创建一个watcherExample对象
        TeacherExample teacherExample = new TeacherExample();

        TeacherExample.Criteria criteria = teacherExample.createCriteria();

        criteria.andTeaNumberEqualTo(teaNumber);

        return teacherMapper.countByExample(teacherExample) == 0;

    }

    /**
     * 插入单个教师
     *
     * @param teacher
     */
    public void insertTeacher(Teacher teacher) {
        teacherMapper.insertSelective(teacher);
    }

    /**
     * 根据主键删除教师
     *
     * @param id
     */
    public void deleteTeacher(Integer id) {
        teacherMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除教师
     * @param ids
     */
    public void batchDeleteTeachers(List<Integer> ids){

        TeacherExample teacherExample = new TeacherExample();

        TeacherExample.Criteria criteria = teacherExample.createCriteria();

        criteria.andIdIn(ids);

        teacherMapper.deleteByExample(teacherExample);
    }

    /**
     * 条件查询
     * @param collegeId 学院
     * @param keywords 关键字
     * @return
     */
    public List<Teacher> selectTeacherWithCondition(Integer collegeId,String keywords){
        return teacherMapper.selectTeacherWithCondition(collegeId,keywords);
    }
}