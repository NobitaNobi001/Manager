<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css"/>
</head>
<body>
<div id="login">
    <div class="login">
        <div class="top">
            <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="login-form">
            <form action="${APP_PATH}/checkuser" method="post" onsubmit="return check()">
                <h4>登录</h4>
                <br>
                <div><input type="text" name="Number" id="Number" placeholder="用户名" onchange="checkuser()"/>
                    <div id="checktext" class="notice" style="margin-bottom: 10px;">${msg}&nbsp;&nbsp;&nbsp;&nbsp;</div>
                </div>
                <div><input type="password" name="password" id="password" placeholder="密码" onchange="checkpwd()"/></div>
                <div class="type">
                    <label><input type="radio" name="type" id="type1" value="Student" checked="checked"/>学生</label>
                    <label><input type="radio" name="type" id="type2" value="Teacher"/>教师</label>
                    <label><input type="radio" name="type" id="type3" value="Watcher"/>督查</label>
                    <label><input type="radio" name="type" id="type4" value="Admin"/>管理员</label>
                </div>
                <br>
                <div>
                    <button type="submit">登录</button>
                </div>
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
</script>