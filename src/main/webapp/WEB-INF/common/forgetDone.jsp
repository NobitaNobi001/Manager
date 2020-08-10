<%--
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/8/3
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <base href="<%=basePath%>">
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/forget.css"/>
</head>
<body>
<div id="forget">
    <div class="forget">
        <div class="top">
            <div class="logo"><img src="static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="schedule">
            <ul>
                <li>
                    <div class="emblem">1</div>
                    <div class="text">第一步：请输入要重置密码的账户</div>
                </li>
                <li>
                    <div class="emblem">2</div>
                    <div class="text">第二步：通过已绑定的邮箱进行安全验证</div>
                </li>
                <li>
                    <div class="emblem">3</div>
                    <div class="text">第三步：设置新密码</div>
                </li>
                <li class="active">
                    <div class="emblem">4</div>
                    <div class="text">第四步：重置成功</div>
                </li>
            </ul>
        </div>
        <div class="done">
            <div class="show-done">
                <div class="done-emblem"><svg t="1596380822986" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2246" width="120" height="120"><path d="M464.248 677.488c9.967 9.161 25.418 8.714 34.838-1.009l299.819-309.441c9.598-9.906 9.349-25.718-0.558-35.317-9.906-9.598-25.718-9.348-35.316 0.558L463.21 641.72l34.84-1.008L316.608 473.94c-10.156-9.334-25.955-8.668-35.29 1.487-9.334 10.156-8.668 25.955 1.487 35.29l181.442 166.77zM1024 512C1024 229.23 794.77 0 512 0S0 229.23 0 512s229.23 512 512 512c117.41 0 228.826-39.669 318.768-111.313 10.79-8.595 12.569-24.308 3.975-35.097-8.594-10.789-24.308-12.568-35.097-3.974C718.47 938.277 618.002 974.049 512 974.049 256.818 974.049 49.951 767.182 49.951 512S256.818 49.951 512 49.951 974.049 256.818 974.049 512c0 87.493-24.334 171.337-69.578 243.96-7.294 11.708-3.716 27.112 7.992 34.405 11.707 7.294 27.11 3.716 34.405-7.991C997.014 701.88 1024 608.898 1024 512z" fill="#009900" p-id="2247"></path></svg></div>
                <div class="done-text">密码已经重置成功</div>
            </div>
            <div class="done-btn">
                <a class="btn btn-5x btn-default" href="forget/forgetPassword">上一步</a>
                <a class="btn btn-5x btn-success" href="logout">重置密码成功，现在去登录</a>
            </div>
        </div>
        <div class="foot">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</div>
</body>
</html>
