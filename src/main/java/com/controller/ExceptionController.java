package com.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {


    @ExceptionHandler(Exception.class)
    public ModelAndView ExceptionHandler(Exception e){

        ModelAndView model = new ModelAndView("common/error");

        model.addObject("msg","出问题了!");

        return model;
    }

//    @ExceptionHandler(SQLException.class)
//    public ModelAndView SQLExceptionHandler(Exception e){
//
//        ModelAndView model = new ModelAndView("common/error");
//
//        model.addObject("exception",e);
//
//        return model;
//    }

    @ExceptionHandler(ArithmeticException.class)
    public ModelAndView ArithmeticExceptionHandler(Exception e){

        ModelAndView model = new ModelAndView("common/error");

        model.addObject("exception",e);

        return model;
    }

}
