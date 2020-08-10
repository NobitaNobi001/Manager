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

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
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
                <li class="active">
                    <div class="emblem">3</div>
                    <div class="text">第三步：设置新密码</div>
                </li>
                <li>
                    <div class="emblem">4</div>
                    <div class="text">第四步：重置成功</div>
                </li>
            </ul>
        </div>
        <div class="forget-form">
            <div class="item">
                <div class="title">新密码</div>
                <div class="input">
                    <input type="password" name="password" id="password" value="" placeholder="输入新密码"
                           onchange="validate_password()"/>
                    <div class="notice">&nbsp;</div>
                </div>
            </div>
            <div class="item">
                <div class="title">再次输入</div>
                <div class="input">
                    <input type="password" name="repass" id="repass" value="" placeholder="再次输入新密码"
                           onchange="validate_repass()"/>
                    <div class="notice">&nbsp;</div>
                </div>
            </div>
            <div class="item">
                <div class="title"></div>
                <div class="input">
                    <button class="btn btn-5x btn-default" href="forget/forgetCheck">上一步</button>
                    <button class="btn btn-5x btn-success" onclick="toDonePage()">下一步</button>
                </div>
            </div>
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
<script type="text/javascript">

    //新密码的输入框
    var password = $("#password");
    //新密码胡错误提示
    var password_notice = password.next();
    //再次输入密码胡输入框
    var repass = $("#repass");
    //再次输入密码胡错误提示
    var repass_notice = repass.next();

    function validate_password() {

        //判断密码框的而输入是否为空
        if (password.val().trim() == "" || password.val().trim().length > 16 || password.val().trim().length < 8) {
            password_notice.html("<p></p>").text("密码应为8-16位的数字和字母组成").css("color", "red");
            return false;
        } else {
            password_notice.html("&nbsp;");
        }

        return true;
    }

    function validate_repass() {

        if (repass.val() != password.val()) {
            repass_notice.html("<p></p>").text("两次密码输入不一致").css("color", "red");
            return false;
        } else {
            repass_notice.html("&nbsp;");
        }
        return true;
    }

    //校验密码输入是否符合格式要求 并实现页面跳转
    function toDonePage() {

        //1.校验新输入的密码
        if (!validate_password()) {
            return false;
        }

        //2.校验重复输入的密码
        if (!validate_repass()) {
            return false;
        }



        $.ajax({
            url: "forget/password",
            type: "POST",
            data: {
                "password": repass.val()
            },
            success: function (result) {

                if(result.code==100){
                    window.location.href = "forget/forgetDone";
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        });
    }


</script>
