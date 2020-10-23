package com.utils;

import com.bean.Sort;

/**
 * 类别相关工具类
 */
public class SortUtil {

    /**
     * 根据id获取类别并设置上限
     *
     * @param nameId
     * @param sortGrade
     * @return
     */
    public static Sort getSortByName(Integer nameId, double sortGrade) {

        Sort sort = new Sort();

        switch (nameId) {
            case 1:
                sort.setSort01(sortGrade);
                break;
            case 2:
                sort.setSort02(sortGrade);
                break;
            case 3:
                sort.setSort03(sortGrade);
                break;
            case 4:
                sort.setSort04(sortGrade);
                break;
            case 5:
                sort.setSort05(sortGrade);
                break;
            case 6:
                sort.setSort06(sortGrade);
                break;
            case 7:
                sort.setSort07(sortGrade);
                break;
            case 8:
                sort.setSort08(sortGrade);
                break;
            case 9:
                sort.setSort09(sortGrade);
                break;
            case 10:
                sort.setSort10(sortGrade);
                break;
        }

        return sort;
    }

    /**
     * 根据名称获取上限
     * @param name
     * @param sort
     * @return
     */
    public static double getMaxByName(String name, Sort sort) {

        double max = 0;

        switch (name) {
            case "大学生学科竞赛活动(含大学生创新创业训练项目)":
                max = sort.getSort01();
                break;
            case "大学生文体竞赛活动":
                max = sort.getSort02();
                break;
            case "创新创业实践训练(课程)":
                max = sort.getSort03();
                break;
            case "论文、专利、作品发表":
                max = sort.getSort04();
                break;
            case "职业(等级)证书":
                max = sort.getSort05();
                break;
            case "参与教师科研(或实验室工作)":
                max = sort.getSort06();
                break;
            case "社会实践(调查)":
                max = sort.getSort07();
                break;
            case "读书活动":
                max = sort.getSort08();
                break;
            case "学生工作与社团活动":
                max = sort.getSort09();
                break;
            case "专业认定的其他创新实践活动":
                max = sort.getSort10();
                break;
        }

        return max;
    }

}
