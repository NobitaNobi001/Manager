package com.bean;

import java.io.Serializable;

public class College implements Serializable {
    // 学院id
    private Integer id;

    // 学院名称
    private String name;

    // 每个学院的申请规则
    private String rule;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule == null ? null : rule.trim();
    }
}