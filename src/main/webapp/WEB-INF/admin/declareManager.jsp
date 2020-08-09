<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新学分系统</title>
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
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="admin/admProfile">admin@qq.com</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/admIndex">首页</a></li>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id="export">导出</button>
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
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="credit">
                    <h4>学分申报管理</h4>
                    <form class="form-inline" action="admin/toQuery/studentRecord.html" method="post">
                        <div class="form-group">
                            <select name="college" class="form-control">
                                <option value="-1">请选择学院</option>
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
                    <div class="action">
                        <div>
                            <button class="btn btn-danger" id="exportData"><i class="glyphicon glyphicon-download-alt">导出申报数据</i>
                            </button>
                        </div>
                    </div>
                    <table class="table table-hover" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <td>序号</td>
                            <td>学生学号</td>
                            <td>学生姓名</td>
                            <td>申报类别</td>
                            <td>申报名称</td>
                            <td>申报日期</td>
                            <td>申报材料</td>
                            <td>申报学分</td>
                            <td>审核状态</td>
                            <td>审核学分</td>
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
                                    <button type="button" class="btn btn-default" data-container="body"
                                            data-toggle="popover"
                                            data-placement="right" name="picture_btn" id="picture_btn">查看图片
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
                                    <div style="font-size:24px;color:red;">抱歉！没有查询到您要的数据！</div>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <center>
                        <c:if test="${requestScope.direction=='toSee'}">
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
                        <c:if test="${requestScope.direction=='toQuery'}">
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
<script type="text/javascript">
    // 给审核按钮添加样式
    var arr = $("button[name='state']");
    $.each(arr, function () {
        if ($(this).val() == "已通过") {
            $(this).addClass("btn-success");
        } else if ($(this).val() == "未审核") {
            $(this).addClass("btn-primary");
        } else {
            $(this).addClass("btn-warning");
        }
    })

    $(function () {
        getColleges();
    });

    // 学院改变后重新加载专业
    $(".form-inline select[name='college']").change(function () {
        var collegeCode = $(".form-inline select[name='college']").val();
        getMajor(collegeCode);
    });

    // 专业改变后重新加载班级
    $(".form-inline select[name='major']").change(function () {
        var collegeCode = $(".form-inline select[name='college']").val();
        var majorCode = $(".form-inline select[name='major']").val();
        getClass(collegeCode, majorCode);
    });

    // 学院改变后重新加载专业
    $(".form-horizontal select[name='college']").change(function () {
        var collegeCode = $(".form-horizontal select[name='college']").val();
        getMajor(collegeCode);
    });

    // 专业改变后重新加载班级
    $(".form-horizontal select[name='major']").change(function () {
        var collegeCode = $(".form-horizontal select[name='college']").val();
        var majorCode = $(".form-horizontal select[name='major']").val();
        getClass(collegeCode, majorCode);
    });


    //获取学院
    function getColleges() {
        $.ajax({
            url: "college/getColleges",
            type: "GET",
            success: function (result) {
                // 显示学院信息在下拉列表中
                $.each(result, function (index, element) {
                    if (element.id != 19) {
                        $("select[name='college']").append($("<option></option>").val(element.id).text(element.name));
                    }
                });
            },
            dataType: "json"
        })
    }

    // 获取专业
    function getMajor(collegeCode) {
        $("select[name='major']").empty();
        $("select[name='major']").append($("<option></option>").val("-1").text("请选择专业"));
        // ajax请求所有专业
        $.get("college/getMajor", {
            "collegeId": collegeCode
        }, function (data) {
            $.each(data, function (index, element) {
                $("select[name='major']").append($("<option></option>").val(element).text(element));
            });
        }, 'json');
    };

    //获取班级
    function getClass(collegeCode, majorCode) {
        $("select[name='stuClass']").empty();
        $("select[name='stuClass']").append($("<option></option>").val("-1").text("请选择班级"));
        // ajax请求所有班级
        $.get("college/getClass", {
            "collegeId": collegeCode,
            "major": majorCode
        }, function (data) {
            $.each(data, function (index, element) {
                $("select[name='stuClass']").append($("<option></option>").val(element).text(element));
            });
        }, 'json');
    };

    // 重置新增员工表单的方法
    function reset_form(ele) {
        // 重置表单内容
        $(ele)[0].reset();
    }

    // 给导出按钮绑定单击事件出现模态框
    $("#exportData").click(function () {
        // 每次出现模态框都将之前的信息给清空并且将表单样式也清空
        reset_form("#exportStuRecord form");
        // 弹出模态框之前显示学院班级姓名在下拉列表中

        // 设置点网页背景不会关闭模态框
        $("#exportStuRecord").modal({
            backdrop: "static"
        });
    });

    // 表单中的删除按钮绑定单击事件
    // 批量删除
</script>
