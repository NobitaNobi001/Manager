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
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/forget.css"/>
</head>
<body>
<div id="forget">
    <div class="forget">
        <div class="top">
            <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="forget-form">
            <form action="" method="post">
                <!-- 判断验证账号是否成功，验证账号成功请显示重置密码，没有验证账号成功请显示当前找加密码 -->
                <h4>找回密码</h4>
                <div class="item">
                    <div class="title">账号</div>
                    <div class="input">
                        <input type="text" name="username" id="username" value="" placeholder="邮箱"/>
                        <div class="notice">&nbsp;请输入账号绑定的邮箱地址</div>
                    </div>
                </div>
                <div class="item">
                    <div class="title">验证码</div>
                    <div class="input">
                        <input type="text" name="captcha" id="captcha" value="" placeholder="验证码"/>
                        <div class="notice">&nbsp;点击发送验证码</div>
                    </div>
                </div>
                <div class="item">
                    <div class="title"></div>
                    <div class="input">
                        <button type="button">下一步，重置密码</button>
                        <div class="notice">&nbsp;<a href="login.html">已有账号？现在去登录</a></div>
                    </div>
                </div>

                <!-- 请判断是否验证成功，验证成功就显示重置密码 -->
                <h4>重置密码</h4>
                <div class="item">
                    <div class="title">新密码</div>
                    <div class="input">
                        <input type="password" name="password" id="password" value="" placeholder="输入新密码"/>
                        <div class="notice">&nbsp;请输入新密码</div>
                    </div>
                </div>
                <div class="item">
                    <div class="title">再次输入</div>
                    <div class="input">
                        <input type="text" name="repass" id="repass" value="" placeholder="再次输入新密码"/>
                        <div class="notice">&nbsp;请再次输入新密码</div>
                    </div>
                </div>
                <div class="item">
                    <div class="title"></div>
                    <div class="input">
                        <button type="button">提交，完成重置密码</button>
                        <div class="notice">&nbsp;<a href="login.html">已有账号？现在去登录</a></div>
                    </div>
                </div>

            </form>
        </div>
        <div class="foot">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</div>
</body>
</html>
