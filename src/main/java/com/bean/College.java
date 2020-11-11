package com.bean;

public class College {
    private Integer id;

    private String name;

    private String rule;

    public College() {
    }

    public College(Integer id, String name, String rule) {
        this.id = id;
        this.name = name;
        this.rule = rule;
    }

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