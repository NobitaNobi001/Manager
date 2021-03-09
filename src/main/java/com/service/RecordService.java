package com.service;

import com.bean.*;
import com.dao.CollegeStuMapper;
import com.dao.RecordMapper;
import com.dao.StudentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 学分申报记录相关操作的业务层
 */
@Service
public class RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    @Autowired
    private StudentMapper studentMapper;

    /**
     * select & get
     */

    /**
     * 查出所有记录的数量
     *
     * @return
     */
    public Integer selectCountRecord() {
        return recordMapper.countByExample(null);
    }


    /**
     * 带年级的查出所有创新类别的总学分
     *
     * @param collegeId
     * @param Grade
     * @return
     */
    public List<CreditDetail> getCreditProfileWithGrade(int collegeId, String Grade) {
        // 得到表名
        String tableName = CollegeNameUtil.getTableName(collegeId);
        //查看对应学院对应年级的学员的学号
        List<Integer> stuNumberList = collegeStuMapper.selectStuNumberWithCollegeAndGrade(tableName, Grade);
        if (stuNumberList.size() == 0) {
            return null;
        }
        return recordMapper.selectCreditProfileWithCollege(stuNumberList);
    }

    /**
     * 查出所有创新类别的总学分
     *
     * @param collegeId
     * @return
     */
    public List<CreditDetail> getCreditProfile(int collegeId) {
        if (collegeId == -1) {
            return recordMapper.selectCreditProfile();
        } else {
            // 得到表名
            String tableName = CollegeNameUtil.getTableName(collegeId);
            //查看对应学院的学员的id
            List<Integer> stuNumberList = collegeStuMapper.selectStuNumberWithCollegeName(tableName);
            if (stuNumberList.size() == 0) {
                return null;
            }
            return recordMapper.selectCreditProfileWithCollege(stuNumberList);
        }
    }

    /**
     * 查出所有记录数
     *
     * @return
     */
    public List<Record> selectAllRecords() {
        return recordMapper.selectByExampleCondition(null);
    }

    /**
     * 根据学号批量查出记录
     *
     * @param stuNumbers
     * @return
     */
    public List<Record> getAllRecords(List<Integer> stuNumbers) {

        List<Record> stuRecords = recordMapper.findAllBystuNumbers(stuNumbers);

        return stuRecords;
    }

    /**
     * 根据学号批量查询出已审核的学生申报记录
     *
     * @param stuNumbers
     * @return
     */
    public List<Record> getAllAuditRecords(List<Integer> stuNumbers) {
        List<Record> stuRecords = recordMapper.findAllAuditBystuNumbers(stuNumbers);

        return stuRecords;
    }

    /**
     * 根据id查询出学生的申报记录
     *
     * @param id
     * @return
     */
    public Record getStuRecord(Integer id) {
        return recordMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据主键查找记录
     *
     * @param id
     * @return
     */
    public Record selectByPrimaryKey(Integer id) {
        return recordMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据学号查询出所有申报记录
     *
     * @param stuNumber
     * @return
     */
    public List<Record> selectAllRecordsByStuNumber(Integer stuNumber) {
        return recordMapper.findAllBystuNumber(stuNumber);
    }

    /**
     * @Description: 管理员查看学分列表，默认记录表里面时间倒序从上到下
     * @return:
     */
    public PageInfo<Record> getAllRecordByAdmin(Integer page, Integer size) {
        PageInfo<Record> info = null;
        PageHelper.startPage(page, size);
        RecordExample recordExample = new RecordExample();
        recordExample.setOrderByClause("date DESC");
        List<Record> records = recordMapper.selectByExample(recordExample);
        info = new PageInfo<>(records);
        return info;
    }


    /**
     * 根据学生姓名进行查询
     *
     * @param stuName
     * @return
     */
    public List<Record> getRecordsBystuName(String stuName) {
        return recordMapper.selectByStuName(stuName);
    }

    /**
     * 管理员根据学院专业班级查询学分学分列表
     *
     * @param page
     * @param size
     * @param collegeId
     * @param major
     * @param stuClass
     * @return
     */
    public PageInfo<Record> getAllRecordByAdminQuery(Integer page, int size, Integer collegeId, String major, String stuClass) {
        PageInfo<Record> pageInfo = null;
        if (collegeId != -1) {// 学院不为空
            String tableName = CollegeNameUtil.getTableName(collegeId);
            List<Integer> list = collegeStuMapper.selectStuNumber(tableName, major, stuClass);
            if (list.isEmpty()) {
                return null;
            }
            RecordExample recordExample = new RecordExample();
            RecordExample.Criteria criteria = recordExample.createCriteria();
            criteria.andStuNumberIn(list);
            PageHelper.startPage(page, size);
            List<Record> records = recordMapper.selectByExample(recordExample);
            pageInfo = new PageInfo<>(records);
            return pageInfo;
        } else {// 学院为空的话默认从数据库查询
            return getAllRecordByAdmin(page, size);
        }
    }


    /**
     * 根据学院、专业、班级、审核状态来查询申报记录
     *
     * @param collegeId
     * @param major
     * @param stuClass
     * @param auditState
     * @return
     */
    public List<Record> getAllRecordToExport(Integer collegeId, String major, String stuClass, String auditState) {
        List<Record> records = null;
        if (collegeId != -1 && !("-1".equals(auditState))) {// 学院不为空 审核状态不为空
            String tableName = CollegeNameUtil.getTableName(collegeId);
            List<Integer> list = collegeStuMapper.selectStuNumber(tableName, major, stuClass);
            if (list.isEmpty()) {
                return records;
            }
            RecordExample recordExample = new RecordExample();
            RecordExample.Criteria criteria = recordExample.createCriteria();
            criteria.andStuNumberIn(list);
            criteria.andAuditStateEqualTo(auditState);
            records = recordMapper.selectByExample(recordExample);
            return records;
        } else if (collegeId != -1 && "-1".equals(auditState)) {// 学院不为空的话审核状态为空
            String tableName = CollegeNameUtil.getTableName(collegeId);
            List<Integer> list = collegeStuMapper.selectStuNumber(tableName, major, stuClass);
            if (list.isEmpty()) {
                return records;
            }
            RecordExample recordExample = new RecordExample();
            RecordExample.Criteria criteria = recordExample.createCriteria();
            criteria.andStuNumberIn(list);
            records = recordMapper.selectByExample(recordExample);
        } else {// 学院、审核状态都为null
            records = recordMapper.selectByExample(null);
        }
        return records;
    }


    /**
     * 根据学院 专业 班级 关键字(学号、姓名)来查询学生学号
     *
     * @param pageNum
     * @param pageSize
     * @param collegeId
     * @param major
     * @param stuClass
     * @param keyword
     * @return
     */
    public PageInfo<Student> selectStuBykeyword(Integer pageNum, Integer pageSize, Integer collegeId, String major, String stuClass, String keyword) {
        PageInfo<Student> pageInfo = null;
        if (collegeId == -1) {// 如果学院为空的话 默认从全部的学生列表进行关键字查询
            PageHelper.startPage(pageNum, pageSize);
            List<Student> students = studentMapper.selectStuBykeyword(keyword);
            pageInfo = new PageInfo(students);
        } else {// 学院不为null 学院学生表里面条件查询
            String tableName = CollegeNameUtil.getTableName(collegeId);
            List<Integer> stuNumbers = collegeStuMapper.selectStuNumberByKeyword(tableName, major, stuClass, keyword);
            if (stuNumbers.isEmpty()) {
                return pageInfo;
            }
            PageHelper.startPage(pageNum, pageSize);
            List<Student> students = studentMapper.selectStuByStuNumberList(stuNumbers);
            pageInfo = new PageInfo(students);
        }
        return pageInfo;
    }

    /**
     * 获取此学生该类别已获得的总学分
     *
     * @param sort
     * @param stuNumber
     * @return
     */
    public double getHaveCredit(String sort, Integer stuNumber) {

        //查出该学号学生的所有已经审核的此类别获取学分总数
        List<Double> credits = recordMapper.selectAllCreditBySort(sort, stuNumber);

        double sum = 0;

        if (credits.size() == 0) {
            return 0;
        } else {
            for (double temp : credits) {
                sum += temp;
            }
        }

        return sum;
    }


    /**
     * update
     */

    /**
     * 根据id主键更新记录
     *
     * @param record
     */
    public void updateRecord(Record record) {
        recordMapper.updateByPrimaryKeySelective(record);
    }
}
