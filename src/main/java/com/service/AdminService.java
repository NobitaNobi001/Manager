package com.service;

import com.bean.Admin;
import com.dao.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    /**
     * 根据管理员账号查询密码
     * @param adminNumber
     * @return
     */
    public Admin selectUPByAdminNumber(Integer adminNumber){

        //通过dao层将数据进行查出
        Admin admin = adminMapper.selectUPByAdminNumber(adminNumber);

        return admin;
    }

    public Admin selectAdminByAdminNumber(Integer adminNumber){

        return adminMapper.selectAdminByAdminNumber(adminNumber);
    }
}
