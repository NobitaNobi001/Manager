<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>

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

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<%--审核数据时的模态框--%>
<div class="modal fade" id="stuWithAudit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">审核学分</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="stu_name" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                        <div class="col-sm-10">
                            <input type="text" name="stu_name" class="form-control" id="stu_name" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sort" class="col-sm-2 control-label">申报类别</label>
                        <div class="col-sm-10">
                            <input type="text" name="sort" class="form-control" id="sort" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="picture_btn" class="col-sm-2 control-label">申报材料</label>
                        <div class="col-sm-10">
                            <button type="button" class="btn btn-default" data-container="body" data-toggle="popover"
                                    data-placement="right" name="picture_btn" id="picture_btn">查看图片
                            </button>
                            <%--<div class="btn-default"><a tabindex="0" role="button" data-toggle="popover" id="picture_btn">查看图片</a></div>--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apply_name" class="col-sm-2 control-label">申报名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="apply_name" class="form-control" id="apply_name" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apply_credit" class="col-sm-2 control-label">申报学分</label>
                        <div class="col-sm-10">
                            <input type="text" name="apply_credit" class="form-control" id="apply_credit" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apply_words" class="col-sm-2 control-label">申报描述</label>
                        <div class="col-sm-10">
                            <input type="text" name="apply_words" class="form-control" id="apply_words" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="audit_credit" class="col-sm-2 control-label">审核学分</label>
                        <div class="col-sm-10">
                            <input type="number" name="audit_credit" class="form-control" id="audit_credit" step="0.5"
                                   min="0" max="8"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="stu_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_audit_btn">确认</button>
            </div>
        </div>
    </div>
