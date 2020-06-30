package com.bean;

public class Watcher {
    private Integer id;

    private Integer watcherNumber;

    private String password;

    private String name;

    private String insititue;

    private String phone;

    private String email;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getInsititue() {
        return insititue;
    }

    public void setInsititue(String insititue) {
        this.insititue = insititue == null ? null : insititue.trim();
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