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
                <li class="active">
                    <div class="emblem">2</div>
                    <div class="text">第二步：通过已绑定的邮箱进行安全验证</div>
                </li>
                <li>
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
                <div class="title">邮箱</div>
                <div class="input">
                    <input type="text" name="email" id="email" value="" placeholder="请输入邮箱"/>
                    <div class="notice">&nbsp;</div>
                </div>
            </div>
            <div class="item">
                <div class="title">验证码</div>
                <div class="input">
                    <input type="text" name="captcha" id="captcha" value="" placeholder="邮件验证码" maxlength="4"/>
                    <button id="sendEmail-btn" onclick="checkAndSend()">发送验证码</button>
                    <div class="notice">&nbsp;</div>
                </div>
            </div>
            <div class="item">
                <div class="title"></div>
                <div class="input">
                    <button class="btn btn-5x btn-default" href="forget/forgetIndex">上一步</button>
                    <button class="btn btn-5x btn-success" onclick="toUpdatePassword()">下一步</button>
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

    //邮箱的文本框对象
    var email = $("#email");
    //验证码的文本框对象
    var captcha = $("#captcha");
    //用来进行计时
    var timeCalc = 120;
    //发送验证码按钮
    var send_btn = $("#sendEmail-btn");

    //验证邮箱是否正确并进行邮件的发送
    function checkAndSend() {

        //1.校验邮箱格式
        if (!validate_email()) {
            return false;
        }

        sendEmail();

        //发送ajax请求
        $.ajax({
            url: "forget/sendEmail",
            data: {
                "email": email.val()
            },
            type: "POST",
            success: function (result) {

            }, error: function () {
                alert("服务器繁忙!");
            }
        });
    }

    //验证码是否输入正确并实现跳转
    function toUpdatePassword() {

        //1.校验验证码输入的基本格式
        if (!validate_captcha()) {
            return false;
        }

        //2.发送ajax请求
        $.ajax({
            url: "forget/checkEmailCode",
            type: "POST",
            data: {
                "captcha": captcha.val()
            },
            success: function (result) {

                if (result.code == 100) {
                    window.location.href = "forget/forgetPassword";
                } else {
                    captcha.next().next().html("<p></p>").text(result.extend.msg).css("color", "red");
                }
            }, error: function () {
                alert("服务器繁忙!");
            }
        })

    }

    //验证验证码的格式
    function validate_captcha() {

        //1.定义验证码的基本格式的正则表达式
        var regCaptcha = /[0-9]{4}/;

        //2.校验验证码是否为空输入
        if (captcha.val().trim() == "") {
            captcha.next().next().html("<p></p>").text("验证码不能为空!").css("color", "red");
            return false;
        }

        //3.校验验证码的输入
        if (!regCaptcha.test(captcha.val())) {
            captcha.next().next().html("<p></p>").text("验证码格式不正确!").css("color", "red");
            return false;
        }

        return true;
    }

    //验证邮箱格式
    function validate_email() {

        //1.定义验证邮箱的基本格式的正则表达式
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        //2.校验邮箱是否为空输入
        if (email.val().trim() == "") {
            email.next().html("<p></p>").text("邮箱不能为空").css("color", "red");
            return false;
        }

        //3.校验邮箱格式
        if (!regEmail.test(email.val())) {
            email.next().html("<p></p>").text("邮箱格式不正确").css("color", "red");
            return false;
        }

        //4.校验此账号与输入邮箱是否对应正确
        $.ajax({
            url: "forget/checkEmail",
            type: "POST",
            data: "email=" + email.val(),
            success: function (result) {

                if (result.code == 100) {   //成功
                    return true;
                } else {        //失败
                    email.next().html("<p></p>").text(result.extend.msg).css("color", "red");
                    return false;
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        });
        return true;

    }

    //实现发送倒计时的动态效果
    function sendEmail() {

        if (timeCalc == 0) {

            send_btn.attr("disabled", false);
            send_btn.text("发送验证码");
            timeCalc = 120;
            return;

        } else {

            send_btn.attr("disabled", true);
            send_btn.text(timeCalc + "s");
            timeCalc--;
        }
        //每一秒调用此函数
        setTimeout(function () {
            sendEmail();
        }, 1000);
    }
</script>