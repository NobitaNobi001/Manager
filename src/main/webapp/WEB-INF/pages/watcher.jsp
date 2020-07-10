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
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/overseer.css"/>
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
                    <a href="profile.html">admin@qq.com</a>
                    <a href="login.html">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">督查中心</a></li>
                    <li><a href="overseer.html">首页</a></li>
                    <li><a href="profile.html">个人信息</a></li>
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
                    <li><a href="fraction.html">学生学分</a></li>
                    <li><a href="examine.html">教师审核</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="profile.html">个人信息</a></li>
                    <li><a href="password.html">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="userinfo">
                    <div class="avatar">
                        <div class="head">云</div>
                    </div>
                    <div class="info">
                        <div class="username">杨歆舞云</div>
                        <div class="telephone">13258565780</div>
                    </div>
                    <div class="department"><span>计算机系（学院）</span></div>
                    <div class="major"><span>计算机信息管理</span></div>
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