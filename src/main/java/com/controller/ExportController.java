package com.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.write.builder.ExcelWriterBuilder;
import com.alibaba.excel.write.builder.ExcelWriterSheetBuilder;
import com.bean.CollegeStu;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.CollegeStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 导出记录的控制类
 */
@Controller
@RequestMapping("/export")
public class ExportController {

    @Autowired
    CollegeStuService collegeStuService;

    @Autowired
    ObjectMapper objectMapper;

    /**
     * 导出学生的学分信息
     * 包括 学院 专业 班级 学号 姓名 总学分
     * 若专业、班级未做选择则excel中不出现这一列
     *
     * @param collegeId 学院id
     * @param major     专业
     * @param stuClass  班级
     * @param order     顺序
     */
    @RequestMapping("/exportStu")
    public void exportStu(HttpServletResponse response, @RequestParam Integer collegeId, @RequestParam(defaultValue = "-1") String major, @RequestParam(defaultValue = "-1") String stuClass, @RequestParam Integer order) throws IOException {

        System.out.println(collegeId);
        System.out.println(major);
        System.out.println(stuClass);
        System.out.println(order);
        System.out.println(collegeStuService.getInfo(collegeId, major, stuClass, order));

        //获取表名
//        String collegeName = CollegeNameUtil.getTableName(collegeId);

        try {
            ExcelWriterSheetBuilder sheet = null;

            response.setContentType("application/vnd.ms-excel");

            response.setCharacterEncoding("utf-8");

            String fileName = URLEncoder.encode("湖北文理学院学生学分信息表", "UTF-8");

            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");

            ServletOutputStream outputStream = response.getOutputStream();

            // 创建工作簿
            ExcelWriterBuilder writeWordBook = EasyExcel.write(outputStream, CollegeStu.class);

            sheet = writeWordBook.sheet("学生学分信息");

            List<CollegeStu> collegeStus = collegeStuService.getInfo(collegeId, major, stuClass, order);

            //将信息写入到工作表
            sheet.doWrite(collegeStus);


        } catch (Exception e) {

            // 重置response
            response.reset();
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
//            Map<String, String> map = new HashMap<String, String>();
//            map.put("status", "failure");
//            map.put("message", "下载文件失败" + e.getMessage());
//            response.getWriter().println(objectMapper.writeValueAsString(map));
            e.printStackTrace();
        }


    }
}