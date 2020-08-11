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
    <title>湖北文理学院创新学分系统</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>
</head>
<body>
<div id="login">
    <div class="login">
        <div class="top">
            <div class="logo"><img src="static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="login-form">
            <form action="checkuser" method="post" onsubmit="return check()" role="form">
                <h4 style="margin-left: 10px">用户登录</h4>
                <p><font color="red">${msg}</font></p>
                <div class="form-group">
                    <div class="input-group">
                       <span class="input-group-addon">
                     <span class="glyphicon glyphicon-user"></span>
                    </span>
                        <input type="text" name="Number" class="form-control" id="Number"
                               placeholder="登录账号" autofocus onchange="checkuser()" value="2018139047">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                          <span class="input-group-addon">
                    <span class="glyphicon glyphicon-eye-open" id="eye"></span>
                    </span>
                        <input type="password" name="password" class="form-control" id="password"
                               placeholder="登录密码" onchange="checkpwd()" value="12345678"/>
                    </div>
                </div>
                <div class="type">
                    <label><input type="radio" name="type" id="type1" value="Student" checked="checked"/>学生</label>
                    <label><input type="radio" name="type" id="type2" value="Teacher"/>教师</label>
                    <label><input type="radio" name="type" id="type3" value="Watcher"/>督查</label>
                    <label><input type="radio" name="type" id="type4" value="Admin"/>管理员</label>
                </div>
                <div>
                    <button type="submit">登录</button>
                </div>
                <div class="forget"><a href="forgetPassword">忘记密码？</a></div>
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
    function checkuser() {
        var check = false;
        var Number = document.getElementById("Number").value;
        Number = Number.trim();
        if (Number == "") {//学号为空
            document.getElementById("checktext").innerText = "请您输入学号";
            check = false;
        } else {
            var reg = /^\d+$|^\d+[.]?\d+$/;
            if (reg.test(Number)) {//学号不为空，正则表达式也正常
                check = true;
            } else {//学号不为空但输入格式错误,只能输入数字
                document.getElementById("checktext").innerText = "用户名格式有误";
                check = false;
            }
        }
        return check;
    }

    function checkpwd() {
        var check = false;
        var password = document.getElementById("password").value;
        password = password.trim();
        if (password == "" || password.length == 0) {//密码为空
            document.getElementById("checktext").innerText = "请您输入密码";
            check = false;
        } else {
            check = true;
        }
        return check;
    }

    function check() {
        var check = checkuser() && checkpwd();
        return check;
    }

    $("#eye").click(function () {
        var flag = $(this).hasClass("glyphicon-eye-open");
        if (flag == true) {
            $("#eye").removeClass("glyphicon-eye-open");
            $("#eye").addClass("glyphicon-eye-close");
            $("#StuUpdateModal input[name='password']").attr("type", "Text");
        } else {
            $("#eye").removeClass("glyphicon-eye-close");
            $("#eye").addClass("glyphicon-eye-open");
            $("#StuUpdateModal input[name='password']").attr("type", "password");
        }
    });
</script>