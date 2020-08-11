package com.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author hbk
 * @date 2020/8/11
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StuExcel {
    @ExcelProperty("学号")
    private Integer stuNumber;// 学号

    @ExcelProperty("姓名")
    private String stuName;// 姓名

    @ExcelProperty("学院")
    private String collegeName;// 学院名称

    @ExcelProperty("专业")
    private String major;// 专业

    @ExcelProperty("班级")
    private String className;// 班级
}
