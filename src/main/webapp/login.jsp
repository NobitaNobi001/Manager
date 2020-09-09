<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">

    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
</head>
<body>
<div id="login">
    <div class="login">
        <div class="top">
            <div class="logo"><img src="static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新实践学分管理系统</div>
        </div>
        <div class="login-form">
            <form action="user/login" method="post" role="form" class="form-horizontal">
                <h4>用户登录</h4>
                <div class="form-group">
                    <p><font color="red">${requestScope.exception.message }</font></p>
                </div>
                <div class="form-group">
                    <div class="input-group">
                       <span class="input-group-addon">
                     <span class="glyphicon glyphicon-user"></span>
                    </span>
                        <input type="text" name="stuNumber" class="form-control" placeholder="登录账号" autofocus value="2018139047"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                          <span class="input-group-addon">
                    <span class="glyphicon glyphicon-eye-open" id="eye"></span>
                    </span>
                        <input type="password" name="password" class="form-control" placeholder="登录密码" value="12345678"/>
                    </div>
                </div>
                <div class="type">
                    <label><input type="radio" name="type" value="1" checked="checked"/>学生</label>
                    <label><input type="radio" name="type" value="2"/>教师</label>
                    <label><input type="radio" name="type" value="3"/>督查</label>
                    <label><input type="radio" name="type" value="4"/>管理员</label>
                </div>
                <div>
                    <button type="submit">登录</button>
                </div>
                <div class="forget"><a href="forget/forgetIndex">忘记密码？</a></div>
            </form>
        </div>
        <div class="foot">
            <div class="copyright">Copyright 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院
                版权所有
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $('.login-form form').bootstrapValidator({
            // 通用提示语
            message: 'This value is not valid',
            // 提示字体图标
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            live: 'disabled',
            fields: {
                stuNumber: {
                    validators: {
                        notEmpty: {
                            message: '登录账号不能为空'
                        },
                        digits: {
                            message: '账号只能填写数字'
                        },
                        regexp: {
                            regexp: /^\d{4,11}$/,
                            message: '账号格式错误'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '登录密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码必须在6~18位之间'
                        }
                    }
                }
            }
        });
    });



    //显示密码
    $("#eye").click(function () {
        var flag = $(this).hasClass("glyphicon-eye-open");
        if (flag) {
            $("#eye").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
            $("form input[name='password']").attr("type", "Text");
        } else {
            $("#eye").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
            $("form input[name='password']").attr("type", "password");
        }
    });
</script>