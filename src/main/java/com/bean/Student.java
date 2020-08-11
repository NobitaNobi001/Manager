package com.bean;

import java.io.Serializable;

public class Student implements Serializable {
    private Integer id;

    private Integer stuNumber;// 学号

    private String password;// 密码

    private String stuName;// 姓名

    private int collegeId;// 学院id

    private String major;// 专业

    private String className;// 班级

    private String gender;// 性别

    private String phone;// 手机

    private String email;// 邮箱地址


    private College college;// 学院

    private Double sumCredit;// 总学分

    public Double getSumCredit() {
        return sumCredit;
    }

    public void setSumCredit(Double sumCredit) {
        this.sumCredit = sumCredit;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public Student() {
    }

    public Student(Integer id, String gender, String phone, String email) {
        this.id = id;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", stuNumber=" + stuNumber +
                ", password='" + password + '\'' +
                ", stuName='" + stuName + '\'' +
                ", collegeId=" + collegeId +
                ", major='" + major + '\'' +
                ", className='" + className + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", college=" + college +
                ", sumCredit=" + sumCredit +
                '}';
    }
}