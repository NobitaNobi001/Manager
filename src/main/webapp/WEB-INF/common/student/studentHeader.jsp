<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.6.2/viewer.css">
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/student.css"/>

    <style type="text/css">
        .layui-input-inline {
            width: 75%;
        }

        .layui-input, .layui-textarea {
            width: 70%;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }

    </style>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.6.2/viewer.common.min.js"></script>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="../../../static/images/logo.png" height="70" style="margin-top: 40px;"/>
                    </div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="javascript:void(0);">湖北文理学院&nbsp;&nbsp;${student.stuName }(${student.stuNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:void(0);">学生中心</a></li>
                    <li><a href="student/stuIndex">首页</a></li>
                    <li><a href="student/updateInfo.html">个人信息</a></li>
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
                    <li class="headline"><span>控制中心</span></li>
                    <li><a href="student/viewCredit.html">学分列表</a></li>
                    <li><a href="student/applyCredit.html">学分申报</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="student/updateInfo.html">修改信息</a></li>
                    <li><a href="student/updatePassword.html">修改密码</a></li>
                </ul>
            </div>

