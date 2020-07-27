<%--
  //督察管理
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 督察添加的模态框 -->
<div class="modal fade" id="watcherAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">增加督察</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="watcherNumber_add_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="watcherNumber" class="form-control" id="watcherNumber_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="watcherName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="watcherName" class="form-control" id="watcherName_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"/>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"/>女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <%--部门提交id即可--%>
                            <select class="form-control" name="collegeName">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

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

                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>督查管理</h4>
                    <div class="action" style="float: left;">
                        <div>
                            <select name="department">
                                <option value="0">请选择院系</option>
                            </select>
                        </div>
                        <div>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字" value=""/>
                            <a href="javascript:;" class="btn btn-primary">搜索</a>
                        </div>
                        <button class="btn btn-primary" id="add_watcher_btn"
                                style="margin-left: 550px; vertical-align: middle;">新增督查
                        </button>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="watcher_info">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>工号</th>
                            <th>姓名</th>
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
<%--引入构建分页信息和页码控制的js文件--%>
<script type="text/javascript" src="${APP_PATH}/static/js/tableInfo.js"></script>
<script type="text/javascript">

    $(function () {

        to_page(1);
    });

    //去到第几页
    function to_page(pn) {

        $.ajax({
            url: "${APP_PATH}/watcher/watchers",
            data: {
                "pn": pn
            },
            type: "GET",
            success: function (result) {

                if (result.code == 100) {   //查询成功

                    //1.构建申报管理表格
                    build_watcher_table(result);
                    //2.解析分页条信息
                    build_page_nav(result);
                    //3.解析分页信息
                    build_page_info(result);

                } else if (result.code == 200) {     //查询失败
                    //清空table表格样式
                    $("#watcher_info tbody").empty();

                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#watcher_info tbody");
                }
            }
        })
    }

    //构建督察信息列表
    function build_watcher_table(result) {
        //清空原有数据和样式
        $("#watcher_info tbody").empty();
        //拿到后台返回的数据
        var watchersInfo = result.extend.pageInfo;
        //遍历添加数据到table中
        $.each(watchersInfo.list, function (index, item) {

            //序号
            var watcherCount = $("<td></td>").append(index + 1 + (watchersInfo.pageNum - 1) * 5);
            //督察工号
            var watcherNumber = $("<td></td>").append(item.watcherNumber);
            //督察姓名
            var watcherName = $("<td></td>").append(item.watcherName);
            //督察院系
            var college = $("<td></td>").append(item.college.name);
            //操作按钮
            var operateBtn = $("<td></td>").append($("<a>编辑</a>").addClass("btn btn-primary btn-2x")).append($("<a style='margin-left:5px;'>删除</a>").addClass("btn btn-danger btn-2x"));

            $("<tr></tr>").append(watcherCount)
                .append(watcherNumber)
                .append(watcherName)
                .append(college)
                .append(operateBtn)
                .appendTo("#watcher_info tbody");
        });
    }

    //新增督察
    $("#add_watcher_btn").click(function () {

        //表单重置 表单的数据及样式
        $("#watcherAddModal form")[0].reset();

        //发送ajax请求，查出部门信息显示下拉列表
        getColleges("#watcherAddModal select");

        $("#watcherAddModal").modal({
            //设置点击背景模态框不会消失
            backdrop: "static"
        })


    });

    //获取学院
    function getColleges(sel) {
        //清空下拉框样式及内容
        $(sel).empty();
        $.ajax({
            url: "${APP_PATH}/college/getColleges",
            type: "GET",
            success: function (result) {
                // 显示学院信息在下拉列表中
                $.each(result.extend.colleges, function () {

                    if (this.id != 19) {
                        var option = $("<option></option>").append(this.name).attr("value", this.id);
                        option.appendTo(sel);
                    }

                });
            },
            error: function () {
                alert("服务器繁忙")
            }
        })
    }
</script>

