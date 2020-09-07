package com.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeacherExcel {

    @ExcelProperty("工号")
    private Integer teaNumber;

    @ExcelProperty("姓名")
    private String teaName;

    @ExcelProperty("学院")
    private String collegeName;

    @ExcelProperty("性别")
    private String gender;

    @ExcelProperty("职称")
    private String teaPositon;

    @ExcelProperty("邮箱")
    private String email;

    @ExcelProperty("手机号")
    private String phone;

}
