package com.service;

import com.bean.Credit;
import com.bean.Msg;
import com.bean.Record;
import com.bean.RecordExample;
import com.dao.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordService {

    @Autowired
    private RecordMapper recordMapper;

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
     *
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
     * 查出所有记录数
     * @return
     */
    public List<Record> selectAllRecords() {
        return recordMapper.selectByExample(null);
    }

}
