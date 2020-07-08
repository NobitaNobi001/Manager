package com.service;

import com.bean.Record;
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
     * 根据id查询出学生的申报记录
     *
     * @param id
     * @return
     */
    public Record getStuRecord(Integer id) {
        return recordMapper.selectByPrimaryKey(id);
    }


    public void updateRecord(Record record) {

        recordMapper.updateByPrimaryKeySelective(record);
    }
}
