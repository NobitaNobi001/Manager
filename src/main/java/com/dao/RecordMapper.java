package com.dao;

import com.bean.CreditDetail;
import com.bean.Record;
import com.bean.RecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RecordMapper {
    int countByExample(RecordExample example);

    int deleteByExample(RecordExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    List<Record> selectByExample(RecordExample example);

    List<Record> selectByExampleCondition(RecordExample example);

    Record selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByExample(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    List<Record> findAllBystuNumber(@Param("stuNumber") int stuNumber);

    List<Record> findAllBystuNumbers(@Param("stuNumbers") List<Integer> stuNumbers);

    List<Record> selectByStuName(String stuName);

    List<Record> findAllAuditBystuNumbers(@Param("stuNumbers") List<Integer> stuNumbers);

    List<CreditDetail> selectCreditRecordGroupBySort(Integer stuNumber);

    // 查看所有学院的创新学分比例图
    List<CreditDetail> selectCreditProfile();

    // 查看某一个学院的创新学分比例图
    List<CreditDetail> selectCreditProfileWithCollege(@Param(("stuNumbers")) List<Integer> stuNumberList);

    List<Double> selectAllCreditBySort(@Param("sort") String sort,@Param("stuNumber") Integer stuNumber);
}
