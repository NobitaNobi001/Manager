package com.bean;

public class Teacher {
    private Integer id;

    private Integer teaNumber;

    private String password;

    private String name;

    private String institute;

    private String teaPositon;

    private String phone;

    private String email;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute == null ? null : institute.trim();
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
}