</div>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="teacher/teaProfile">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="teacher/index">首页</a></li>
                    <li><a href="teacher/teaProfile">个人信息</a></li>
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
                    <li><a href="teacher/stuList">学生列表</a></li>
                    <li><a href="teacher/declareManager">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="teacher/teaProfile">个人信息</a></li>
                    <li><a href="teacher/teaPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>审核管理</h4>
                    <div class="action">
                        <div>
                            <select name="department">
                                <option>${teacher.college.name }</option>
                            </select>
                        </div>
                        <div>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入姓名"/>
                            <a href="javascript:;" class="btn btn-primary" id="search">搜索</a>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="declare_table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>申报类别</th>
                            <th>申报名称</th>
                            <th>申报学分</th>
                            <th>审核状态</th>
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
<script type="text/javascript">
    //获取学生的学号
    var StuNumber;
    //去第一页
    $(function () {
        to_page(1);
    });
    //单击搜索按钮后
    $("#search").click(function () {
        //正则校验搜索框的输入
        var regKey = /[\u4E00-\u9FA5]/;
        if (!regKey.test($("#keywords").val().trim())) {
            alert("请输入正确的姓名!");
            return false;
        }
        $.ajax({
            url: "record/stuRecord",
            type: "GET",
            data: {
                "stuName": $("#keywords").val(),
                "collegeId": "${teacher.collegeId }"
            },
            success: function (result) {
                //清空table表格样式
                $("#declare_table tbody").empty();
                //清空分页条数据
                $("#page_nav_area").empty();
                //清空分页信息
                $("#page_info_area").empty();
                if (result.code == 100) {
                    //1.构建申报管理表格
                    build_declare_table(result);
                    //2.解析分页条信息
                    build_page_nav(result);
                    //3.解析分页信息
                    build_page_info(result);
                }
                if (result.code == 200) {
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#declare_table tbody");
                }
            },
            error: function () {
                alert("服务器繁忙!");
            }
        });
    })

    function to_page(pn) {

        if(${teacher.auditGrade==""}){
            $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#declare_table tbody");
            return false;
        }

        $.ajax({
            url: "record/declare",
            type: "GET",
            data: {
                "pn": pn,
                "collegeId": ${teacher.collegeId },
                "auditGrade":${teacher.auditGrade==""?"-1":teacher.auditGrade}
            },
            success: function (result) {
                //清空table表格样式
                $("#declare_table tbody").empty();
                //清空分页条数据
                $("#page_nav_area").empty();
                //清空分页信息
                $("#page_info_area").empty();
                if (result.code == 100) {
                    //1.构建申报管理表格
                    build_declare_table(result);
                    //2.解析分页条信息
                    build_page_nav(result);
                    //3.解析分页信息
                    build_page_info(result);
                } else if (result.code == 200) {
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#declare_table tbody");
                }
            }
        });
    }

    //申报管理表格构建
    function build_declare_table(result) {
        //清空table表格
        // $("#declare_table tbody").empty();
        //拿到后台返回的数据
        var stuDeclareInfo = result.extend.pageInfo;
        //遍历返回的数据
        $.each(stuDeclareInfo.list, function (index, item) {
            //学生申报记录的序号 index是从0开始
            var stuCount = $("<td></td>").append(index + 1 + (stuDeclareInfo.pageNum - 1) * 5);
            //学生学号
            var stuNumber = $("<td></td>").append(item.stuNumber);
            //学生姓名
            var stuName = $("<td></td>").append(item.stuName);
            //申报类别
            var applySort = $("<td></td>").append(item.sort);
            //申报名称
            var applyName = $("<td></td>").append(item.applyName);
            //申报学分
            var applyCredit = $("<td></td>").append(item.applyCredit);
            //根据审核状态给审核按钮赋予不同的颜色
            var state_a = $("<a></a>");
            if (item.auditState == "已审核") {     //已审核
                state_a.addClass("btn btn-success btn-2x");
            } else {    //未审核
                state_a.addClass("btn btn-danger btn-2x");
            }
            //审核状态
            var applyState = $("<td></td>").append(state_a.append(item.auditState));
            //审核按钮 为审核按钮添加一个自定义的属性来表示当前学生的id
            var auditBtn = $("<td></td>").append($("<a></a>").addClass("btn btn-primary btn-2x audit-btn").attr("audit-id", item.id).append("审核"));
            $("<tr></tr>").append(stuCount)
                .append(stuNumber)
                .append(stuName)
                .append(applySort)
                .append(applyName)
                .append(applyCredit)
                .append(applyState)
                .append(auditBtn)
                .appendTo("#declare_table tbody");
        });
    }

    //给审核按钮绑定单击事件
    $(document).on("click", ".audit-btn", function () {
        //查出对应学生的申报信息
        getStuRecord($(this).attr("audit-id"));
        //把本学生的学分申报记录的id赋给模态框的确定按钮
        $("#stu_audit_btn").attr("audit-id", $(this).attr("audit-id"));
        $("#stuWithAudit").modal({
            //设置点击背景模态框不会消失
            backdrop: "static"
        });
    });

    //校验审核学分
    function validate_audit_credit() {
        if ($("#audit_credit").val().trim() != "" && $("#audit_credit").val() >= 0) {
            return true;
        }
        return false;
    }

    //模态框的确定按钮
    $("#stu_audit_btn").click(function () {
        if (!validate_audit_credit()) {
            alert("请填写正确的审核学分!");
            return false;
        }
        //发送ajax请求更新审核的信息
        $.ajax({
            url: "record/updateRecord/" + $(this).attr("audit-id"),
            type: "PUT",
            data: {
                "auditCredit": $("#audit_credit").val(),
                "auditTea": "${teacher.teaName }",
                "collegeId":${teacher.collegeId },
                "sort": $("#sort").val()
            },
            success: function (result) {
                if (result.code == 100) {   //成功更新审核信息和总学分
                    //关闭模态框
                    $("#stuWithAudit").modal("hide");
                    //回到本页面
                    to_page(currentPage);
                }
                if (result.code == 200) {   //失败
                    alert(result.extend.msg);
                }
                //同时关闭申报图片的显示
                $(".popover").popover('hide');
            }, error: function () {
                alert("服务器繁忙!");
            }
        });
    });
    //模态框关闭时
    $("#stu_close_btn").click(function () {
        //关闭申报图片的显示
        $(".popover").popover('hide');
    });
    //定义一个全局变量来表示图片的url
    var url;

    //根据申报记录的id获取对应的学生的申报记录
    function getStuRecord(id) {
        $.ajax({
            url: "record/studentRecord/" + id,
            type: "GET",
            success: function (result) {
                //解析数据 回显到模态框内
                var stuRecordData = result.extend.stuRecord;
                StuNumber = stuRecordData.stuNumber;
                //姓名
                $("#stu_name").val(stuRecordData.stuName);
                //申报类别
                $("#sort").val(stuRecordData.sort);
                //申报材料的url
                url = "applyImg/" + stuRecordData.picture;
                //申报名称
                $("#apply_name").val(stuRecordData.applyName);
                //申报学分
                $("#apply_credit").val(stuRecordData.applyCredit);
                //申报描述
                $("#apply_words").val(stuRecordData.words.trim() == "" ? "无" : stuRecordData.words);
                //审核学分
                $("#audit_credit").val(stuRecordData.auditCredit == 0 ? stuRecordData.applyCredit : stuRecordData.auditCredit);
            },
            error: function () {
                alert("服务器繁忙");
            }
        });
    }

    //显示和关闭申报图片
    $("#picture_btn").popover({
        trigger: 'click',
        html: true,
        content: function () {
            var $div = $("<div style='width: 700px; height:500px;'></div>");
            var $img = $("<img style='width: 700px; height:500px;' id='picture_show'/>");
            $img.attr("src", url);
            $img.appendTo($div);
            return $div;
        }
    });
</script>