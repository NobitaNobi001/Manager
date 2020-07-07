package com.utils;

/**
 * @author hbk
 * @date 2020/7/6
 **/
public class CollegeName {

    /**
     * 获取学院的表名
     * @param id 学院id
     * @return
     */
    public static String getTableName(int id) {
        String tableName = "";
        switch (id) {
            case 1:
                tableName = "college_stu_01";
                break;
            case 2:
                tableName = "college_stu_02";
                break;
            case 3:
                tableName = "college_stu_03";
                break;
            case 4:
                tableName = "college_stu_04";
                break;
            case 5:
                tableName = "college_stu_05";
                break;
            case 6:
                tableName = "college_stu_06";
                break;
            case 7:
                tableName = "college_stu_07";
                break;
            case 8:
                tableName = "college_stu_08";
                break;
            case 9:
                tableName = "college_stu_09";
                break;
            case 10:
                tableName = "college_stu_10";
                break;
            case 11:
                tableName = "college_stu_11";
                break;
            case 12:
                tableName = "college_stu_12";
                break;
            case 13:
                tableName = "college_stu_13";
                break;
            case 14:
                tableName = "college_stu_14";
                break;
            case 15:
                tableName = "college_stu_15";
                break;
            case 16:
                tableName = "college_stu_16";
                break;
            case 17:
                tableName = "college_stu_17";
                break;
            case 18:
                tableName = "college_stu_18";
                break;
        }
        return tableName;
    }
}

