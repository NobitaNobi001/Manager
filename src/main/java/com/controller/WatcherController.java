package com.controller;

import com.bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeService;
import com.service.CollegeStuService;
import com.service.WatcherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/watcher")
public class WatcherController {


    @Autowired
    private WatcherService watcherService;

    /**
     * 跳转到主页
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/watIndex")
    public String adminIndex(HttpServletRequest request, Model model) {

        //获取登陆成功的督察账号
        Integer watcherNumber = (Integer) request.getSession().getAttribute("number");

        //根据督察账号查找督察信息
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(watcherNumber);

        model.addAttribute("watcher", watcher);

        return "watcher/watcher";
    }

    /**
     * 跳转到督察的个人信息页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/watProfile")
    public String watProfile(HttpServletRequest request, Model model) {

        //获取登陆成功的督察账号
        Integer watcherNumber = (Integer) request.getSession().getAttribute("number");

        //根据督察账号查找督察信息
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(watcherNumber);

        model.addAttribute("watcher", watcher);

        return "watcher/profile";
    }

    /**
     * 跳转到督察的修改密码页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/watPassword")
    public String watPassword(HttpServletRequest request, Model model) {

        //获取登陆成功的督察账号
        Integer watcherNumber = (Integer) request.getSession().getAttribute("number");

        //根据督察账号查找督察信息
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(watcherNumber);

        model.addAttribute("watcher", watcher);

        return "watcher/password";
    }

    /**
     * 跳转到教师审核界面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/watAudit")
    public String watAudit(HttpServletRequest request, Model model) {

        //获取登陆成功的督察账号
        Integer watcherNumber = (Integer) request.getSession().getAttribute("number");

        //根据督察账号查找督察信息
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(watcherNumber);

        model.addAttribute("watcher", watcher);


        return "watcher/teacherAudit";
    }

    /**
     * 根据主键修改密码
     *
     * @param watcher
     * @return
     */
    @RequestMapping(value = "/updatePassword/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updatePassword(Watcher watcher) {

        if (watcherService.selectByPrimaryKey(watcher.getId()).getPassword().equals(watcher.getPassword())) {   //如果要修改的密码和原密码相同
            return Msg.fail();
        } else {
            watcherService.updateWatcher(watcher);
            return Msg.success();
        }
    }

    /**
     * 根据主键更改密码
     *
     * @param watcher
     * @return
     */
    @RequestMapping(value = "/updateInfo/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateInfo(Watcher watcher) {

        Watcher watcher1 = watcherService.selectByPrimaryKey(watcher.getId());

        if (watcher.getEmail().equals(watcher1.getEmail()) && watcher.getPhone().equals(watcher1.getPhone()) && watcher.getGender().equals(watcher1.getGender())) {
            //如果要修改的电话号码和邮箱都是相同的
            return Msg.fail().add("msg", "要修改的信息和原信息相同!");
        } else {
            //否则更新信息
            watcherService.updateWatcher(watcher);

            return Msg.success();
        }
    }

    /**
     * 回显督察信息
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/watchers", method = RequestMethod.GET)
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
    @RequestMapping(value = "/checkWatcher", method = RequestMethod.POST)
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
    @RequestMapping(value = "/insertWatcher", method = RequestMethod.POST)
    @ResponseBody
    public Msg insertWatcher(Watcher watcher) {

        watcher.setPassword(String.valueOf(watcher.getWatcherNumber()));
        watcherService.insertWatcher(watcher);

        return Msg.success();
    }

    /**
     * 删除督察
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteWatcher/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteWatcher(@PathVariable("id") Integer id) {

        watcherService.deleteWatcher(id);

        return Msg.success();
    }

    /**
     * 根据主键查找督察信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/getWatcher/{id}", method = RequestMethod.GET)
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
    @RequestMapping(value = "/updateWatcher/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateWatcher(Watcher watcher) {

        watcherService.updateWatcherByPrimaryKey(watcher);

        return Msg.success();
    }

    @RequestMapping(value = "/searchWatchers", method = RequestMethod.GET)
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
}
