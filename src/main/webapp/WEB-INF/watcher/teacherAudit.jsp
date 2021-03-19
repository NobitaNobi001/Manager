<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%--修改弹出框的默认宽度--%>
    <style type="text/css">
        .popover {
            width: auto;
            height: auto;
            max-height: 800px;
            max-width: 800px;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }

    </style>

</head>
<body>
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
                            <select class="form-control" name="college" id="collegeName">
                                <c:choose>
                                    <c:when test="${watcher.collegeId eq 19}">
                                        <option value="-1">不限</option>
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
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年级</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="grade" id="grade">
                                <option value="-1">不限</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="major" id="major">
                                <option value="-1">不限</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="stuClass" id="className">
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
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px;"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="watcher/watProfile">${watcher.college.name }&nbsp;&nbsp;${watcher.watcherName }(${watcher.watcherNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">督查中心</a></li>
                    <li><a href="watcher/index">首页</a></li>
                    <li><a href="watcher/teaProfile">个人信息</a></li>
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
                    <li><a href="watcher/watAudit">教师审核</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="watcher/watProfile">个人信息</a></li>
                    <li><a href="watcher/watPassword">修改密码</a></li>
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
                            <button class="btn btn-danger" id="export_declare_data">导出数据</button>
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
                <div style="height:74px; line-height:74px;margin: 0 auto; width: 800px">
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
<script type="text/javascript" src="static/js/common/tableInfo.js"></script>
<script type="text/javascript" src="static/js/common/prompt.js"></script>
<script type="text/javascript">
    $(function () {
        //去到查询数据的第一页
        to_page(1);
    });

    function to_page(pn) {

        $.ajax({
            url: "record/auditInfo",
            data: {
                "pn": pn,
                "collegeId": $('#college').val()
            },
            type: "GET",
            success: function (result) {
                if (result.code == 100) {   //返回成功
                    //1.构建申报管理表格
                    build_declare_table(result);
                    //2.解析分页条信息
                    build_page_nav(result);
                    //3.解析分页信息
                    build_page_info(result);
                } else if (result.code == 200) {

                    //清空table表格样式
                    $("#stuDeclare tbody").empty();
                    //清空分页条数据
                    $("#page_nav_area").empty();
                    //清空分页信息
                    $("#page_info_area").empty();

                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#stuDeclare tbody");
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        });
    }

    function build_declare_table(result) {
        //清空table表格样式
        $("#stuDeclare tbody").empty();
        //拿到后台返回的数据
        var stuRecordInfo = result.extend.pageInfo;
        //遍历数据
        $.each(stuRecordInfo.list, function (index, item) {

            //序号
            var stuCount = $("<td></td>").append(index + 1 + (stuRecordInfo.pageNum - 1) * 5);
            //学号
            var stuNumber = $("<td></td>").append(item.stuNumber);
            //姓名
            var stuName = $("<td></td>").append(item.stuName);
            //申报类别
            var applySort = $("<td></td>").append(item.sort);
            //申报名称
            var applyName = $("<td></td>").append(item.applyName);
            //申报学分
            var applyCredit = $("<td></td>").append(item.applyCredit);
            //申报材料
            var applyBtn = $("<td></td>").append($("<a></a>").addClass("btn btn-default apply-btn").
                            attr("apply-id", item.id).attr("target","_blank").append("查看").attr("href", "applyImg/" + item.picture));
            //审核学分
            var auditCredit = $("<td></td>").append(item.auditCredit);
            //审核教师
            var auditTea = $("<td></td>").append(item.auditTea == null ? "无" : item.auditTea);

            //审核状态
            var auditState = $("<td></td>").append($("<a></a>").addClass("btn btn-success btn-2x").append(item.auditState));

            $("<tr></tr>").append(stuCount)
                .append(stuNumber)
                .append(stuName)
                .append(applySort)
                .append(applyName)
                .append(applyCredit)
                .append(applyBtn)
                .append(auditCredit)
                .append(auditTea)
                .append(auditState)
                .appendTo("#stuDeclare tbody");

        });
    }

    //查看图片时弹出图片进行查看 双击打开+单击关闭
    $(document).on("click", ".apply-btn", function () {
        $(this).popover({
            trigger: 'click',
            html: true,
            content: function () {
                var url = $(this).attr("url");
                var $div = $("<div style='width: 500px; height:300px;'></div>");
                var $img = $("<img style='width: 500px; height:300px;'/>");
                $img.attr("src", url);
                $img.appendTo($div);
                return $div;
            }
        });
    });

    $("#export_declare_data").click(function () {
        // 每次出现模态框都将之前的信息给清空并且将表单样式也清空
        reset_form("#exportStuRecord form");

        getGrade("#grade");

        // 弹出模态框之前显示学院班级姓名在下拉列表中
        // 设置点网页背景不会关闭模态框
        $("#exportStuRecord").modal({
            backdrop: "static"
        });
    });

    $("#collegeName").change(function () {
        //清空原有样式
        $("#grade").empty();
        $("#grade").append($("<option value='-1'>不限</option>"));

        $.ajax({
            url: "college/grade",
            data: {
                "collegeId": $("#collegeName").val()
            },
            type: "GET",
            success: function (data) {
                $.each(data, function (index, element) {
                    $("#grade").append($("<option></option>").val(element).text(element));
                });
            },
            dataType: "json",
            error: function () {
                alert("服务器繁忙!");
            }
        });
    });

    //将此学院的所有专业回显到页面上
    function getGrade(ele) {
        //清空原有样式
        $(ele).empty();
        $(ele).append($("<option value='-1'>不限</option>"));
        $.ajax({
            url: "college/grade",
            data: {
                "collegeId": $("#collegeName").val()
            },
            type: "GET",
            success: function (data) {
                console.log(data);
                $.each(data, function (index, element) {
                    $(ele).append($("<option></option>").val(element).text(element));
                });
            },
            dataType: "json",
            error: function () {
                alert("服务器繁忙!");
            }
        });
    }
    //监听年级下拉框的改变
    $("#grade").change(function () {
        $("#major").empty();
        $("#className").empty();
        $("#major").append($("<option value='-1'>不限</option>"));
        $("#className").append($("<option value='-1'>不限</option>"));

        $.ajax({
            url:"college/getMajor",
            type:"GET",
            data:{
                "collegeId":$("#collegeName").val(),
                "grade":$("#grade").val()
            },
            success:function (result) {

                $.each(result, function (index, element) {
                    $("#major").append($("<option></option>").val(element).text(element));
                })
            },
            dataType: "json",
            error:function () {
                alert("服务器繁忙!");
            }
        })

    });

    //监听专业下拉框的改变
    $("#major").change(function () {
        //清空原有样式
        $("#className").empty();
        $("#className").append($("<option value='-1'>不限</option>"));
        $.ajax({
            url: "college/getClass",
            data: {
                "collegeId":$("#collegeName").val(),
                "major": $("#major").val()
            },
            type: "GET",
            success: function (result) {
                $.each(result, function (index, element) {
                    $("#className").append($("<option></option>").val(element).text(element));
                })
            },
            dataType: "json",
            error: function () {
                alert("服务器繁忙!");
            }
        });
    });


</script>