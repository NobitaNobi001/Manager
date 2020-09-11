package com.utils;

/**
 * 获取学院对应数据表的工具类
 */
public class CollegeNameUtil {

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

    public static int getCollegeId(String collegeName) {
        int collegeId = 0;
        switch (collegeName) {
            case "马克思主义学院":
                collegeId = 1;
                break;
            case "政法学院":
                collegeId = 2;
                break;
            case "教育学院":
                collegeId = 3;
                break;
            case "体育学院":
                collegeId = 4;
                break;
            case "文学与传媒学院":
                collegeId = 5;
                break;
            case "外国语学院":
                collegeId = 6;
                break;
            case "数学与统计学院":
                collegeId = 7;
                break;
            case "物理与电子工程学院":
                collegeId = 8;
                break;
            case "计算机工程学院":
                collegeId = 9;
                break;
            case "汽车与交通工程学院":
                collegeId = 10;
                break;
            case "机械工程学院":
                collegeId = 11;
                break;
            case "土木工程与建筑学院":
                collegeId = 12;
                break;
            case "食品科学技术学院化学工程学院":
                collegeId = 13;
                break;
            case "医学院":
                collegeId = 14;
                break;
            case "资源环境与旅游学院":
                collegeId = 15;
                break;
            case "经济管理学院":
                collegeId = 16;
                break;
            case "美术学院":
                collegeId = 17;
                break;
            case "音乐与舞蹈学院":
                collegeId = 18;
                break;
        }
        return collegeId;
    }

    public static String getCollegeName(int id) {
        String collegeName="";
        switch (id) {
            case 1:
                collegeName = "马克思主义学院";
                break;
            case 2:
                collegeName = "政法学院";
                break;
            case 3:
                collegeName = "教育学院";
                break;
            case 4:
                collegeName = "体育学院";
                break;
            case 5:
                collegeName = "文学与传媒学院";
                break;
            case 6:
                collegeName = "外国语学院";
                break;
            case 7:
                collegeName = "数学与统计学院";
                break;
            case 8:
                collegeName = "物理与电子工程学院";
                break;
            case 9:
                collegeName = "计算机工程学院";
                break;
            case 10:
                collegeName = "汽车与交通工程学院";
                break;
            case 11:
                collegeName = "机械工程学院";
                break;
            case 12:
                collegeName = "土木工程与建筑学院";
                break;
            case 13:
                collegeName = "食品科学技术学院化学工程学院";
                break;
            case 14:
                collegeName = "医学院";
                break;
            case 15:
                collegeName = "资源环境与旅游学院";
                break;
            case 16:
                collegeName = "经济管理学院";
                break;
            case 17:
                collegeName = "美术学院";
                break;
            case 18:
                collegeName = "音乐与舞蹈学院";
                break;
        }
        return collegeName;
    }

}

