<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%
        //获取webapp的项目路径
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
            <form action="${APP_PATH}/checkuser" method="post">
                <h4>登录</h4>
                <br>
                <div><input type="text" name="stuNumber" id="username" value="" placeholder="学号"/></div>
                <div><input type="password" name="password" id="password" value="" placeholder="密码"/></div>
                <div class="type">
                    <label><input type="radio" name="type" id="type1" value="1" checked="checked"/>学生</label>
                    <label><input type="radio" name="type" id="type2" value="2"/>教师</label>
                    <label><input type="radio" name="type" id="type3" value="3"/>督查</label>
                    <label><input type="radio" name="type" id="type4" value="4"/>管理员</label>
                </div>
                <br>
                <div>
                    <button type="submit">登录</button>
                </div>
            </form>
        </div>
        <div class="foot">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院
                版权所有
            </div>
        </div>
    </div>
</div>
</body>
</html>