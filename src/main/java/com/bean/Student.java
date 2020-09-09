package com.bean;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.*;
import java.io.Serializable;

public class Student implements Serializable {
    private Integer id;

    // 学号必须是10位，并且在合适的范围
    @Range(min = 2016000000,max = 2140000000,message = "学生学号必须在合适的范围之内")
    private Integer stuNumber;

    // 密码在6~16位之间
    @NotBlank(message = "密码不能为空")
    @Size(max = 18,min=6,message = "密码长度必须在6~18位之间")
    private String password;

    // 姓名
    @NotBlank(message = "学生姓名不能为空")
    private String stuName;

    // 学院id
    @NotNull(message = "学生所属的学院不能为空")
    private Integer collegeId;

    // 专业
    @NotBlank(message = "学生所属的专业不能为空")
    private String major;

    // 班级
    @NotBlank(message = "学生所属的班级不能为空")
    private String className;

    // 性别
    private String gender;

    // 手机
    private String phone;

    // 邮箱地址
    @Email(message = "邮箱地址格式错误")
    private String email;

    // 学院对象
    @NotNull
    private College college;

    // 总学分对象
    @NotNull
    private Double sumCredit;

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

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
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