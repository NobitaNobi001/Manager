package com.dao;

import com.bean.Credit;
import com.bean.CreditExample;
import java.util.List;

import com.bean.Record;
import org.apache.ibatis.annotations.Param;

public interface CreditMapper {
    int countByExample(CreditExample example);

    int deleteByExample(CreditExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Credit record);

    int insertSelective(Credit record);

    int insertBatchCreditByExcel(@Param("list") List<Credit> credits);

    List<Credit> selectByExample(CreditExample example);

    Credit selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Credit record, @Param("example") CreditExample example);

    int updateByExample(@Param("record") Credit record, @Param("example") CreditExample example);

    int updateByPrimaryKeySelective(Credit record);

    int updateByPrimaryKey(Credit record);

    Double selectBystuNumber(Integer stuNumber);

    //根据学号更新学生的总学分
    int updateByStuNumber(Credit credit);

    List<Record> findAllBystuNumber(@Param("stuNumber") int stuNumber);

}