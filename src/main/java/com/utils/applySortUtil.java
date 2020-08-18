package com.utils;

/**
 * 申报类别的工具类
 */
public class applySortUtil {

    public static String getApplyName(String number){

        String sort="";

        switch (Integer.valueOf(number)) {
            case 1:
                sort = "大学生学科竞赛活动（含大学生创新创业训练项目）";
                break;
            case 2:
                sort = "大学生文体竞赛活动";
                break;
            case 3:
                sort = "创新创业实践训练";
                break;
            case 4:
                sort = "论文、专利、作品发表";
                break;
            case 5:
                sort = "职业（等级）证书";
                break;
            case 6:
                sort = "参与教师科研（或实验室工作）";
                break;
            case 7:
                sort = "社会实践（调查）";
                break;
            case 8:
                sort = "读书活动";
                break;
            case 9:
                sort = "学生工作与社团活动";
                break;
            case 10:
                sort = "专业认定的其他创新实践活动";
                break;
        }

        return sort;
    }
}
