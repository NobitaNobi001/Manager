<%--
 审核教师管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/manager.css"/>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

</head>
<body>
<div class="modal fade" id="AuditGradeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改审核年级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="audit_grade" class="col-sm-2 control-label">审核年级</label>
                        <div class="col-sm-10">
                            <select name="audit_grade" class="form-control" id="audit_grade">

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="stu_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="audit_grade_btn">确认</button>
            </div>
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
                    <a href="admins/profile">${admins.college.name }&nbsp;&nbsp;${admins.adminName}(${admins.adminNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admins/index">首页</a></li>
                    <li><a href="admins/profile">个人信息</a></li>
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
                    <li><a href="admins/auditTeacherManager">审核管理</a></li>
                    <li><a href="admins/ruleManager">审核规则</a></li>
                    <li><a href="admins/stuList">学生列表</a></li>
                    <li><a href="admins/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admins/profile">个人信息</a></li>
                    <li><a href="admins/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="student">
                    <h4>审核管理</h4>
                    <div class="action"></div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="manage_table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>职位</th>
                            <th>审核年级</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 800px">
                    <%--分页条信息--%>
                    <div id="page_nav_area" style="float:left;"></div>
                    <%--分页文字信息--%>
                    <div id="page_info_area" style="float:left; margin-left: 10px;"></div>
                </div>
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
<script type="text/javascript" src="static/js/common/tableInfo.js"></script>
<script type="text/javascript">

    $(function () {
        to_page(1);
    });

    function to_page(pn) {

        $.ajax({
            url: "teacher/teacherCondition",
            data: {
                "pn": pn,
                "collegeId":${admins.collegeId}
            },
            type: "GET",
            success: function (result) {

                $("#manage_table tbody").empty();
                $("#page_nav_area").empty();
                $("#page_info_area").empty();

                if (result.code == 100) {

                    build_audit_table(result);
                    build_page_nav(result);
                    build_page_info(result);

                } else {
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#manage_table tbody");
                }
            }
        })

    }

    //构建审核教师表格
    function build_audit_table(result) {

        var teachersInfo = result.extend.pageInfo;

        $.each(teachersInfo.list, function (index, item) {


            //序号
            var count = $("<td></td>").append(index + 1 + (teachersInfo.pageNum - 1) * 5);
            //工号
            var number = $("<td></td>").append(item.teaNumber);
            //姓名
            var name = $("<td></td>").append(item.teaName);
            //职位
            var position = $("<td></td>").append(item.teaPositon == "" ? "无" : item.teaPositon);
            //审核年级
            var grade = $("<td></td>").append(item.auditGrade == null ? "无" : item.auditGrade);
            //操作
            var editBtn = $("<td></td>").append($("<a>编辑</a>").addClass("btn btn-primary btn-2x edit-btn").attr("edit-id", item.id));

            $("<tr></tr>")
                .append(count)
                .append(number)
                .append(name)
                .append(position)
                .append(grade)
                .append(editBtn)
                .appendTo("#manage_table tbody");

        });
    }

    //给编辑按钮添加单击事件
    $(document).on("click", ".edit-btn", function () {

        $("#audit_grade_btn").attr("edit-id", $(this).attr("edit-id"));

        getGrade();

        $("#AuditGradeModal").modal({
            backdrop: "static"
        });
    });

    //获取本学院中所有不重复的年级
    function getGrade() {
        $("#audit_grade").empty();
        $.ajax({
            url: "admins/grades",
            data: {
                "collegeId":${admins.collegeId }
            },
            type: "GET",
            success: function (result) {
                if (result.code == 100) {
                    $.each(result.extend.grades, function (index, element) {
                        $("#audit_grade").append($("<option></option>").val(element).text(element));
                    });
                } else {
                    $("#audit_grade").append($("<option></option>").val("").text("请选择审核年级"));
                }

            },
            error: function () {
                alert("服务器繁忙!");
            }
        });
    }

    //模态框的确定按钮
    $("#audit_grade_btn").click(function () {

        $.ajax({
            url: "admins/auditGrade/" + $(this).attr("edit-id"),
            type: "PUT",
            data: {
                "auditGrade": $("#audit_grade").val()
            },
            success: function (result) {

                if (result.code == 100) {
                    //关闭模态框
                    $("#AuditGradeModal").modal("hide");
                    //回到本页面
                    to_page(currentPage);
                }
            },
            error: function () {
                alert("服务器繁忙!");
            }
        })
    });


</script>