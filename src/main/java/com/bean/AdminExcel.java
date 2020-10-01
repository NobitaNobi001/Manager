package com.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminExcel {

    //工号
    @ExcelProperty("工号")
    private Integer adminNumber;

    //姓名
    @ExcelProperty("姓名")
    private String adminName;

    //院系
    @ExcelProperty("院系")
    private String collegeName;

    //性别
    @ExcelProperty("性别")
    private String gender;

    //类型
    @ExcelProperty("类型")
    private String isSuper;

    //手机号
    @ExcelProperty("手机号")
    private String phone;

    //邮箱
    @ExcelProperty("邮箱")
    private String email;
}
