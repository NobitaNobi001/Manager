package com.bean;

public class Admin {
    private Integer id;

    private Integer adminNumber;

    private String password;

    private String adminName;

    private Integer collegeId;

    private String gender;

    private String phone;

    private String email;

    private String isSuper;

    private College college;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminNumber() {
        return adminNumber;
    }

    public void setAdminNumber(Integer adminNumber) {
        this.adminNumber = adminNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
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

    public String getIsSuper() {
        return isSuper;
    }

    public void setIsSuper(String isSuper) {
        this.isSuper = isSuper == null ? null : isSuper.trim();
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }
}