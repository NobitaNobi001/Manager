package com.dao;

import com.bean.Admin;
import com.bean.AdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    int countByExample(AdminExample example);

    int deleteByExample(AdminExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    List<Admin> selectByExample(AdminExample example);

    Admin selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Admin record, @Param("example") AdminExample example);

    int updateByExample(@Param("record") Admin record, @Param("example") AdminExample example);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectAdminByAdminNumber(Integer adminNumber);

    int selectEmailByAdmin(@Param("number") Integer number,@Param("email") String email);

    int updatePasswordByAdminNumber(@Param("number") Integer number,@Param("password") String password);

    int insertBatchAdminByExcel(@Param("list") List<Admin> list);
}