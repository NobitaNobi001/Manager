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

    <%--引入js--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <%--引入bootstrap--%>
    <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <%--引入bootrap的样式文件--%>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div id="login">
    <div class="login">
        <div class="top">
            <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="login-form">
            <form action="" method="post">
                <h4>登录</h4>
                <div><input type="text" name="username" id="username" value="" placeholder="姓名 | 手机号 | 邮箱"/></div>
                <div><input type="password" name="password" id="password" value="" placeholder="密码"/></div>
                <div><input type="text" name="captcha" id="captcha" value="" placeholder="身份"/></div>
                <div><button type="button">登录</button></div>
            </form>
        </div>
        <div class="foot">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</div>
</body>
</html>
<%--在整篇html文档加载完成之后--%>
<script type="text/javascript">
    $(function () {

    });

    // 校验表单数据
    function validate_form() {

    }

    $("#username").change(function () {

    })
</script>
