package com.bean;

public class Teacher {
    private Integer id;

    private Integer teaNumber;

    private String password;

    private String teaName;

    private Integer collegeId;

    private String gender;

    private String teaPositon;

    private String phone;

    private String email;

    private College college;

    public Teacher() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeaNumber() {
        return teaNumber;
    }

    public void setTeaNumber(Integer teaNumber) {
        this.teaNumber = teaNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName == null ? null : teaName.trim();
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

    public String getTeaPositon() {
        return teaPositon;
    }

    public void setTeaPositon(String teaPositon) {
        this.teaPositon = teaPositon == null ? null : teaPositon.trim();
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

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }
}