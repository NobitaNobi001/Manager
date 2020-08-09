package com.bean;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

@ContentStyle(horizontalAlignment = HorizontalAlignment.CENTER)
@HeadRowHeight(30)
@HeadStyle(horizontalAlignment = HorizontalAlignment.CENTER)
@HeadFontStyle(bold = true)
public class Record {
    @ExcelIgnore
    private Integer id;

    @ExcelProperty(value = {"学号"}, index = 0)
    @ColumnWidth(15)
    private Integer stuNumber;// 学生学号

    @ExcelProperty(value = "姓名", index = 1)
    @ColumnWidth(10)
    private String stuName;// 学生姓名

    @ExcelProperty(value = "申报日期", index = 2)
    @ColumnWidth(15)
    private String date;// 申报日期

    @ExcelProperty(value = "申报类别", index = 3)
    @ColumnWidth(50)
    private String sort;// 申请类别

    @ExcelIgnore
    private String picture;// 申请图片

    @ExcelProperty(value = "申报名称", index = 4)
    @ColumnWidth(20)
    private String applyName;// 申请活动名称

    @ExcelProperty(value = "申报学分", index = 5)
    @ColumnWidth(15)
    private Double applyCredit;// 申请学分

    @ExcelIgnore
    private String words;// 申请描述

    @ExcelProperty(value = "审核学分", index = 6)
    @ColumnWidth(15)
    private Double auditCredit;// 审核学分

    @ExcelProperty(value = "审核教师", index = 7)
    @ColumnWidth(15)
    private String auditTea;// 审核教师

    @ExcelProperty(value = "审核状态", index = 8)
    @ColumnWidth(15)
    private String auditState;// 审核状态

    public Record() {
    }

    public Record(Integer stuNumber, String sort, String applyName, Double applyCredit, Double auditCredit, String auditState) {
        this.stuNumber = stuNumber;
        this.sort = sort;
        this.applyName = applyName;
        this.applyCredit = applyCredit;
        this.auditCredit = auditCredit;
        this.auditState = auditState;
    }

    public Record(Integer stuNumber, String stuName, String date, String sort, String picture, String applyName, Double applyCredit, String words) {
        this.stuNumber = stuNumber;
        this.stuName = stuName;
        this.date = date;
        this.sort = sort;
        this.picture = picture;
        this.applyName = applyName;
        this.applyCredit = applyCredit;
        this.words = words;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(Integer stuNumber) {
        this.stuNumber = stuNumber;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getApplyName() {
        return applyName;
    }

    public void setApplyName(String applyName) {
        this.applyName = applyName == null ? null : applyName.trim();
    }

    public Double getApplyCredit() {
        return applyCredit;
    }

    public void setApplyCredit(Double applyCredit) {
        this.applyCredit = applyCredit;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words == null ? null : words.trim();
    }

    public Double getAuditCredit() {
        return auditCredit;
    }

    public void setAuditCredit(Double auditCredit) {
        this.auditCredit = auditCredit;
    }

    public String getAuditTea() {
        return auditTea;
    }

    public void setAuditTea(String auditTea) {
        this.auditTea = auditTea == null ? null : auditTea.trim();
    }

    public String getAuditState() {
        return auditState;
    }

    public void setAuditState(String auditState) {
        this.auditState = auditState == null ? null : auditState.trim();
    }

}