package com.controller;

import com.bean.Msg;
import com.bean.Sort;
import com.service.SortService;
import com.utils.SortUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * 类别控制类
 */
@RequestMapping("/sort")
@Controller
public class SortController {

    @Autowired
    private SortService sortService;

    /**
     * 根据学院id获取类别的审核上限
     * @param collegeId
     * @return
     */
    @GetMapping("/sort")
    @ResponseBody
    public Msg getSort(@RequestParam("collegeId") Integer collegeId) {

        Sort sort = sortService.getSort(collegeId);

        return Msg.success().add("sort", sort);
    }

    /**
     * 更新审核上限
     * @param collegeId
     * @param sortGrade
     * @param sortId
     * @return
     */
    @PutMapping("/sort")
    @ResponseBody
    public Msg updateSort(@RequestParam("collegeId") Integer collegeId, @RequestParam("sort") double sortGrade,@RequestParam("sortId") Integer sortId) {

        //获取设置了新的上线的sort对象
        Sort sort = SortUtil.getSortByName(sortId,sortGrade);

        //设置主键id
        sort.setId(collegeId);

        //更新此条上限
        sortService.updateSort(sort);

        return Msg.success();
    }


}
