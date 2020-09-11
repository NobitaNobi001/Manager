package com.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WatcherExcel {

    @ExcelProperty("工号")
    private Integer watcherNumber;

    @ExcelProperty("姓名")
    private String watcherName;

    @ExcelProperty("院系")
    private String collegeName;

    @ExcelProperty("性别")
    private String gender;

    @ExcelProperty("邮箱")
    private String email;

    @ExcelProperty("手机号")
    private String phone;
}
