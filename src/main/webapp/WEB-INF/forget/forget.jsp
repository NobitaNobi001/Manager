<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/forget.css"/>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<div id="forget">
    <div class="forget">
        <div class="top">
            <div class="logo"><img src="static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新实践学分管理系统</div>
            <a href="logout" class="btn btn-danger" style="position: absolute;right: 10px; top: 35px;">退出</a>
        </div>
        <div class="schedule">
            <ul>
                <li class="active">
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
                <li>
                    <div class="emblem">4</div>
                    <div class="text">第四步：重置成功</div>
                </li>
            </ul>
        </div>
        <div class="forget-form">
            <div class="item">
                <div class="title">账号</div>
                <div class="input">
                    <input type="text" name="username" id="username" placeholder="请输入账号"/>
                    <%--<div class="notice">&nbsp;请输入账号</div>--%>
                </div>
            </div>
            <div class="item">
                <div class="title">身份</div>
                <div style="line-height: 40px;">
                <label><input type="radio" name="type" id="type1" value="1" checked="checked"/>学生</label>
                <label><input type="radio" name="type" id="type2" value="2"/>教师</label>
                <label><input type="radio" name="type" id="type3" value="3"/>督查</label>
                <label><input type="radio" name="type" id="type4" value="4"/>管理员</label>
                </div>
            </div>
            <div class="item">
                <div class="title">验证码</div>
                <div class="input">
                    <input type="text" name="captcha" id="captcha" placeholder="验证码" maxlength="4"/>
                    <img id="checkCode" onclick="load_code()"
                         alt="验证码" title="请将图片中的验证码填写到左边的输入框内，如果看不清楚，请点击图片更换"/>
                </div>
            </div>
            <div class="item">
                <div class="title"></div>
                <div class="input">
                    <button class="btn btn-5x btn-success" id="nextStep"> 下一步</button>
                    <%--<div class="notice">&nbsp;<a href="login.jsp">已有账号？现在去登录</a></div>--%>
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

    $(function () {
        load_code();
    });

    //点击图片更换验证码
    function load_code() {
        $("#checkCode").attr("src", "forget/checkCode?abc=" + Math.random());
    }

    //单击下一步按钮时
    $("#nextStep").click(function () {

        var username = $("#username");
        var type = $("input[name='type']:checked");
        var checkCode = $("#captcha");

        //发送ajax请求
        $.ajax({
            url: "forget/checkUser",
            type: "POST",
            beforeSend: function () {

                //1.验证账号是否为空输入
                if (username.val().trim() == "") {
                    alert("账号不能为空!");
                    return false;
                }

                //2.验证账号格式是否正确
                if(username.val().trim().match(/^[\u4e00-\u9fa5]+$/)){
                    alert("账户格式不正确!");
                    username.val("");
                    return false;
                }

                //3.验证码是否为空输入
                if (checkCode.val().trim() == "") {
                    alert("验证码不能为空!");
                    return false;
                }
            },
            data: {
                "number":username.val(),
                "type": type.val(),
                "checkCode":checkCode.val()
            },
            success: function (result) {

                if (result.code == 100) {   //成功
                    window.location.href = "forget/forgetCheck";
                } else {
                    alert(result.extend.msg);
                    //验证码输入框清空
                    checkCode.val("");
                }

            }, error: function () {
                alert("服务器繁忙!");

                load_code();
            }, complete: function () {
                //不管请求是成功还是失败都进行验证码的重新加载
                load_code();
            }
        })

    });


</script>