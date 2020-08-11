package com.service;

import com.bean.*;
import com.dao.*;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    @Autowired
    private CreditMapper creditMapper;

    @Autowired
    private RecordMapper recordMapper;

    /**
     * 根据管理员账号查询密码
     *
     * @param adminNumber 教工账号
     * @return
     */
    public Admin selectUPByAdminNumber(Integer adminNumber) {

        //通过dao层将数据进行查出
        Admin admin = adminMapper.selectUPByAdminNumber(adminNumber);

        return admin;
    }

    /**
     * 根据管理员账号查询个人信息
     *
     * @param adminNumber 教工账号
     * @return
     */
    public Admin selectAdminByAdminNumber(Integer adminNumber) {

        return adminMapper.selectAdminByAdminNumber(adminNumber);
    }

    /**
     * @Description: 管理员更新学生信息
     * @return:
     */
    public void updateStu(Student student) {
        try {
            // 在学生表里面更新
            studentMapper.updateByPrimaryKeySelective(student);
            // 在学院学生表里面删除 然后插入
            // 获取表名
            String tableName = CollegeName.getTableName(student.getCollegeId());
            // 在学院学生表里面删除
            collegeStuMapper.deleteStuByStuNumber(tableName, student.getStuNumber());
            // 在学院学生表里面新增学生
            collegeStuMapper.insertSelective(tableName, student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @Description: 批量删除
     * @return: void
     */
    public int deleteStuBatch(List<Integer> list) {
        int sum = 0;
        // 得到表名 注意批量删除只能删除一个学院里面
        String tableName = CollegeName.getTableName(studentMapper.selectStudentByStuNumber(list.get(0)).getCollegeId());
        // 先在学院学生表里面删除 然后学分表 学分记录表 最后学生表
        CreditExample creditExample = new CreditExample();
        CreditExample.Criteria criteria = creditExample.createCriteria();
        criteria.andStuNumberIn(list);

        RecordExample recordExample = new RecordExample();
        RecordExample.Criteria criteria1 = recordExample.createCriteria();
        criteria1.andStuNumberIn(list);

        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria2 = studentExample.createCriteria();
        criteria2.andStuNumberIn(list);
        try {
            // 学分表删除
            creditMapper.deleteByExample(creditExample);
            // 学分记录表删除
            recordMapper.deleteByExample(recordExample);
            // 学院学生表删除
            collegeStuMapper.deleteStuBatchByList(tableName, list);
            // 学生表删除
            int count = studentMapper.deleteByExample(studentExample);
            sum += count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sum;
    }

    /**
     * @Description: 单个删除
     * @return: void
     */
    public int deleteStu(int stuNumber) {
        int sum = 0;
        // 得到表名
        String tableName = CollegeName.getTableName(studentMapper.selectStudentByStuNumber(stuNumber).getCollegeId());
        // 先在学院学生表里面删除 然后学分表 学分记录表 最后学生表
        CreditExample creditExample = new CreditExample();
        CreditExample.Criteria criteria = creditExample.createCriteria();
        criteria.andStuNumberEqualTo(stuNumber);

        RecordExample recordExample = new RecordExample();
        RecordExample.Criteria criteria1 = recordExample.createCriteria();
        criteria1.andStuNumberEqualTo(stuNumber);

        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria2 = studentExample.createCriteria();
        criteria2.andStuNumberEqualTo(stuNumber);
        try {
            // 学分表删除
            creditMapper.deleteByExample(creditExample);
            // 学分记录表删除
            recordMapper.deleteByExample(recordExample);
            // 学院学生表删除
            collegeStuMapper.deleteStuByStuNumber(tableName, stuNumber);
            // 学生表删除
            int count = studentMapper.deleteByExample(studentExample);
            sum += count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sum;
    }

    /**
     * @Description: 判断学号是否重复
     * @return: void
     */
    public boolean checkStuNumberISExist(Integer stuNumber) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andStuNumberEqualTo(stuNumber);
        List<Student> students = studentMapper.selectByExample(studentExample);
        if (students.isEmpty()) {
            return true;// 表示验证通过,可以新增学生学号
        } else {
            return false;// 表示验证不通过
        }
    }

    /**
     * @Description: 通过模态框中的表单新增学生
     * @return: void
     */
    public void insertStuByForm(Student student) {
        // 先在学生表里面添加 然后学分表 学院学生表
        try {
            studentMapper.insertSelective(student);
            Credit credit = new Credit(student.getStuNumber(), 0.0);
            creditMapper.insertSelective(credit);
            String tableName = CollegeName.getTableName(student.getCollegeId());
            collegeStuMapper.insertSelective(tableName, student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @Description: 通过excel新增学生
     * @return: void
     */
    public void insertStuByExcel(List<Student> students) {
        try {
            List<Credit> credits = new ArrayList<>();
            // 创建学分对象
            // 截取学号封装密码
            for (Student student : students) {
                String password = student.getStuNumber().toString().substring(4);
                student.setPassword(password);
                credits.add(new Credit(student.getStuNumber(), 0.0));
            }
            // 插入学生表
            studentMapper.insertBatchStuByExcel(students);
            // 插入学分表
            creditMapper.insertBatchCreditByExcel(credits);
            // 插入学院学生表
            for (Student student : students) {
                String tableName = CollegeName.getTableName(student.getCollegeId());
                collegeStuMapper.insertSelective(tableName, student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
