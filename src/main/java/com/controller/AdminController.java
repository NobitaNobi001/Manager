package com.controller;


import com.Listener.ExportStuListener;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.alibaba.excel.write.builder.ExcelWriterBuilder;
import com.alibaba.excel.write.builder.ExcelWriterSheetBuilder;
import com.bean.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private WatcherService watcherService;
    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private ExportStuListener stuListener;


    /**
     * 跳转管理员首页
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/admIndex")
    public String adminIndex(HttpServletRequest request, Model model) {

        Integer adminNumber = (Integer) request.getSession().getAttribute("number");

        //查询出管理员的基本信息
        Admin admin = adminService.selectAdminByAdminNumber(adminNumber);

        //查询出申报记录数量
        Integer records = recordService.selectCountRecord();

        //查询教师数量
        Integer teachers = teacherService.selectCountTeacher();

        //查询出学生数量
        Long students = studentService.selectCountStudent();
        //查询出督察数量
        Integer watchers = watcherService.selectCountWatcher();

        //管理员的基本信息
        model.addAttribute("admin", admin);
        //申报记录数量
        model.addAttribute("records", records);
        //教师数量
        model.addAttribute("teachers", teachers);
        //学生数量
        model.addAttribute("students", students);
        //督察数量
        model.addAttribute("watchers", watchers);


        return "admin/admin";
    }


    /**
     * 学生管理界面
     * @return
     */
    @RequestMapping("/stuManager")
    public String studentManager(){

        return "admin/studentManager";
    }

    /**
     * 教师管理界面
     * @return
     */
    @RequestMapping("teaManager")
    public String teacherManager(){

        return "admin/teacherManager";
    }

    /**
     * 督察管理界面
     * @return
     */
    @RequestMapping("/watManager")
    public String watcherManager(){

        return "admin/watcherManager";
    }

    /**
     * 督察个人信息界面
     *
     * @return
     */
    @RequestMapping("/admProfile")
    public String adminProdile() {

        return "admin/profile";
    }

    /**
     * @Description: 学分记录表默认页面
     * @return:
     */
    @RequestMapping("/toSee/studentRecord.html")
    public String getAllStudentRecord(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model, HttpServletRequest request) {
        List<Record> allRecord = recordService.getAllRecordByAdmin(page, 5);
        PageInfo<Record> info = new PageInfo(allRecord);
        request.setAttribute("direction", "toSee");
        model.addAttribute("info", info);
        return "admin/declareManager";
    }

    /**
     * @Description: 根据学院专业班级查到学生id后，查询学生的申报记录
     * @return:
     */
    @RequestMapping("/toQuery/studentRecord.html")
    public String getStudentRecordByFormSelect(@RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "college", required = false) Integer collegeId, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "stuClass", required = false) Integer stuClass, Model model, HttpServletRequest request) {
        List<Record> allRecordByadminQuery = recordService.getAllRecordByAdminQuery(page, 5, collegeId, major, stuClass);
        PageInfo<Record> info = new PageInfo(allRecordByadminQuery);
        request.setAttribute("direction", "toQuery");
        request.setAttribute("college", collegeId);
        request.setAttribute("major", major);
        request.setAttribute("stuClass", stuClass);
        model.addAttribute("info", info);
        return "admin/declareManager";
    }


    /**
     * @Description: 导出申报记录
     * @return: void
     */
    @RequestMapping("/exportStuRecord")
    public void exportStuRecord(HttpServletResponse response, @RequestParam(value = "college", required = false) Integer collegeId, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "stuClass", required = false) Integer stuClass, @RequestParam(value = "auditState", required = false) String auditState) throws IOException {
        try {
            String collegeName = "";
            ExcelWriterSheetBuilder sheet = null;
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            String fileName = URLEncoder.encode("湖北文理学院创新学分申报表", "UTF-8");
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            ServletOutputStream outputStream = response.getOutputStream();
            // 创建工作簿
            ExcelWriterBuilder writeWordBook = EasyExcel.write(outputStream, Record.class);
            // 获取工作表对象
            if (collegeId != -1) {
                collegeName = CollegeName.getTableName(collegeId);
            }
            if (collegeName != "") {
                sheet = writeWordBook.sheet(collegeName);
            } else {
                sheet = writeWordBook.sheet("申报记录");
            }
            // 准备数据 从service中查询
            List<Record> records = recordService.getAllRecordToExport(collegeId, major, stuClass, auditState);
            // 写
            sheet.doWrite(records);
        } catch (Exception e) {
            // 重置response
            response.reset();
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            Map<String, String> map = new HashMap<String, String>();
            map.put("status", "failure");
            map.put("message", "下载文件失败" + e.getMessage());
            response.getWriter().println(objectMapper.writeValueAsString(map));
            e.printStackTrace();
        }
    }

    /**
     * @Description:学生列表默认
     * @return:
     */
    @RequestMapping("/get/student.html")
    public String getStuPageInfo(@RequestParam(value = "keyword", defaultValue = "") String keyword, @RequestParam(value = "college", defaultValue = "-1") Integer collegeId, @RequestParam(value = "major", defaultValue = "-1") String major, @RequestParam(value = "stuClass", defaultValue = "-1") Integer stuClass, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, Model model) {
        PageInfo<Student> pageInfo = recordService.selectStuBykeyword(pageNum, pageSize, collegeId, major, stuClass, keyword);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/studentManager";
    }

    /**
     * @Description: 管理员更新学生信息
     * @return:
     */
    @RequestMapping("/updateStu.html")
    public String updateStu(@RequestParam(value = "keyword", defaultValue = "") String keyword, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Student student) {
        System.out.println(student);
        adminService.updateStu(student);
        return "redirect:/admin/get/student.html?+keyword=" + keyword + "&pageNum=" + pageNum;
    }

    /**
     * @Description: 删除学生信息
     * @return:
     */
    @RequestMapping(value = "/deleteStu/{StuNumbers}", method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteStu(@PathVariable("StuNumbers") String StuNumbers) {
        // 判断是批量删除还是单个删除
        if (StuNumbers.contains("-")) {//批量删除
            String[] stuNumber_arr = StuNumbers.split("-");
            List<Integer> list = new ArrayList<>();
            for (String stuNumber : stuNumber_arr) {
                list.add(Integer.parseInt(stuNumber));
            }
            System.out.println(list);
            int count = adminService.deleteStuBatch(list);
            if (count == list.size()) {
                return "删除成功";
            } else {
                return "删除失败";
            }
        } else {//单个删除员工
            int stuNumber = Integer.parseInt(StuNumbers);
            int count = adminService.deleteStu(stuNumber);
            if (count == 1) {
                return "删除成功";
            } else {
                return "删除失败";
            }
        }
    }


    /**
     * @Description: 判断学生学号是否重复
     * @return:
     */
    @RequestMapping("/checkStuNumberISExist")
    @ResponseBody
    public String checkStuNumberISExist(@RequestParam("stuNumber") Integer stuNumber) throws JsonProcessingException {
        boolean flag = adminService.checkStuNumberISExist(stuNumber);
        Map<String, Boolean> map = new HashMap();
        map.put("valid", flag);
        return objectMapper.writeValueAsString(map);
    }


    /**
     * @Description: 新增单个学生
     * @return:
     */
    @RequestMapping("/insertStuByForm")
    public String insertStuByForm(Student student) {
        // 获取学号
        Integer stuNumber = student.getStuNumber();
        // 截取学号的后六位生成密码
        String password = stuNumber.toString().substring(4);
        student.setPassword(password);
        // service插入
        adminService.insertStuByForm(student);
        // 返回页面的最后一页
        return "redirect:/admin/get/student.html?college" + student.getCollegeId() + "&pageNum=" + Integer.MAX_VALUE;
    }

    /**
     * @Description: 通过excel文件批量插入学生
     * @return: void
     */
    @RequestMapping("/insertStuByExcel")
    @ResponseBody
    public String insertStuByExcel(@RequestParam("ExcelFile") MultipartFile uploadExcel) throws IOException {
        // 工作簿
        ExcelReaderBuilder readWorkBook = EasyExcel.read(uploadExcel.getInputStream(), StuExcel.class, stuListener);
        // 工作表
        ExcelReaderSheetBuilder sheet = readWorkBook.sheet();
        // 读
        sheet.doRead();
        return "导入成功";
    }
}
