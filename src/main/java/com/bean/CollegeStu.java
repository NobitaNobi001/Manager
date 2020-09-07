package com.bean;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

@ContentStyle(horizontalAlignment = HorizontalAlignment.CENTER)
@HeadRowHeight(30)
@HeadStyle(horizontalAlignment = HorizontalAlignment.CENTER)
@HeadFontStyle(bold = true)
public class CollegeStu {

    //学院 年级 专业 班级 学号 姓名 学分

    //主键
    @ExcelIgnore
    private int id;

    //学院表id
    @ExcelIgnore
    private int collegeId;

    //学生学号
    @ExcelProperty(value = "学号", index = 4)
    @ColumnWidth(15)
    private int stuNumber;

    //学生姓名
    @ExcelProperty(value = "姓名", index = 5)
    @ColumnWidth(15)
    private String stuName;

    //学生专业
    @ExcelProperty(value = "专业", index = 2)
    @ColumnWidth(15)
    private String major;

    //学生班级
    @ExcelProperty(value = "班级", index = 3)
    @ColumnWidth(15)
    private String stuClass;

    @ExcelProperty(value = "年级", index = 1)
    @ColumnWidth(15)
    //学生年级
    private String stuGrade;

    @ExcelIgnore
    private College college;

    @ExcelProperty(value = "学院", index = 0)
    @ColumnWidth(30)
    private String collegeName;

    @ExcelProperty(value = "学分", index = 6)
    @ColumnWidth(15)
    private double sumCredit;

    public CollegeStu() {
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public int getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(int stuNumber) {
        this.stuNumber = stuNumber;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public String getStuGrade() {
        return stuGrade;
    }

    public void setStuGrade(String stuGrade) {
        this.stuGrade = stuGrade;
    }

    public double getSumCredit() {
        return sumCredit;
    }

    public void setSumCredit(double sumCredit) {
        this.sumCredit = sumCredit;
    }
}