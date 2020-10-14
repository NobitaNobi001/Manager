package com.controller;

import com.bean.Admin;
import com.bean.CreditDetail;
import com.bean.Msg;
import com.service.AdminService;
import com.service.CollegeStuService;
import com.service.RecordService;
import com.service.TeacherService;
import com.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 学院管理员控制器
 */
@Controller
@RequestMapping("/admins")
public class AdminsController {

    @Autowired
    private CollegeStuService collegeStuService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private RecordService recordService;


    @RequestMapping("/getCreditProfileWithGrade")
    @ResponseBody
    public String getCreditProfile(
            @RequestParam(value = "collegeId") int collegeId,
            @RequestParam(value = "Grade", defaultValue = "-1") String Grade
    ) {
        // 哪一类创新活动得分多，哪一类得分少
        List<CreditDetail> creditProfile = recordService.getCreditProfileWithGrade(collegeId, Grade);
        return JsonUtil.getJson(creditProfile);
    }


    /**
     * 获取一个学院中所有不重复的年级
     *
     * @param collegeId
     * @return
     */
    @GetMapping("/grades")
    @ResponseBody
    public Msg getGradeWithCollege(@RequestParam("collegeId") Integer collegeId) {

        List<String> grades = collegeStuService.getAllGrade(collegeId);

        if (grades == null) {
            return Msg.fail();
        }

        return Msg.success().add("grades", grades);
    }

    /**
     * 根据教师id更新教师的审核年级
     * @param id
     * @param auditGrade
     * @return
     */
    @PutMapping("/auditGrade/{id}")
    @ResponseBody
    public Msg updateGrade(@PathVariable("id") Integer id,@RequestParam("auditGrade") String auditGrade){

        teacherService.updateAuditGradeWithPrimaryKey(id,auditGrade);
        return Msg.success();
    }

    /**
     * 更新学院管理员密码
     *
     * @param oldPass 旧密码
     * @param newPass 新密码
     * @param resPass 重复输入的密码
     * @param request
     * @return
     */
    @PutMapping(value = "/updatePassword/{id}")
    @ResponseBody
    public Msg updatePassword(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("resPass") String resPass, HttpServletRequest request) {

        Admin admin = (Admin) request.getSession().getAttribute("admins");

        if (!(newPass.equals(resPass))) {
            return Msg.fail().add("msg", "两次密码输入不一致!");
        } else if (!(admin.getPassword().equals(oldPass))) {
            return Msg.fail().add("msg", "原密码输入错误!");
        } else {
            adminService.updateAdmin(admin);
            return Msg.success();
        }
    }

    /**
     * 更新学院管理员的个人信息
     *
     * @param admin
     * @return
     */
    @PutMapping(value = "/updateInfo/{id}")
    @ResponseBody
    public Msg updateInfo(Admin admin, HttpServletRequest request) {

        Admin admin1 = (Admin) request.getSession().getAttribute("admins");

        if ("".equals(admin.getEmail()) || "".equals(admin.getPhone()) || "".equals(admin.getGender())) {
            adminService.updateAdmin(admin);

            Admin admin2 = adminService.selectAdminByAdminNumber(admin1.getAdminNumber());

            request.getSession().setAttribute("admins", admin2);

            return Msg.success();
        }

        //如果要修改的电话号码和邮箱都是相同的
        if (admin1.getEmail().equals(admin.getEmail()) && admin1.getPhone().equals(admin.getPhone()) && admin.getGender().equals(admin.getGender())) {
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            adminService.updateAdmin(admin);

            Admin admin2 = adminService.selectAdminByAdminNumber(admin1.getAdminNumber());

            request.getSession().setAttribute("admins", admin2);

            return Msg.success();
        }
    }

}
