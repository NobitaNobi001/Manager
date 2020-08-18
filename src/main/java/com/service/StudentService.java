package com.service;

import com.bean.Record;
import com.bean.Student;
import com.bean.StudentExample;
import com.dao.CreditMapper;
import com.dao.RecordMapper;
import com.dao.StudentMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生相关操作的业务层
 */
@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private CreditMapper creditMapper;

    /**
     * select
     */

    /**
     * 查询学生数量
     *
     * @return
     */
    public long selectCountStudent() {
        return studentMapper.countByExample(null);
    }

    /**
     * 根据学号查找学生
     *
     * @param stuNumber 学生学号
     * @return
     */
    public Student selectStudentByStuNumber(Integer stuNumber) {
        return studentMapper.selectStudentByStuNumber(stuNumber);
    }

    /**
     * 根据主键查找学生信息
     *
     * @param id 主键
     * @return
     */
    public Student selectByPrimaryKey(Integer id) {
        return studentMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询学生的总学分
     *
     * @param stuNumber 学生学号
     * @return
     */
    public Double selectSumCreditBystuNumber(int stuNumber) {
        return creditMapper.selectBystuNumber(stuNumber);
    }

    /**
     * find
     */

    /**
     * 分页查询申报记录
     *
     * @param stuNumber 学号
     * @param page      起始页
     * @param size      一页显示的数据量
     * @return
     * @throws Exception
     */
    public List<Record> findAllBystuNumber(int stuNumber, int page, int size) throws Exception {
        PageHelper.startPage(page, size);
        return recordMapper.findAllBystuNumber(stuNumber);
    }

    /**
     * update
     */

    /**
     * 根据学号更新密码
     *
     * @param number
     * @param password
     */
    public void updatePasswordByStudentNumber(Integer number, String password) {
        studentMapper.updatePasswordByStudentNumber(number, password);
    }

    /**
     * 更新学生信息表中为null的数据
     *
     * @param student 学生对象
     * @return
     */
    public boolean updateStuInfoById(Student student) {
        return studentMapper.updateStuInfoById(student);
    }

    /**
     * 判断输入的密码和原有密码是否相同 进行更新
     *
     * @param stuNumber 学生学号
     * @param oldPwd    旧密码
     * @param newPwd    新密码
     * @return
     */
    public boolean updateStuPwd(int stuNumber, String oldPwd, String newPwd) {

        //从数据库中查出原始密码
        String password = studentMapper.selectUPByStuNumber(stuNumber).getPassword();

        if (password.equals(oldPwd)) {      //如果相同就进行密码的更新
            studentMapper.updateStuPwdByStuNumber(stuNumber, newPwd);
            return true;
        } else {        //反之则反
            return false;
        }
    }

    /**
     * 新增创建学分申报记录
     *
     * @param record 记录
     * @return
     */
    public boolean addCreditRecord(Record record) {
        if (record != null) {
            recordMapper.insertSelective(record);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 校验邮箱是否绑定此账号
     *
     * @param number 学号
     * @param email 邮箱
     * @return
     */
    public boolean checkEmailByStudent(Integer number, String email) {
        return studentMapper.selectEmailByStudent(number, email) == 0;
    }

    /**
     * 检查学生学号是否已存在
     *
     * @param stuNumber 学生学号
     * @return
     */
    public boolean checkStudent(Integer stuNumber) {

        StudentExample studentExample = new StudentExample();

        StudentExample.Criteria criteria = studentExample.createCriteria();

        criteria.andStuNumberEqualTo(stuNumber);

        return studentMapper.countByExample(studentExample) == 0;

    }
}