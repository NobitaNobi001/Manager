package com.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.listener.ExportWatcherListener;
import com.service.CollegeService;
import com.service.CollegeStuService;
import com.service.WatcherService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/watcher")
public class WatcherController {


    @Autowired
    private WatcherService watcherService;

    @Autowired
    private ExportWatcherListener watcherListener;

    /**
     * 更新督察的密码
     *
     * @param oldPass 旧密码
     * @param newPass 新密码
     * @param resPass 重复输入的新密码
     * @param request
     * @return
     */
    @PutMapping(value = "/updatePassword/{id}")
    @ResponseBody
    public Msg updatePassword(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("resPass") String resPass, HttpServletRequest request) {

        Watcher watcher = (Watcher) request.getSession().getAttribute("watcher");


        if (!(newPass.equals(resPass))) {
            return Msg.fail().add("msg", "两次密码输入不一致!");
        } else if (!(watcher.getPassword().equals(oldPass))) {
            return Msg.fail().add("msg", "原密码输入错误!");
        } else {
            watcherService.updateWatcher(watcher);
            return Msg.success();
        }
    }

    /**
     * 根据主键更改信息
     *
     * @param watcher
     * @return
     */
    @PutMapping(value = "/updateInfo/{id}")
    @ResponseBody
    public Msg updateInfo(Watcher watcher,HttpServletRequest request) {

        Watcher watcher1 = watcherService.selectByPrimaryKey(watcher.getId());

        if (watcher.getEmail().equals(watcher1.getEmail()) && watcher.getPhone().equals(watcher1.getPhone()) && watcher.getGender().equals(watcher1.getGender())) {
            //如果要修改的电话号码和邮箱都是相同的
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            watcherService.updateWatcher(watcher);

            Watcher watcher2 = watcherService.selectWatcherByWatcherNumber(watcher1.getWatcherNumber());

            request.getSession().setAttribute("watcher",watcher2);

            return Msg.success();
        }
    }

    /**
     * 回显督察信息
     *
     * @param pn
     * @return
     */
    @GetMapping(value = "/watchers")
    @ResponseBody
    public Msg selectWatchers(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {

        //设置起始页码以及每页的记录条数
        PageHelper.startPage(pn, 5);

        List<Watcher> watchers = watcherService.selectWatchers();
        //如果没有督察信息
        if (watchers.size() == 0) {
            return Msg.fail();
        }

        //封装为page对象
        PageInfo pages = new PageInfo(watchers, 5);

        return Msg.success().add("pageInfo", pages);
    }

    /**
     * 校验督察账号是否可用
     *
     * @param watcherNumber
     * @return
     */
    @PostMapping(value = "/checkWatcher")
    @ResponseBody
    public Msg checkWatcher(Integer watcherNumber) {

        boolean flag = watcherService.checkWatcher(watcherNumber);

        if (flag) {
            return Msg.success();
        } else {
            return Msg.fail().add("msg", "督察账号已存在");
        }
    }

    /**
     * 新增单个督察
     *
     * @param watcher
     * @return
     */
    @PostMapping(value = "/insertWatcher")
    @ResponseBody
    public Msg insertWatcher(Watcher watcher) {

        watcher.setPassword(String.valueOf(watcher.getWatcherNumber()));

        System.out.println(10/0);

        watcherService.insertWatcher(watcher);

        return Msg.success();
    }

    /**
     * 删除督察
     *
     * @param id
     * @return
     */
    @DeleteMapping(value = "/deleteWatcher/{id}")
    @ResponseBody
    public Msg deleteWatcher(@PathVariable("id") String id) {

        if (id.contains("-")) {

            List<Integer> deleteIds = new ArrayList<>();

            String[] ids = id.split("-");

            for (String temp : ids) {
                deleteIds.add(Integer.valueOf(temp));
            }

            watcherService.batchDeleteWathcers(deleteIds);

        } else {
            watcherService.deleteWatcher(Integer.valueOf(id));
        }


        return Msg.success();
    }

    /**
     * 根据主键查找督察信息
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/getWatcher/{id}")
    @ResponseBody
    public Msg getWatcher(@PathVariable("id") Integer id) {

        Watcher watcher = watcherService.selectByPrimaryKey(id);
        return Msg.success().add("watcherInfo", watcher);
    }

    /**
     * 根据主键更新督察信息
     *
     * @param watcher
     * @return
     */
    @PutMapping(value = "/updateWatcher/{id}")
    @ResponseBody
    public Msg updateWatcher(Watcher watcher) {

        watcherService.updateWatcherByPrimaryKey(watcher);

        return Msg.success();
    }

    @GetMapping(value = "/searchWatchers")
    @ResponseBody
    public Msg findWatchers(@RequestParam("pn") Integer pn, @RequestParam("collegeId") Integer collegeId, @RequestParam("keywords") String keywords) {

        PageHelper.startPage(pn, 5);

        List<Watcher> watchers = watcherService.findWathcerWithCondition(collegeId, keywords);

        if (watchers == null) {
            return Msg.fail();
        }

        PageInfo pages = new PageInfo(watchers, 5);

        return Msg.success().add("pageInfo", pages);
    }

    @RequestMapping("/insertWatcherByExcel")
    @ResponseBody
    public Msg insertBatchWatcher(@RequestParam("ExcelFile") MultipartFile uploadExcel){

        // 判断是否为null文件
        if (uploadExcel.getSize() == 0) {
            return Msg.fail().add("message", "请选择文件");
        }
        // 判断文件类型是否为xls
        int begin = uploadExcel.getOriginalFilename().indexOf(".");
        int last = uploadExcel.getOriginalFilename().length();
        //获得文件后缀名
        String suffix = uploadExcel.getOriginalFilename().substring(begin, last);
        if (!suffix.endsWith(".xls")) {
            return Msg.fail().add("message", "请上传xls文件,且根据模板导入");
        }

        try {
            // 工作簿
            ExcelReaderBuilder readWorkBook = EasyExcel.read(uploadExcel.getInputStream(), WatcherExcel.class, watcherListener);
            // 工作表
            ExcelReaderSheetBuilder sheet = readWorkBook.sheet();

            // 读
            sheet.doRead();
        } catch (Exception e) {

            e.printStackTrace();
        }

        return Msg.success().add("message", "导入成功");
    }

}