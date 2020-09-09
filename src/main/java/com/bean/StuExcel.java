package com.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class StuExcel {
    // 学号
    @ExcelProperty("学号")
    private Integer stuNumber;

    // 姓名
    @ExcelProperty("姓名")
    private String stuName;

    // 学院名称
    @ExcelProperty("院系")
    private String collegeName;

    // 专业
    @ExcelProperty("专业")
    private String major;

    // 班级
    @ExcelProperty("班级")
    private String className;
}
