package com.service;

import com.bean.Admin;
import com.dao.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> getAdmins(){
        return adminMapper.selectByExample(null);
    }

}
