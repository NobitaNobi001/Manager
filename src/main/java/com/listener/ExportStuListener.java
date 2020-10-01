package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.StuExcel;
import com.bean.Student;
import com.service.AdminService;
import com.service.CollegeService;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 监听批量学生excel的导入
 */
@Component
@Scope("prototype")
public class ExportStuListener extends AnalysisEventListener<StuExcel> {
    @Autowired
    private AdminService adminService;

    @Autowired
    private CollegeService collegeService;

    List<Student> students = new ArrayList<>();

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    // 要读每一行内容，都要调用一次该对象的invoke，在invoke中可以操作要读取的数据
    @Override
    public void invoke(StuExcel stuExcel, AnalysisContext context) {
        Student student = new Student();
        student.setStuNumber(stuExcel.getStuNumber());
        student.setStuName(stuExcel.getStuName());
        student.setCollegeId(collegeService.getCollegeIdByName(stuExcel.getCollegeName()));
        student.setMajor(stuExcel.getMajor());
        student.setClassName(stuExcel.getClassName());
        student.setPassword(stuExcel.getStuNumber().toString().substring(4));
        student.setStuGrade(stuExcel.getStuNumber().toString().substring(0, 4));
        students.add(student);

        if (students.size() % 250 == 0) {// 每5条数据写入一次数据库
            saveData();
        }
    }

    // 读完整个完档之后调用的方法
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 确保最后遗留的数据也存储到数据库
        if (students.size() != 0) {
            saveData();
        }
    }

    private void saveData() {
        adminService.insertStuByExcel(students);
        students.clear();
    }
}