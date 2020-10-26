package com.controller;

import com.bean.*;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
import com.service.CollegeStuService;
import com.service.RecordService;
import com.service.TeacherService;
import com.utils.CollegeNameUtil;
import com.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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


    /**
     * 学生列表
     *
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/stuList")
    public String stuList(@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, Model model) {

        Admin admin = (Admin) request.getSession().getAttribute("admins");
        //查询教师的学院id得到学院表名称
        String tableName = CollegeNameUtil.getTableName(admin.getCollegeId());
        List<Student> students = adminService.selectStuByCollegeName(tableName, page, 5);
        PageInfo<Record> info = new PageInfo(students);
        model.addAttribute("info", info);

        //跳转到stuList页面
        return "admins/studentList";
    }

    /**
     * 条件查询学生
     *
     * @param page
     * @param stuNumber
     * @param stuName
     * @param stuClass
     * @param major
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/queryStu")
    public String queryStu(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(value = "stuNumber", required = false) Integer stuNumber, @RequestParam(value = "stuName", required = false) String stuName, @RequestParam(value = "stuClass", required = false) String stuClass, @RequestParam(value = "major", required = false) String major, Model model, HttpServletRequest request) {

        Admin admin = (Admin) request.getSession().getAttribute("admins");

        String tableName = CollegeNameUtil.getTableName(admin.getCollegeId());

        List<Student> students = adminService.selectStuByCondition(tableName, stuNumber, stuName, stuClass, page, 5, major);

        PageInfo<Record> info = new PageInfo(students);

        model.addAttribute("info", info);

        return "admins/studentList";
    }

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
        if (admin.getEmail().equals(admin1.getEmail()) && admin.getPhone().equals(admin1.getPhone()) && admin.getGender().equals(admin1.getGender())) {
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
