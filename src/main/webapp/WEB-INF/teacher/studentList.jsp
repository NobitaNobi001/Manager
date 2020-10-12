<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<%--显示详细信息的模态框--%>
<div class="modal fade" id="RecordInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">申报记录</h4>
            </div>
            <div class="modal-body">
                <table class="table" border="0" cellspacing="0" cellpadding="0" id="record_table">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>申报日期</th>
                        <th>申报类别</th>
                        <th>申报名称</th>
                        <th>申报学分</th>
                        <th>审核学分</th>
                        <th>审核状态</th>
                        <th>审核教师</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div>
                    <%--分页条信息--%>
                    <div id="page_nav_area"></div>
                    <%--分页文字信息--%>
                    <div id="page_info_area"></div>
                </div>
            </div>
        </div>
        <div class="modal-footer"></div>
    </div>
</div>

<!--创新实践学分明细模态框-->
<div class="modal fade" id="SumCreditDetailDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">学分分布情况</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-6 control-label">大学生学科竞赛活动(含大学生创新创业训练项目):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="大学生学科竞赛活动(含大学生创新创业训练项目)" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">大学生文体竞赛活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="大学生文体竞赛活动" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">创新创业实践训练(课程):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="创新创业实践训练(课程)" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">论文、专利、作品发表:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="论文、专利、作品发表" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">职业(等级)证书:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="职业(等级)证书" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">参与教师科研(或实验室工作):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="参与教师科研(或实验室工作)" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">社会实践(调查):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="社会实践(调查)" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">读书活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="读书活动" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">学生工作与社团活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="学生工作与社团活动" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">专业认定的其他创新实践活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="专业认定的其他创新实践活动" readonly/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<%--导出数据时的模态框--%>
<div class="modal fade" id="stuWithCondition" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">导出数据</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="export/exportStu">
                    <div class="form-group">
                        <label for="college_stuList" class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-10">
                            <input type="text" name="college" class="form-control" id="college_stuList"
                                   value="${teacher.college.name }" disabled="disabled"/>
                            <input type="hidden" name="collegeId" value="${teacher.collegeId }">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="major" name="major">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4">
                            <%--班级提交id即可--%>
                            <select class="form-control" id="className" name="stuClass">
                                <option value="-1">请选择班级</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学分排序</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="order" id="order_stuList1" value="1"
                                       checked="checked"/>升序
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="order" id="order_stuList2" value="2"/>降序
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" id="emp_update_btn">导出</button>
                    </div>
                </form>
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
                    <h4>学生列表</h4>
                    <form class="form-inline" action="teacher/queryStu" method="post"
                          style="margin-left: 20px; line-height: 72px;">
                        <div class="form-group">
                            <label for="exampleInputNumber">学号</label>
                            <input type="text" class="form-control" id="exampleInputNumber" name="stuNumber"
                                   placeholder="如:2018111111" onkeyup="this.value=this.value.replace(/\D/g,'')"
                                   onafterpaste="this.value=this.value.replace(/\D/g,'')">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">姓名</label>
                            <input type="text" class="form-control" id="exampleInputName" name="stuName"
                                   placeholder="如:张三">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputMajor">专业</label>
                            <input type="text" class="form-control" id="exampleInputMajor" name="major"
                                   placeholder="如:软件工程">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputClass">班级</label>
                            <input type="text" class="form-control" id="exampleInputClass" name="stuClass"
                                   placeholder="如:1811">
                        </div>
                        <button type="submit" class="btn btn-default">查询</button>
                        <div class="action form-group"
                             style="text-align: right;margin: 10px 0;padding: 10px 0; float: right">
                            <a href="javascript:;" class="btn btn-danger" id="btn_stuExport">导出数据</a>
                        </div>
                    </form>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="stus_table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>学分</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="student" varStatus="s" items="${info.list}">
                            <tr>
                                <td>${s.count+(info.pageNum-1)*5}</td>
                                <td>${student.stuNumber}</td>
                                <td>${student.stuName}</td>
                                <td>${student.college.name}</td>
                                <td>${student.major}</td>
                                <td>${student.className}</td>
                                <td>${student.sumCredit}</td>
                                <td><a class="btn btn-success clear_btn" stu_number="${student.stuNumber}">学分明细</a>
                                    <a class="btn btn-danger all_record" stu_number="${student.stuNumber}">申报记录</a></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty info.list}">
                            <tr>
                                <td colspan="7">暂无数据记录</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <c:choose>
                        <c:when test="${empty info.list}">
                            <nav aria-label="Page navigation">
                                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 800px">
                                </div>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <center>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li>
                                            <a href="teacher/queryStu?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=1">首页</a>
                                        </li>

                                        <c:if test="${info.hasPreviousPage}">
                                            <li>
                                                <a href="teacher/queryStu?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=${info.prePage}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach items="${info.navigatepageNums }" var="i">
                                            <c:if test="${info.pageNum==i}">
                                                <li class="active"><a
                                                        href="teacher/stuList?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=${i}">${i}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${info.pageNum!=i}">
                                                <li>
                                                    <a href="teacher/queryStu?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=${i}">${i}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${info.hasNextPage}">
                                            <li>
                                                <a href="teacher/queryStu?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=${info.nextPage}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <li>
                                            <a href="teacher/queryStu?stuNumber=${param.stuNumber}&stuName=${param.stuName}&stuClass=${param.stuClass}&major=${param.major}&page=${info.pages}">末页</a>
                                        </li>
                                        <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页，(${info.total}条记录)
									</span>
                                    </ul>
                                </nav>
                            </center>
                        </c:otherwise>
                    </c:choose>

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
    //点击导出按钮弹出模态框
    $("#btn_stuExport").click(function () {
        getMajor("#major");
        //弹出模态框
        $("#stuWithCondition").modal({
            //设置点击背景模态框不会消失
            backdrop: "static"
        });
    });

    //将此学院的所有专业回显到页面上
    function getMajor(ele) {
        //清空原有样式
        $(ele).empty();
        $(ele).append($("<option value='-1'>请选择专业</option>"));
        $.ajax({
            url: "college/getMajor",
            data: {
                "collegeId": ${teacher.collegeId }
            },
            type: "GET",
            success: function (data) {
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

    //监听学院下拉框的改变
    $("#major").change(function () {
        //清空原有样式
        $("#className").empty();
        $("#className").append($("<option value='-1'>请选择班级</option>"));
        $.ajax({
            url: "college/getClass",
            data: {
                "collegeId":${teacher.collegeId },
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

    var stuNumber;

    $(document).on("click", ".all_record", function () {

        stuNumber = $(this).attr("stu_number");

        to_page(1);

        $("#RecordInfo").modal({
            backdrop: "static"
        })
    });

    function to_page(pn) {
        $.ajax({
            url: "record/allRecord",
            data: {
                "pn": pn,
                "stuNumber": stuNumber
            },
            type: "GET",
            success: function (result) {

                $("#record_table tbody").empty();
                $("#page_nav_area").empty();
                $("#page_info_area").empty();

                if (result.code == 100) {
                    //1.构建申报记录表格
                    build_record_table(result);
                    //2.构建分页条
                    build_page_nav(result);
                    //3.构建分页信息
                    build_page_info(result);
                } else {
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#record_table tbody");
                }
            }
        })
    }

    //构建申报信息表格
    function build_record_table(result) {
        //获得查询出的所有信息
        var records = result.extend.pageInfo;

        $.each(records.list, function (index, item) {

            //序号
            var count = $("<td></td>").append(index + 1 + (records.pageNum - 1) * 5);
            //申报日期
            var applyDate = $("<td></td>").append(item.date);
            //申报类别
            var sort = $("<td></td>").append(item.sort);
            //申报名称
            var name = $("<td></td>").append(item.applyName);
            //申报学分
            var applyCredit = $("<td></td>").append(item.applyCredit);
            //审核学分
            var auditCredit = $("<td></td>").append(item.auditCredit);
            //审核状态
            //根据审核状态给审核按钮赋予不同的颜色
            var state_a = $("<a></a>");
            if (item.auditState == "已审核") {     //已审核
                state_a.addClass("btn btn-success btn-2x");
            } else {    //未审核
                state_a.addClass("btn btn-danger btn-2x");
            }
            //审核状态
            var auditState = $("<td></td>").append(state_a.append(item.auditState));
            //审核教师
            var teacher = $("<td></td>").append(item.auditTea == null ? "无" : item.auditTea);


            $("<tr></tr>")
                .append(count)
                .append(applyDate)
                .append(sort)
                .append(name)
                .append(applyCredit)
                .append(auditCredit)
                .append(auditState)
                .append(teacher)
                .appendTo("#record_table tbody");
        });

        function sumCreditDetail(stuNumber) {
            // 发送ajax请求
            $.ajax({
                url: "student/checkCreditDetail",
                type: "POST",
                data: {"stuNumber": stuNumber},
                dataType: 'json',
                error: function (request) {
                    parent.layer.alert("网络超时,请稍后再试");
                },
                success: function (data) {
                    // 解析模态框里面的数据
                    var sortValues = $("input[name='sortValue']");
                    for (var i = 0; i < sortValues.length; i++) {
                        for (var j = 0; j < data.length; j++) {
                            if ($(sortValues[i]).attr("sort") == data[j].sort) {
                                $(sortValues[i]).val(data[j].sumUp);
                                break;
                            }
                        }
                        if ($(sortValues[i]).val() == "") {
                            $(sortValues[i]).val(0);
                        }
                    }
                }
            });
        }

        // 显示创新学分明细模态框
        $(document).on("click", ".clear_btn", function () {
            // 发送请求查看明细
            sumCreditDetail($(this).attr("stu_number"));

            $("#SumCreditDetailDemo").modal({
                backdrop: "static"
            });
        });
    }

</script>