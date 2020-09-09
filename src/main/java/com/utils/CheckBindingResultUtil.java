package com.utils;

import org.springframework.validation.BindingResult;

/**
 * @author hbk
 * @date 2020/9/7
 **/
/*
* jsr303工具类检查数据是否合法
* */
public class CheckBindingResultUtil {
    public static void checkAbnormalData(BindingResult bindingResult){
        if (bindingResult == null) {
            return;
         }
        if (bindingResult.hasErrors()) {
            String errorMessage = bindingResult.getAllErrors().get(0).getDefaultMessage();
            if (errorMessage != null && errorMessage.length() > 50) {
                errorMessage = "参数错误";
            }
            throw new RuntimeException(errorMessage);
            }
    }
}
