package com.service;

import com.bean.*;
import com.dao.*;
import com.github.pagehelper.PageHelper;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * 管理员相关操作的业务层
 */
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
     * select
     */

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
     * 查询出所有管理员
     *
     * @return
     */
    public List<Admin> selectAdmins() {
        return adminMapper.selectByExample(null);
    }

    /**
     * 根据管理员id查询单个管理员
     *
     * @param id
     * @return
     */
    public Admin selectAdminById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    /**
     * 条件查询
     *
     * @param collegeId
     * @param keywords
     * @return
     */
    public List<Admin> selectAdminWithCondition(Integer collegeId, String keywords) {
        return adminMapper.selectAdminWithCondition(collegeId, keywords);
    }

    /**
     * 查询出管理员的数量
     *
     * @return
     */
    public Integer selectCountAdmin() {
        return adminMapper.countByExample(null);
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
     * update
     */

    /**
     * 更新管理员信息
     *
     * @param admin
     */
    public void updateAdmin(Admin admin) {
        adminMapper.updateByPrimaryKeySelective(admin);
    }

    /**
     * 管理员更新学生信息
     *
     * @param student
     */
    public void updateStu(Student student) {
        try {
            // 在学生表里面更新
            studentMapper.updateByPrimaryKeySelective(student);
            // 在学院学生表里面删除 然后插入
            // 获取表名
            String tableName = CollegeNameUtil.getTableName(student.getCollegeId());
            // 在学院学生表里面删除
            collegeStuMapper.deleteStuByStuNumber(tableName, student.getStuNumber());
            // 在学院学生表里面新增学生
            collegeStuMapper.insertSelective(tableName, student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据管理员账号更新密码
     *
     * @param number   管理员工号
     * @param password 密码
     */
    public void updatePasswordByAdminNumber(Integer number, String password) {
        adminMapper.updatePasswordByAdminNumber(number, password);
    }

    /**
     * delete
     */

    /**
     * @Description: 单个删除
     * @return: void
     */
    public int deleteStu(int stuNumber) {
        int sum = 0;
        // 得到表名
        String tableName = CollegeNameUtil.getTableName(studentMapper.selectStudentByStuNumber(stuNumber).getCollegeId());
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
     * 批量删除学生
     *
     * @param list
     * @return
     */
    public int deleteStuBatch(List<Integer> list) {
        int sum = 0;
        // 得到表名 注意批量删除只能删除一个学院里面
        String tableName = CollegeNameUtil.getTableName(studentMapper.selectStudentByStuNumber(list.get(0)).getCollegeId());
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
     * 删除单个管理员
     *
     * @param id 管理员id
     */
    public void deleteAdmin(Integer id) {
        adminMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除教师
     *
     * @param ids
     */
    public void deleteBatchAdmin(List<Integer> ids) {

        AdminExample example = new AdminExample();

        AdminExample.Criteria criteria = example.createCriteria();

        criteria.andIdIn(ids);

        adminMapper.deleteByExample(example);

    }

    /**
     * insert
     */

    /**
     * 通过模态框中的表单新增学生
     *
     * @param student
     */
    public void insertStuByForm(Student student) {
        // 先在学生表里面添加 然后学分表 学院学生表
        try {
            studentMapper.insertSelective(student);
            Credit credit = new Credit(student.getStuNumber(), 0.0);
            creditMapper.insertSelective(credit);
            String tableName = CollegeNameUtil.getTableName(student.getCollegeId());
            collegeStuMapper.insertSelective(tableName, student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 新增单个管理员
     *
     * @param admin
     */
    public void insertAdmin(Admin admin) {
        adminMapper.insertSelective(admin);
    }

    /**
     * 通过excel新增学生
     *
     * @param students
     */
    public void insertStuByExcel(List<Student> students) {
        Boolean TableNameIsSame = true;
        // 得到第一个学生的学院id
        Integer FirstCollegeId = students.get(0).getCollegeId();
        // 得到第一个学生应该插入的表名
        String FirstTableName = CollegeNameUtil.getTableName(FirstCollegeId);
        // 创建总学分集合
        List<Credit> credits = new ArrayList<>();
        // 创建学院对象
        for (Student student : students) {
            // 判断要插入的学生的学院是否都相同
            if (student.getCollegeId() != FirstCollegeId) {
                TableNameIsSame = false;
            }
            credits.add(new Credit(student.getStuNumber(), 0.0));
        }
        // 插入学生表
        studentMapper.insertBatchStuByExcel(students);
        // 插入学分表
        creditMapper.insertBatchCreditByExcel(credits);
        // 插入学院学生表
        // 如果是表名是都是一样的话，那么批量插入学院学生表 否则依次插入学院学生表
        if (TableNameIsSame == true) {
            collegeStuMapper.insertBatchCollegeStu(FirstTableName, students);
        } else {
            for (Student student : students) {
                String tableName = CollegeNameUtil.getTableName(student.getCollegeId());
                collegeStuMapper.insertSelective(tableName, student);
            }
        }
    }

    /**
     * 通过Excel批量插入管理员
     *
     * @param admins
     */
    public void insertBatchAdmin(List<Admin> admins) {

        adminMapper.insertBatchAdminByExcel(admins);

    }

    /**
     * check
     */

    /**
     * 根据账号查询管理员是否存在
     *
     * @param adminNumber 管理员账号
     * @return
     */
    public boolean checkAdmin(Integer adminNumber) {

        AdminExample adminExample = new AdminExample();

        AdminExample.Criteria criteria = adminExample.createCriteria();

        criteria.andAdminNumberEqualTo(adminNumber);

        return adminMapper.countByExample(adminExample) == 0;
    }

    /**
     * 校验督察账号是否绑定此邮箱
     *
     * @param number 督察账号
     * @param email  邮箱
     * @return
     */
    public boolean checkEmailByAdmin(Integer number, String email) {
        return adminMapper.selectEmailByAdmin(number, email) == 0;
    }
}

