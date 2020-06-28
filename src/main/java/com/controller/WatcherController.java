package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/watcher")
public class WatcherController {

    @RequestMapping("/watIndex")
    public String adminIndex(HttpServletRequest request, Model model){
        return "watcher";
    }
}
