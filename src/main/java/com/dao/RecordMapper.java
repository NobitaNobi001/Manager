package com.dao;

import com.bean.Record;
import com.bean.RecordExample;
import com.bean.RecordWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RecordMapper {
    int countByExample(RecordExample example);

    int deleteByExample(RecordExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RecordWithBLOBs record);

    int insertSelective(RecordWithBLOBs record);

    List<RecordWithBLOBs> selectByExampleWithBLOBs(RecordExample example);

    List<Record> selectByExample(RecordExample example);

    RecordWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RecordWithBLOBs record, @Param("example") RecordExample example);

    int updateByExampleWithBLOBs(@Param("record") RecordWithBLOBs record, @Param("example") RecordExample example);

    int updateByExample(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByPrimaryKeySelective(RecordWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(RecordWithBLOBs record);

    int updateByPrimaryKey(Record record);
}