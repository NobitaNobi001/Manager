package com.bean;

public class Watcher {

    private Integer id;

    private Integer watcherNumber;

    private String password;

    private String watcherName;

    private Integer collegeId;

    private String gender;

    private String phone;

    private String email;

    private College college;

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWatcherNumber() {
        return watcherNumber;
    }

    public void setWatcherNumber(Integer watcherNumber) {
        this.watcherNumber = watcherNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getWatcherName() {
        return watcherName;
    }

    public void setWatcherName(String watcherName) {
        this.watcherName = watcherName == null ? null : watcherName.trim();
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
}