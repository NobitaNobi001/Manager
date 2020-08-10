<%--
  教师审核
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>

    <base href="<%=basePath%>">

    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%--修改弹出框的默认宽度--%>
    <style type="text/css">
        .popover{
            width: auto;
            height: auto;
            max-height: 800px;
            max-width: 800px;
        }
    </style>

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
                    <a href="${APP_PATH}/watcher/watProfile">${watcher.watcherName }(${watcher.watcherNumber })</a>
                    <a href="${APP_PATH}/logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">督查中心</a></li>
                    <li><a href="${APP_PATH}/watcher/teaIndex">首页</a></li>
                    <li><a href="${APP_PATH}/watcher/teaProfile">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/watcher/watAudit">教师审核</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="${APP_PATH}/watcher/watProfile">个人信息</a></li>
                    <li><a href="${APP_PATH}/watcher/watPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>教师审核列表</h4>
                    <div class="action">
                        <div>
                            <select name="college" id="college" onchange="to_page(1)">
                                <c:choose>
                                    <c:when test="${watcher.collegeId eq 19}">
                                        <option value="-1">请选择院系</option>
                                        <c:forEach items="${applicationScope.colleges }" var="college">
                                            <c:if test="${college.id ne 19}">
                                                <option value="${college.id }">${college.name }</option>
                                            </c:if>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${watcher.collegeId }">${watcher.college.name }</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div>
                            <a href="javascript:;" class="btn btn-danger">导出数据</a>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="stuDeclare">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>申报类别</th>
                            <th>申报名称</th>
                            <th>申报学分</th>
                            <th>申报材料</th>
                            <th>审核学分</th>
                            <th>审核教师</th>
                            <th>审核状态</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                <div style="height:74px; line-height:74px;margin: 0 auto; width: 600px">
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
<%--引入构建分页信息和页码控制的js文件--%>
<script type="text/javascript" src="${APP_PATH}/static/js/common/tableInfo.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/watcher/teacherAudit.js"></script>
