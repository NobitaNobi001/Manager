package com.listener;

import com.bean.College;
import com.constant.StringConstant;
import com.service.CollegeService;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class ContextListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        CollegeService collegeService = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext()).getBean(CollegeService.class);

        List<College> colleges = collegeService.getColleges();

        servletContextEvent.getServletContext().setAttribute(StringConstant.PROJECT_INIT_COLLEGES,colleges);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
