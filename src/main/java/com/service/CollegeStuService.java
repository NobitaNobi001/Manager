
package com.service;

import com.bean.CollegeStu;
import com.bean.Student;
import com.dao.CollegeStuMapper;
import com.github.pagehelper.PageHelper;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学院学生表相关操作的业务层
 */
@Service
public class CollegeStuService {

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    /**
     * select
     */

    /**
     * 查询到一个学院所有学生的学号信息
     *
     * @param collegeId
     * @return
     */
    public List<Integer> selectStuNumberWithCollegeId(int collegeId) {

        //获取表名
        String tableName = CollegeNameUtil.getTableName(collegeId);

        List<Integer> stuNumbers = collegeStuMapper.selectStuNumberWithCollegeName(tableName);

        return stuNumbers;

    }

    /**
     * 根据学院id查询学生姓名
     *
     * @param collegeId
     * @return
     */
    public List<String> selectStuNameWithCollegeId(int collegeId) {
        //获取表名
        String tableName = CollegeNameUtil.getTableName(collegeId);
        if (!"".equals(tableName)) {
            return collegeStuMapper.selectStuNameWithCollegeId(tableName);
        } else {
            return null;
        }
    }

    /**
     * 根据学院和审核年级查询
     * @param collegeId
     * @param auditGrade
     * @return
     */
    public List<Integer> selectStuNumberWithCollegeIdAndGrade(int collegeId,String auditGrade){
        //获取表名
        String tableName = CollegeNameUtil.getTableName(collegeId);

        List<Integer> stuNumbers = collegeStuMapper.selectStuNumberWithGrade(tableName,auditGrade);

        return stuNumbers;
    }


    /**
     * 根据督查学院名查询所有学生
     * @param collegeId 学院id
     * @param page 当前页
     * @param pagesize 每一页的记录数
     * @return
     */
    public List<Student> selectAllStuByCollegeName(int collegeId, int page, int pagesize) {

        //获取表名
        String tableName = CollegeNameUtil.getTableName(collegeId);

        PageHelper.startPage(page, pagesize);

        return collegeStuMapper.selectAllStuByCollegeName(tableName);
    }

    /**
     * 条件查询
     *
     * @param college
     * @param major
     * @param Class
     * @return
     */
    public List<Student> selectWithCondition(Integer college, String major, String Class) {

        //获取表名
        String tableName = CollegeNameUtil.getTableName(college);

        return collegeStuMapper.conditionSearch(tableName, major, Class);
    }


    /**
     * 获取到所有专业
     *
     * @param collegeId
     * @return
     */
    public List<String> getAllMajor(Integer collegeId) {
        String tableName = CollegeNameUtil.getTableName(collegeId);
        if (!"".equals(tableName)) {
            List<String> allMajor = collegeStuMapper.getAllMajor(tableName);
            return allMajor;
        } else {
            return null;
        }
    }

    /**
     * 获取到所有班级
     *
     * @param collegeId
     * @param major
     * @return
     */
    public List<String> getAllClass(Integer collegeId, String major) {
        String tableName = CollegeNameUtil.getTableName(collegeId);
        if (!"".equals(tableName)) {
            List<String> allClass = collegeStuMapper.getAllClass(tableName, major);
            return allClass;
        } else {
            return null;
        }
    }

    /**
     * 根据学院id获取到此学院所有年级
     * @param collegeId
     * @return
     */
    public List<String> getAllGrade(Integer collegeId){
        String tableName = CollegeNameUtil.getTableName(collegeId);
        if(!"".equals(tableName)){
            List<String> allGrade = collegeStuMapper.getAllGrade(tableName);
            return allGrade;
        }else{
            return null;
        }
    }

    /**
     *
     * @param collegeId
     * @param major
     * @param stuClass
     * @param order
     * @return
     */
    public List<CollegeStu> getInfo(Integer collegeId, String major, String stuClass, Integer order) {

        //获取数据库名
        String tableName = CollegeNameUtil.getTableName(collegeId);

        //查询出此学院所有满足要求的学生
        List<CollegeStu> collegeStus = collegeStuMapper.selectInfo(tableName, major, stuClass, order);

        return collegeStus;
    }
}


