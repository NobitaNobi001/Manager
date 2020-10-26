<%--
  申报规则及设置上限页面
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

</head>
<body>
<div class="modal fade" id="ruleUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">设置上限</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="sort_rule" class="col-sm-2 control-label">类别上限</label>
                        <div class="col-sm-10">
                            <input type="number" name="sort" class="form-control" id="sort_rule" min="0" max="8"
                                   step="0.5"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="sort_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="sort_update_btn">确认</button>
            </div>
        </div>
    </div>
</div>

<%--设置申报规则的模态框--%>
<div class="modal fade" id="ruleSetting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">设置规则</h4>
            </div>
            <div class="modal-body">
                <textarea class="form-control" id="rule_content" rows="20" style="min-width: 90%">${admins.college.rule }</textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="rule_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="rule_update_btn">确认</button>
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
                    <h4>审核规则</h4>
                    <div class="action">
                        <button class="btn btn-success" id="setRule">规则说明</button>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="rule_table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>类别</th>
                            <th>审核上限</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
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
<script type="text/javascript">

    $(function () {

        getSort();
    });

    var arr = new Array("大学生学科竞赛活动(含大学生创新创业训练项目)", "大学生文体竞赛活动", "创新创业实践训练(课程)", "论文、专利、作品发表", "职业(等级)证书"
        , "参与教师科研(或实验室工作)", "社会实践(调查)", "读书活动", "学生工作与社团活动", "专业认定的其他创新实践活动");

    function getSort() {

        $.ajax({
            url: "sort/sort",
            data: {
                "collegeId":${admins.collegeId}
            },
            type: "GET",
            success: function (result) {

                var i = 1;
                var sort = result.extend.sort;
                $.each(sort, function (index, item) {

                    //当结果index不为id时
                    if (index != "id") {
                        var count = $("<td></td>").append(i);
                        var sort = $("<td></td>").append(arr[i - 1]);
                        var max = $("<td></td>").append(item);
                        var editBtn = $("<td></td>").append($("<a>编辑</a>").addClass("btn btn-primary btn-2x edit-btn").attr("sort-id", i));

                        i++;

                        $("<tr></tr>")
                            .append(count)
                            .append(sort)
                            .append(max)
                            .append(editBtn)
                            .appendTo("#rule_table tbody");

                    }
                });
            },
            error: function () {
                alert("服务器繁忙!");
            }
        });
    }

    //设置规则说明
    $("#setRule").click(function () {

        $("#ruleSetting").modal({
            backdrop:"static"
        });
    });

    //更新审核规则
    $("#rule_update_btn").click(function () {

        $.ajax({
            url:"college/rule",
            type:"PUT",
            data:{
                "collegeId":${admins.collegeId },
                "rule":$("#rule_content").val()
            },
            success:function () {

                $("#ruleSetting").modal("hide");
            },
            error:function () {
                alert("服务器繁忙!");
            }
        })

    });

    //给编辑按钮添加单击事件
    $(document).on("click", ".edit-btn", function () {

        $("#sort_rule").empty();
        $("#sort_update_btn").attr("sort-id", $(this).attr("sort-id"));

        $("#ruleUpdateModal").modal({
            backdrop: "static"
        });
    });

    function validate_rule_grade() {

        //控制输入文本框的格式
        if ($("#sort_rule").val().trim() == "" || $("#sort_rule").val() < 0) {
            return false;
        }

        return true;
    }

    //给模态框的更新按钮添加单击事件
    $("#sort_update_btn").click(function () {

        //验证数据的输入是否合法
        if (!validate_rule_grade()) {
            alert("输入有误!");
            return false;
        }

        //发送请求进行更新
        $.ajax({
            url: "sort/sort",
            type: "PUT",
            data: {
                "collegeId":${admins.collegeId },
                "sort": $("#sort_rule").val(),
                "sortId": $(this).attr("sort-id")
            },
            success: function (result) {

                if (result.code == 100) {

                    //关闭模态框
                    $("#ruleUpdateModal").modal("hide");

                    window.location.reload();

                }

            },
            error: function () {
                alert("服务器繁忙!");
            }
        })


    })


</script>