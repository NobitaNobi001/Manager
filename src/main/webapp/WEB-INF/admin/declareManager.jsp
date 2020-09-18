<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新实践学分管理系统</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>

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
                    <a href="admin/admProfile">${admin.adminName }(${admin.adminNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:void(0)">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!--导出申报记录模态框-->
<div class="modal fade" id="exportStuRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">导出申报记录</h4>
            </div>
            <form class="form-horizontal" action="admin/exportStuRecord" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="college">
                                <option value="-1">不限</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="major">
                                <option value="-1">不限</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="stuClass">
                                <option value="-1">不限</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">审核状态</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="auditState">
                                <option value="-1">不限</option>
                                <option value="已审核">已审核</option>
                                <option value="未审核">未审核</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="export">导出</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
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
                <!-- 学分列表 start -->
                <div class="credit">
                    <h4>申报管理</h4>
                    <div class="action">
                        <form class="form-inline" action="admin/toQuery/studentRecord.html" method="post" style="float: left;">
                            <div class="form-group">
                                <select name="college" class="form-control">
                                    <option value="-1">请选择学院</option>
                                    <c:forEach items="${applicationScope.colleges }" var="college">
                                        <c:if test="${college.id ne 19}">
                                            <option value="${college.id }">${college.name }</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="major" class="form-control">
                                    <option value="-1">请选择专业</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="stuClass" class="form-control">
                                    <option value="-1">请选择班级</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default btn-info">查询</button>
                            </div>
                        </form>
                        <div>
                            <button class="btn btn-danger" id="exportData"><i class="glyphicon glyphicon-download-alt">导出申报数据</i>
                            </button>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>学生学号</th>
                            <th>学生姓名</td>
                            <th>申报类别</th>
                            <th>申报名称</th>
                            <th>申报日期</th>
                            <th>申报材料</th>
                            <th>申报学分</th>
                            <th>审核状态</th>
                            <th>审核学分</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="record" items="${info.list}" varStatus="index">
                            <tr>
                                <td>${index.count+(info.pageNum-1)*5 }</td>
                                <td>${record.stuNumber}</td>
                                <td>${record.stuName}</td>
                                <td>${record.sort}</td>
                                <td>${record.applyName}</td>
                                <td>${record.date}</td>
                                <td>
                                    <button type="button" class="btn btn-default apply-btn" data-container="body" url="applyImg/${record.picture }"
                                            data-toggle="popover"
                                            data-placement="top" name="picture_btn" >查看图片
                                    </button>
                                </td>
                                <td>${record.applyCredit}</td>
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
                                <td>${record.auditCredit}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty info.list}">
                            <tr>
                                <td colspan="10" align="center">
                                    <div>暂无数据记录</div>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <c:choose>
                        <c:when test="${empty info.list}">
                            <nav aria-label="Page navigation">
                                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 600px">
                                </div>
                            </nav>
                        </c:when>
                        <c:otherwise>
                    <center>
                        <c:if test="${requestScope.direction=='toSee' && !empty info.list}">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li><a href="admin/toSee/studentRecord.html?page=1">首页</a></li>
                                    <c:if test="${info.hasPreviousPage}">
                                        <li>
                                            <a href="admin/toSee/studentRecord.html?page=${info.prePage}"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach items="${info.navigatepageNums}" var="page">
                                        <c:if test="${page==info.pageNum}">
                                            <li class="active"><a href="#">${page}</a></li>
                                        </c:if>
                                        <c:if test="${page!=info.pageNum}">
                                            <li><a href="admin/toSee/studentRecord.html?page=${page}">${page}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageInfo.hasNextPage}">
                                        <li>
                                            <a href="admin/toSee/studentRecord.html?page=${info.nextPage}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <li><a href="admin/toSee/studentRecord.html?page=${info.pages}">末页</a></li>
                                    <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页(共${info.total}条记录)
									</span>
                                </ul>
                            </nav>
                        </c:if>
                        <c:if test="${requestScope.direction=='toQuery' &&!empty info.list}">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li>
                                        <a href="admin/toQuery/studentRecord.html?page=1&college=${requestScope.college}&major=${requestScope.major}&stuClass=${requestScope.stuClass}">首页</a>
                                    </li>
                                    <c:if test="${info.hasPreviousPage}">
                                        <li>
                                            <a href="admin/toQuery/studentRecord.html?page=${info.prePage}&college=${requestScope.college}&major=${requestScope.major}&stuClass=${requestScope.stuClass}"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach items="${info.navigatepageNums}" var="page">
                                        <c:if test="${page==info.pageNum}">
                                            <li class="active"><a href="#">${page}</a></li>
                                        </c:if>
                                        <c:if test="${page!=info.pageNum}">
                                            <li>
                                                <a href="admin/toQuery/studentRecord.html?page=${page}&college=${requestScope.college}&major=${requestScope.major}&stuClass=${requestScope.stuClass}">${page}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageInfo.hasNextPage}">
                                        <li>
                                            <a href="admin/toQuery/studentRecord.html?page=${info.nextPage}&college=${requestScope.college}&major=${requestScope.major}&stuClass=${requestScope.stuClass}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <li>
                                        <a href="admin/toQuery/studentRecord.html?page=${info.pages}&college=${requestScope.college}&major=${requestScope.major}&stuClass=${requestScope.stuClass}">末页</a>
                                    </li>
                                    <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页(共${info.total}条记录)
									</span>
                                </ul>
                            </nav>
                        </c:if>

                    </center>
                        </c:otherwise>
                    </c:choose>
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
<script type="text/javascript" src="static/js/admin/declareManager.js"></script>