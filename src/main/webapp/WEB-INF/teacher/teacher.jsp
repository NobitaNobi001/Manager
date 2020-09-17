<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <%--引入教师页面的专属样式--%>
    <link rel="stylesheet" type="text/css" href="static/css/teacher.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="teacher/teaProfile">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="teacher/index">首页</a></li>
                    <li><a href="teacher/teaProfile">个人信息</a></li>
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
                    <li><a href="teacher/stuList">学生列表</a></li>
                    <li><a href="teacher/declareManager">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="teacher/teaProfile">个人信息</a></li>
                    <li><a href="teacher/teaPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="userinfo">
                    <div class="avatar">
                        <div class="head"></div>
                    </div>
                    <div class="info">
                        <div class="username">${teacher.teaName }</div>
                    </div>
                    <div class="department"><span>${teacher.college.name }</span></div>
                    <div class="major"><span>${teacher.teaPositon==""?"无":teacher.teaPositon}</span></div>
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
<%--在整个页面加载完之后--%>
<script type="text/javascript">

    var teacherName = '${teacher.teaName }';

    $(function () {
        //将姓名的最后一个字进行截取显示到div元素上
        $(".avatar .head").append(teacherName.substring(teacherName.length - 1, teacherName.length));

    });

</script>

