package com.dao;

import com.bean.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hbk
 * @date 2020/7/6
 **/
public interface CollegeStuMapper {
    //根据学院名查询所有学生
    List<Student> selectAllStuByCollegeName(@Param("tableName") String tableName);
}
