<%--
  修改密码
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
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
</head>
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
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
                    <a href="${APP_PATH}/logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
                    <li><a href="${APP_PATH}/student/updateInfo/${student.id}">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/student/viewCredit">学分列表</a></li>
                    <li><a href="${APP_PATH}/student/applyCredit/${student.id}">学分申报</a></li>
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="${APP_PATH}/student/updateInfo/${student.id}">修改信息</a></li>
                    <li><a href="${APP_PATH}/student/updatepwd/${student.id}">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form class="form">
                        <div class="row item">
                            <div class="col col-2 name">原密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="password" id="password" onchange="checkoldpwd()">
                                <div class="notice" id="passwordmsg">请输入当前用户密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">新密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="pass" id="pass" onchange="checknewpwd()">
                                <div class="notice" id="passmsg">请填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">确认密码</div>
                            <div class="col col-7 value">
                                <input type="password" name="repass" id="repass" onchange="checkrepwd()">
                                <div class="notice" id="repassmsg">请再次填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value">
                                <button type="button" class="btn btn-primary btn-6x" onclick="check()">提交修改</button>
                            </div>
                        </div>
                    </form>
                    <!-- 修改密码 end -->
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
<script src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
<script>
    var password = document.getElementById("password");
    var pass = document.getElementById("pass");
    var repass = document.getElementById("repass");

    var pwdmsg = document.getElementById("passwordmsg");
    var passmsg = document.getElementById("passmsg");
    var repassmsg = document.getElementById("repassmsg");

    function checkoldpwd() {
        if (password.value == "") {//输入的旧密码为空
            //提示信息  请输入当前用户密码
            pwdmsg.innerText = "密码不能为空";
            pwdmsg.style.color = 'red';
            return false;
        } else {
            pwdmsg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            return true;
        }
    }

    function checknewpwd() {
        if (pass.value.length > 16 || pass.value.length < 8) {
            passmsg.innerText = "新密码必须大于8位小于16位";
            passmsg.style.color = 'red';
            return false;
        } else {
            passmsg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            return true;
        }
    }

    function checkrepwd() {
        if (pass.value != repass.value) {
            repassmsg.innerText = "确认密码和新密码不一致";
            repassmsg.style.color = 'red';
            return false;
        } else {
            repassmsg.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            return true;
        }
    }

    function check() {
        if (checkoldpwd() && checknewpwd() && checkrepwd()) {
            $.ajax({
                url: "${pageContext.request.contextPath}/student/updateStupwd",
                data: {"stuNumber":${student.stuNumber}, "password": password.value, "pass": pass.value},
                type: "post",
                dataType: "text",
                success: function (data) {
                    if (data == "修改密码成功，将返回登录页面") {
                        alert(data);
                        window.location.href = "/login.jsp";
                    } else {
                        alert(data);
                    }
                },
                error: function () {
                    alert("服务器繁忙");
                }
            });
        } else {
            alert("请填写正确的信息");
        }
    }
</script>