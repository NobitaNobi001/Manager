<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>

</head>
<html>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="${APP_PATH}/teacher/teaProfile"
                       style="font-size: 14px; color: #337ab7;">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="${APP_PATH}/login.jsp" style="font-size: 14px; color: #337ab7;">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="${APP_PATH}/teacher/teaIndex">首页</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<main>
    <div id="main">
        <div class="main clear">
            <div class="main-left left">
                <ul>
                    <li class="headline"><a href="javascript:;">控制中心</a></li>
                    <li><a href="${APP_PATH}/teacher/stuList">学生列表</a></li>
                    <li><a href="${APP_PATH}/teacher/declareManager">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
                    <li><a href="${APP_PATH}/teacher/teaPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form action="#" method="post" class="form">
                        <div class="row item">
                            <div class="col col-2 name">原密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="password">
                                <div class="notice">请输入当前用户密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">新密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="pass">
                                <div class="notice">请填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">重复密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="respass">
                                <div class="notice">请再次填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value">
                                <button type="button" class="btn btn-primary btn-6x">提交绑定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div id="footer">
        <div class="footer">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院
                版权所有
            </div>
        </div>
    </div>
</footer>
</body>
</html>

<script type="text/javascript">

    //拿到原密码的文本框
    var password = $("input[name='password']");
    //拿到新密码的文本框
    var pass = $("input[name='pass']");
    //拿到新密码重复输入的文本框
    var respass = $("input[name='respass']");

    //更新密码
    $("button").click(function () {

        //校验原密码输入
        if (!password.trigger("input propertychange.validate_password")) {
            return false;
        }
        //校验新密码的输入
        if (!pass.trigger("input propertychange.validate_pass")) {
            return false;
        }
        //校验新密码的重复输入
        if(!respass.trigger("input propertychange.validate_respass")){
            return false;
        }

        //向后台发送请求更新用户密码
        $.ajax({
            url: "${APP_PATH}/teacher/updatePassword/" +${teacher.id },
            type: "POST",
            data: {
                "password": respass.val()
            },
            dataType: 'json',
            success: function (result) {
                //如果新密码和原密码不一致
                if (result.code == 100) {
                    alert("密码修改成功!")
                    //刷新当前页面
                    window.location.reload();
                } else {
                    alert("密码更新失败!");
                }
            }
        });
    });

    //校验原密码
    password.bind("input propertychange.validate_password", function () {
        //判断密码框的而输入是否为空
        if ($(this).val().trim() == "") {
            $(this).next().html("<p style='color: red;'>请输入当前用户密码</p>");
        } else {  //密码输入不为空 就和数据库中查出的密码进行比对

            //如果和数据库中密码相同就返回true
            if ($(this).val() == "${teacher.password }") {
                $(this).next().html("&nbsp;");
                return true;
            } else {
                $(this).next().html("<p style='color: red;'>密码输入错误</p>");
            }
        }
        return false;
    });

    //校验新密码和重复输入的密码
    pass.bind("input propertychange.validate_pass",function () {
        //判断新密码的格式
        if ($(this).val().trim() == "" || $(this).val().trim().length > 16 || $(this).val().trim().length < 8) {
            $(this).next().html("<p style='color: red;'>新密码应为8-16位的字母和数字组合</p>");
        } else {
            $(this).next().html("&nbsp;");
            return true;
        }
        return false;
    });

    respass.bind("input propertychange.validate_respass",function () {

        if ($(this).val().trim() == pass.val().trim()) {
            $(this).next().html("&nbsp;");
            return true;
        } else if ($(this).val().trim() != pass.val().trim()) {
            $(this).next().html("<p style='color: red;'>两次密码输入不一致</p>");
        }
        return false;
    });




</script>
