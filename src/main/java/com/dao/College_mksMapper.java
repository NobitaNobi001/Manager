package com.dao;

import com.bean.College_mks;
import com.bean.College_mksExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface College_mksMapper {
    int countByExample(College_mksExample example);

    int deleteByExample(College_mksExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(College_mks record);

    int insertSelective(College_mks record);

    List<College_mks> selectByExample(College_mksExample example);

    College_mks selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") College_mks record, @Param("example") College_mksExample example);

    int updateByExample(@Param("record") College_mks record, @Param("example") College_mksExample example);

    int updateByPrimaryKeySelective(College_mks record);

    int updateByPrimaryKey(College_mks record);
}