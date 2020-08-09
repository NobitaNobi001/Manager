package com.bean;

public class Credit {
    private Integer id;

    private Integer stuNumber;

    private Double sumCredit;

    public Credit() {
    }

    public Credit(Integer stuNumber, Double auditCredit) {
        this.stuNumber = stuNumber;
        this.sumCredit = auditCredit;
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

    public Double getSumCredit() {
        return sumCredit;
    }

    public void setSumCredit(Double sumCredit) {
        this.sumCredit = sumCredit;
    }
}