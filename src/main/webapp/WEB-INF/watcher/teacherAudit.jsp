<%--
  教师审核
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li><a href="${APP_PATH}/watcher/stuCredit">学生学分</a></li>
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
<script type="text/javascript" src="${APP_PATH}/static/js/tableInfo.js"></script>
<script type="text/javascript">

    $(function () {

        // 若是校级督察就将十八个学院全部添加到下拉框中
        if ("${watcher.collegeId }" == 19) {
            getColleges("#college");

        } else {
            $("select[name='college']").append(("<option value='${watcher.collegeId }'>${watcher.college.name }</option>"));
        }

        //去到查询数据的第一页
        to_page(1);
    });

    function to_page(pn) {

        $.ajax({
            url: "${APP_PATH}/record/auditInfo",
            data: {
                "pn": pn,
                "collegeId": "${watcher.collegeId }" == 19 ? $('#college option:selected').val() : "${watcher.collegeId }"
            },
            type: "GET",
            success: function (result) {

                //清空table表格样式
                $("#stuDeclare tbody").empty();
                //清空分页条数据
                $("#page_nav_area").empty();
                //清空分页信息
                $("#page_info_area").empty();

                if (result.code == 100) {   //返回成功
                    //1.构建申报管理表格
                    build_declare_table(result);
                    //2.解析分页条信息
                    build_page_nav(result);
                    //3.解析分页信息
                    build_page_info(result);
                } else if (result.code == 200) {
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#stuDeclare tbody");
                }

            }
        });
    }

    function build_declare_table(result) {
        //清空table表格样式
        // $("#stuDeclare tbody").empty();
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
            var applyBtn = $("<td></td>").append($("<a></a>").addClass("btn btn-default").attr("apply-id", item.id).attr("tabindex", 0).attr("role", "button").attr("data-toggle","popover").attr("placement","right").append("查看").attr("url","applyImg/"+item.picture));
            // var applyBtn = $("<td></td>").append($("<button>查看</button>").addClass("btn btn-default"));
            //审核学分
            var auditCredit = $("<td></td>").append(item.auditCredit);
            //审核教师
            var auditTea = $("<td></td>").append(item.auditTea);

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

    // $("apply-id").popover({
    //     trigger:'focus',
    //     html:true,
    //     content:function () {
    //         console.log($(this));
    //         var url = $(this).attr("url");
    //         var $div = $("<div style='width: 700px; height:500px;'></div>");
    //         var $img = $("<img style='width: 700px; height:500px;'/>");
    //         $img.attr("src",url);
    //         $img.appendTo($div);
    //         return $div;
    //     }
    // });

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
