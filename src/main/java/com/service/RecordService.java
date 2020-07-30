package com.service;

import com.bean.Credit;
import com.bean.Msg;
import com.bean.Record;
import com.bean.RecordExample;
import com.dao.CollegeStuMapper;
import com.dao.RecordMapper;
import com.github.pagehelper.PageHelper;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

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
     * @param stuNumbers
     * @return
     */
    public List<Record> getAllAuditRecords(List<Integer> stuNumbers){
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
     * 根据id主键更新记录
     *
     * @param record
     */
    public void updateRecord(Record record) {

        recordMapper.updateByPrimaryKeySelective(record);
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
     * 根据主键查找记录
     * @param id
     * @return
     */
    public Record selectByPrimaryKey(Integer id) {
        return recordMapper.selectByPrimaryKey(id);
    }

    public Integer selectCountRecord() {
        return recordMapper.countByExample(null);
    }

    /**
     * @Description: 管理员查看学分列表，默认记录表里面时间倒序从上到下
     * @return:
     */
    public List<Record> getAllRecordByadmin(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        RecordExample recordExample = new RecordExample();
        recordExample.setOrderByClause("date DESC");
        List<Record> records = recordMapper.selectByExample(recordExample);
        return records;
    }


    public List<Record> getAllRecordByadminQuery(Integer page, int size, Integer collegeId, String major, Integer stuClass) {
        if (collegeId != -1) {// 学院不为空
            String tableName = CollegeName.getTableName(collegeId);
            if (!("-1".equals(major)) && stuClass != -1) { // 专业和班级不为空
                List<Integer> list = collegeStuMapper.selectStuByCollegeAndMajorAndClass(tableName, major, stuClass);
                RecordExample recordExample = new RecordExample();
                RecordExample.Criteria criteria = recordExample.createCriteria();
                criteria.andStuNumberIn(list);
                PageHelper.startPage(page, size);
                List<Record> records = recordMapper.selectByExample(recordExample);
                return records;
            } else if (!("-1".equals(major)) && stuClass == -1) {// 专业不为空 班级为空
                List<Integer> list = collegeStuMapper.selectStuByCollegeAndMajor(tableName, major);
                RecordExample recordExample = new RecordExample();
                RecordExample.Criteria criteria = recordExample.createCriteria();
                criteria.andStuNumberIn(list);
                PageHelper.startPage(page, size);
                List<Record> records = recordMapper.selectByExample(recordExample);
                return records;
            } else {// 专业为空 班级为空
                List<Integer> list = collegeStuMapper.selectStuBycollege(tableName);
                RecordExample recordExample = new RecordExample();
                RecordExample.Criteria criteria = recordExample.createCriteria();
                criteria.andStuNumberIn(list);
                PageHelper.startPage(page, size);
                List<Record> records = recordMapper.selectByExample(recordExample);
                return records;
            }
        } else {// 学院为空的话默认从数据库查询
            return getAllRecordByadmin(page, size);
        }


    }
}
