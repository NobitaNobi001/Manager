<%--
  学院管理
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/8/6
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <base href="<%=basePath%>">

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
                    <a href="${APP_PATH}/admin/admProfile">admin@qq.com</a>
                    <a href="${APP_PATH}/logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="${APP_PATH}/admin/admIndex">首页</a></li>
                    <li><a href="${APP_PATH}/admin/admProfile">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/admin/decManager">申报管理</a></li>
                    <li><a href="${APP_PATH}/admin/stuManager">学生管理</a></li>
                    <li><a href="${APP_PATH}/admin/teaManager">教师管理</a></li>
                    <li><a href="${APP_PATH}/admin/watManager">督查管理</a></li>
                    <li><a href="${APP_PATH}/admin/collegeManager">学院管理</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>学院管理</h4>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="college_info">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>院系</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 600px">
                    <%--分页条信息--%>
                    <div id="page_nav_area" style="float:left;"></div>
                    <%--分页文字信息--%>
                    <div id="page_info_area" style="float:left; margin-left: 10px;"></div>
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
<script type="text/javascript" src="${APP_PATH}/static/js/common/tableInfo.js/js/tableInfo.js"></script>
<script type="text/javascript">


</script>