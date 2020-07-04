package com.bean;

public class Record {
    private Integer id;

    private Integer stuNumber;

    private String stuName;

    private String date;

    private String sort;

    private String picture;

    private String applyName;

    private Double applyCredit;

    private String words;

    private Double auditCredit;

    private String auditTea;

    private String auditState;

    public Record() {
    }

    public Record(Integer stuNumber, String sort, String applyName, Double auditCredit, String auditState) {
        this.stuNumber = stuNumber;
        this.sort = sort;
        this.applyName = applyName;
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