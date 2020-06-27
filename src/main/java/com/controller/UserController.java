package com.controller;

import com.bean.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    /**
     * 检查用户名是否可用
     *
     * @param username
     * @return
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(String username) {
        return Msg.success();
    }

}
