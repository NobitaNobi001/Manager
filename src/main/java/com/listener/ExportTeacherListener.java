package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.Teacher;
import com.bean.TeacherExcel;
import com.service.TeacherService;
import com.utils.CollegeNameUtil;
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
    TeacherService teacherService;

    List<Teacher> teachers = new LinkedList<>();

    @Override
    public void invoke(TeacherExcel teacherExcel, AnalysisContext analysisContext) {
        Teacher teacher = new Teacher();
        teacher.setTeaNumber(teacherExcel.getTeaNumber());
        teacher.setTeaName(teacherExcel.getTeaName());
        teacher.setPassword(String.valueOf(teacherExcel.getTeaNumber()));
        teacher.setCollegeId(CollegeNameUtil.getCollegeId(teacherExcel.getCollegeName()));
        teacher.setTeaPositon(teacherExcel.getTeaPositon());
        teachers.add(teacher);

        if(teachers.size()%5==0){
            //执行批量插入语句
        }

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}