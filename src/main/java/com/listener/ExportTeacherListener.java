package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.Teacher;
import com.bean.TeacherExcel;
import com.service.CollegeService;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.LinkedList;
import java.util.List;

/**
 * 监听批量教师excel的导入
 */
@Component
@Scope("prototype")
public class ExportTeacherListener extends AnalysisEventListener<TeacherExcel> {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CollegeService collegeService;

    List<Teacher> teachers = new LinkedList<>();

    @Override
    public void invoke(TeacherExcel teacherExcel, AnalysisContext analysisContext) {

        Teacher teacher = new Teacher();

        teacher.setTeaNumber(teacherExcel.getTeaNumber());

        teacher.setTeaName(teacherExcel.getTeaName());

        teacher.setPassword(String.valueOf(teacherExcel.getTeaNumber()));

        teacher.setCollegeId(collegeService.getCollegeIdByName(teacherExcel.getCollegeName()));

        teacher.setGender(teacherExcel.getGender());

        teacher.setPhone(teacher.getPhone());

        teacher.setEmail(teacher.getEmail());

        teacher.setTeaPositon(teacherExcel.getTeaPositon());

        teachers.add(teacher);

        if (teachers.size() % 50 == 0) {
            //执行批量插入语句
            teacherService.insertTeacherByExcel(teachers);
            teachers.clear();
        }

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

        if(teachers.size()!=0){
            teacherService.insertTeacherByExcel(teachers);
        }

        teachers.clear();
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }
}
