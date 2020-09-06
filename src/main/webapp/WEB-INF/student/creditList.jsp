<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layer/layer.js"></script>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="student/stuIndex">首页</a></li>
                    <li><a href="student/updateInfo/${student.id}">个人信息</a></li>
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
                    <li><a href="student/viewCredit">学分列表</a></li>
                    <li><a href="student/applyCredit/${student.id}">学分申报</a></li>
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="student/updateInfo/${student.id}">修改信息</a></li>
                    <li><a href="student/updatepwd/${student.id}">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="credit">
                    <h4>我的学分</h4>
                    <div class="action" style="text-align: right;margin: 10px 0;padding: 10px 0;">
                        <a href="javascript:;" class="btn btn-danger">总学分:${sumCredit}</a>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th style="text-align: center;">类别</th>
                            <th>名称</th>
                            <th>申请学分</th>
                            <th>审核学分</th>
                            <th>申报状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty requestScope.info.list }">
                            <tr>
                                <td colspan="6" align="center">暂无数据记录</td>
                            </tr>
                        </c:if>

                        <c:if test="${!empty requestScope.info.list }">
                            <c:forEach var="record" items="${info.list}" varStatus="s">
                                <tr>
                                    <td>${s.count+(info.pageNum-1)*5}</td>
                                    <td style="text-align: center;">${record.sort}</td>
                                    <td>${record.applyName}</td>
                                    <td>${record.applyCredit}</td>
                                    <td>${record.auditCredit}</td>
                                    <c:choose>
                                        <c:when test="${record.auditState=='已审核' && record.auditCredit>0}">
                                            <td>
                                                <button class="btn btn-2x" name="state">已通过</button>
                                            </td>
                                        </c:when>
                                        <c:when test="${record.auditState=='未审核'}">
                                            <td>
                                                <button class="btn btn-2x" name="state">未审核</button>
                                            </td>
                                        </c:when>
                                        <c:when test="${record.auditState=='已审核' && record.auditCredit==0}">
                                            <td>
                                                <button class="btn btn-2x" name="state">未通过</button>
                                            </td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <center>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="student/viewCredit?page=1">首页</a></li>
                                <c:if test="${info.pageNum==1}">
                                    <li class="disabled">
                                        <a href="javascript:void(0)" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${info.pageNum!=1}">
                                    <li>
                                        <a href="student/viewCredit?page=${info.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${info.pages>5}">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:if test="${info.pageNum==i}">
                                            <li class="active"><a
                                                    href="student/viewCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${info.pageNum!=i}">
                                            <li><a href="student/viewCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${info.pages<=5}">
                                    <c:forEach begin="1" end="${info.pages}" var="i">
                                        <c:if test="${info.pageNum==i}">
                                            <li class="active"><a
                                                    href="student/viewCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${info.pageNum!=i}">
                                            <li><a href="student/viewCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>


                                <c:if test="${info.pageNum==info.pages}">
                                    <li class="disabled">
                                        <a href="javascript:void(0)" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${info.pageNum!=info.pages}">
                                    <li>
                                        <a href="student/viewCredit?page=${info.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <li><a href="student/viewCredit?page=${info.pages}">末页</a></li>
                                <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页，(${info.total}条记录)
								</span>
                            </ul>
                        </nav>
                    </center>
                </div>
                <!-- 学分列表 end -->
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
<script>
    var arr = $("button [name='state']");

    $.each(arr, function () {
        if ($(this).text() == "已通过") {
            $(this).addClass("btn-success");
        } else if ($(this).text() == "未审核") {
            $(this).addClass("btn-primary");
        } else {
            $(this).addClass("btn-warning");
        }
    })
</script>
