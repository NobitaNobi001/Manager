package com.utils;

/**
 * @author hbk
 * @date 2020/9/6
 **/
public class DeclareSortUtil {
    public static String getApplySort(int sort) {
        String applySort = null;
        switch (sort) {
            case 1:
                applySort = "大学生学科竞赛活动(含大学生创新创业训练项目)";
                break;
            case 2:
                applySort = "大学生文体竞赛活动";
                break;
            case 3:
                applySort = "创新创业实践训练(课程)";
                break;
            case 4:
                applySort = "论文、专利、作品发表";
                break;
            case 5:
                applySort = "职业(等级)证书";
                break;
            case 6:
                applySort = "参与教师科研(或实验室工作)";
                break;
            case 7:
                applySort = "社会实践(调查)";
                break;
            case 8:
                applySort = "读书活动";
                break;
            case 9:
                applySort = "学生工作与社团活动";
                break;
            case 10:
                applySort = "专业认定的其他创新实践活动";
                break;
        }
        return applySort;
    }
}
