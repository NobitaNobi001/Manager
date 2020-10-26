<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/manager.css"/>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px;"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="admin/admProfile" style="font-size: 14px; color: #337ab7;">${admin.adminName}(${admin.adminNumber})</a>
                    <a href="logout" style="font-size: 14px; color: #337ab7;">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
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
                    <li><a href="admin/toSee/studentRecord.html">申报管理</a></li>
                    <li><a href="admin/get/student.html">学生管理</a></li>
                    <li><a href="admin/teaManager">教师管理</a></li>
                    <li><a href="admin/watManager">督查管理</a></li>
                    <li><a href="admin/admManager">学院管理</a></li>
                    <li><a href="admin/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                    <li><a href="admin/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <ul class="manager">
                    <li style="background: rgba(0, 153, 255, .1);color: #09f;">
                        <div class="number"><a href="admin/toSee/studentRecord.html">${records }</a></div>
                        <div class="title">申报数量</div>
                    </li>
                    <li style="background: rgba(0, 153, 0, .1);color: #090;">
                        <div class="number"><a href="admin/get/student.html" >${students }</a></div>
                        <div class="title">学生</div>
                    </li>
                    <li style="background: rgba(255, 153, 0, .1);color: #f90;">
                        <div class="number"><a href="admin/teaManager">${teachers }</a></div>
                        <div class="title">教师</div>
                    </li>
                    <li style="background: rgba(255, 0, 0, .1);color: #f00;">
                        <div class="number"><a href="admin/watManager">${watchers }</a></div>
                        <div class="title">督查</div>
                    </li>
                    <li style="background: rgba(153, 153, 0, .1);color: #990;">
                        <div class="number"><a href="admin/admManager">${admins }</a></div>
                        <div class="title">管理员</div>
                    </li>
                </ul>
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