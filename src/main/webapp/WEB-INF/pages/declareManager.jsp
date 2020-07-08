<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <label for="picture" class="col-sm-2 control-label">申报材料</label>
                        <div class="col-sm-10">
                            <%--<img name="picture" class="form-control" id="picture"/>--%>
                            <input type="button" name="picture" id="picture" class="btn btn-default" value="查看图片"
                                   style="padding-top: 5px;"/>
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
                            <input type="text" name="audit_credit" class="form-control" id="audit_credit"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">审核状态</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="audit_state" id="audit_state">
                                <option value="未审核">未审核</option>
                                <option value="已审核">已审核</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_audit_btn">确认</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

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
                    <a href="${APP_PATH}/teacher/teaProfile">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="${APP_PATH}/logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="${APP_PATH}/teacher/teaIndex">首页</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/teacher/stuList">学生列表</a></li>
                    <li><a href="${APP_PATH}/teacher/declareManager">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
                    <li><a href="${APP_PATH}/teacher/teaPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>学分申报审核列表</h4>
                    <div class="action">
                        <div>
                            <select name="department">
                                <option>${teacher.college.name }</option>
                            </select>
                        </div>
                        <div>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字" value=""/>
                            <a href="javascript:;" class="btn btn-primary">搜索</a>
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
                <div style="line-height:74px;margin: 0 auto; width: 540px">
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
<script type="text/javascript">

    //表示当前页
    var currentPage = 0;
    //获取学生的学号
    var StuNumber;

    //去第一页
    $(function () {
        to_page(1);

    });

    function to_page(pn) {

        $.ajax({
            url: "${APP_PATH}/teacher/declare",
            type: "GET",
            data: {
                "pn": pn,
                "collegeId": ${teacher.collegeId }
            },
            success: function (result) {
                //1.构建申报管理表格
                build_declare_table(result);
                //2.解析分页条信息
                build_page_nav(result);
                //3.解析分页信息
                build_page_info(result);
            }
        });
    }

    //申报管理表格构建
    function build_declare_table(result) {
        //清空table表格
        $("#declare_table tbody").empty();
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

    //校验审核状态
    function validate_audit_state(){
        if($("#audit_state option:selected").val()=="已审核"){
            return true;
        }
        return false;
    }

    //模态框的确定按钮
    $("#stu_audit_btn").click(function () {

        if(!validate_audit_state()){
            alert("请修改审核状态");
            return false;
        }

        //发送ajax请求更新审核的信息
        $.ajax({
            url: "${APP_PATH}/record/stuRecord/" + $(this).attr("audit-id"),
            type: "PUT",
            data: {
                "stuNumber": StuNumber,
                "auditCredit": $("#audit_credit").val(),
                "auditTea": "${teacher.teaName }",
                "auditState": $("#audit_state option:selected").val()
            },
            success: function (result) {

                if (result.code == 100) {   //成功更新审核信息和总学分
                    //关闭模态框
                    $("#stuWithAudit").modal("hide");
                    //回到本页面
                    to_page(currentPage);
                }
                if (result.code == 200) {   //失败
                    alert("此条申报记录已经审核，请不要重复操作!");
                }

            }, error: function (result) {
                alert("服务器繁忙");
            }
        });
    });

    //根据申报记录的id获取对应的学生的申报记录
    function getStuRecord(id) {
        $.ajax({
            url: "${APP_PATH}/record/stuRecord/" + id,
            type: "GET",
            success: function (result) {
                //解析数据 回显到模态框内
                var stuRecordData = result.extend.stuRecord;

                StuNumber = stuRecordData.stuNumber;
                //姓名
                $("#stu_name").val(stuRecordData.stuName);
                //申报类别
                $("#sort").val(stuRecordData.sort);

                //申报材料
                // var url = stuRecordData.picture;
                // //获得一个http格式的url路径
                // var windowURL = window.URL || window.webkitURL;
                // //创建一个指向该参数的图片的URL
                // var dataURL = windowURL.createObjectURL(url);
                // $("#picture").attr("src", dataURL);

                //申报名称
                $("#apply_name").val(stuRecordData.applyName);
                //申报学分
                $("#apply_credit").val(stuRecordData.applyCredit);
                //申报描述
                $("#apply_words").val(stuRecordData.words.trim() == "" ? "无" : stuRecordData.words);
                //审核学分
                $("#audit_credit").val(stuRecordData.auditCredit == 0 ? "" : stuRecordData.auditCredit);

                //取消原先的选中状态
                $("#audit_state").find("option:selected").attr("selected",false);
                //审核状态 根据后台传来的状态修改模态框内部的选择状态
                $("#audit_state").find("option[value='" + stuRecordData.auditState + "']").attr("selected", true);

            },
            error: function () {
                alert("服务器繁忙");
            }
        });
    }

    //解析分页条信息
    function build_page_nav(result) {
        //清空原有数据
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建分页条元素
        //首页及前一页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        //如果在首页 那么首页和前一页添加禁用
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {

            //为元素添加翻页事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        //构建下一页和末页元素
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));

        //如果在末页 那么末页和下一页添加禁用
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //点击末页去到最后一页
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });

            //点击下一页去到下一页
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        //首页和上一页添加到分页条
        ul.append(firstPageLi).append(prePageLi);

        //添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });

            ul.append(numLi);
        });

        //下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul添加到nav元素
        var nav = $("<nav></nav>").append(ul);
        //把nav添加到页码栏区域
        nav.appendTo("#page_nav_area");
    }

    //解析分页信息
    function build_page_info(result) {
        //清空原有数据
        $("#page_info_area").empty();

        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" + result.extend.pageInfo.pages + "页,"
            + "总" + result.extend.pageInfo.total + "条记录");

        //表示当前页
        currentPage = result.extend.pageInfo.pageNum;
    }


</script>
