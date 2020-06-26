package com.bean;

public class Record {
    private Integer id;

    private Integer stuNumber;

    private String stuName;

    private String date;

    private String sort;

    private Double applyCredit;

    private Double auditCredit;

    private String auditTea;

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

    public Double getApplyCredit() {
        return applyCredit;
    }

    public void setApplyCredit(Double applyCredit) {
        this.applyCredit = applyCredit;
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
}