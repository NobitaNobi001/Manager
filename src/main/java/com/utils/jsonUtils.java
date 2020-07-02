package com.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.text.SimpleDateFormat;

/**
 * @author hbk
 * @date 2020/6/24
 **/
public class jsonUtils {
    public static String getJson(Object o){
        return getJson(o,"yyyy-MM-dd");
    }
    //将java对象转为json发送给前端
    public static String getJson(Object o, String dataformat){
        ObjectMapper mapper=new ObjectMapper();
        //不适用默认的时间戳的方式(毫秒值)
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        //使用自定义的日期格式
        SimpleDateFormat sdf=new SimpleDateFormat(dataformat);
        mapper.setDateFormat(sdf);
        try {
            return mapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
