package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.Admin;
import com.bean.AdminExcel;
import com.service.AdminService;
import com.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 监听管理员的批量导入
 */
@Component
@Scope("prototype")
public class ExportAdminListener extends AnalysisEventListener<AdminExcel> {

    @Autowired
    AdminService adminService;

    @Autowired
    CollegeService collegeService;

    List<Admin> admins = new ArrayList<>();

    public List<Admin> getAdmins() {
        return admins;
    }

    public void setAdmins(List<Admin> admins) {
        this.admins = admins;
    }

    @Override
    public void invoke(AdminExcel adminExcel, AnalysisContext analysisContext) {

        Admin admin = new Admin();

        admin.setAdminNumber(adminExcel.getAdminNumber());

        admin.setAdminName(adminExcel.getAdminName());

        admin.setPassword(String.valueOf(adminExcel.getAdminNumber()));

        admin.setCollegeId(collegeService.getCollegeIdByName(adminExcel.getCollegeName()));

        admin.setGender(adminExcel.getGender());

        admin.setIsSuper("0");


        admin.setPhone(adminExcel.getPhone());

        admin.setEmail(adminExcel.getEmail());


        admins.add(admin);

        if (admins.size() % 20 == 0) {

            adminService.insertBatchAdmin(admins);

            admins.clear();
        }


    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

        if (admins.size() != 0) {
            adminService.insertBatchAdmin(admins);
            admins.clear();
        }

    }
}
