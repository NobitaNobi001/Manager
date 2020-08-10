package com.service;

import com.bean.Admin;
import com.bean.AdminExample;
import com.dao.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    /**
     * 根据管理员账号查询密码
     *
     * @param adminNumber 教工账号
     * @return
     */
    public Admin selectUPByAdminNumber(Integer adminNumber) {

        //通过dao层将数据进行查出
        Admin admin = adminMapper.selectUPByAdminNumber(adminNumber);

        return admin;
    }

    /**
     * 根据管理员账号查询个人信息
     *
     * @param adminNumber 教工账号
     * @return
     */
    public Admin selectAdminByAdminNumber(Integer adminNumber) {

        return adminMapper.selectAdminByAdminNumber(adminNumber);
    }

    /**
     * 根据账号查询管理员是否存在
     * @param adminNumber 管理员账号
     * @return
     */
    public boolean checkAdmin(Integer adminNumber) {

        AdminExample adminExample = new AdminExample();

        AdminExample.Criteria criteria = adminExample.createCriteria();

        criteria.andAdminNumberEqualTo(adminNumber);

        return adminMapper.countByExample(adminExample) == 0;
    }
}
