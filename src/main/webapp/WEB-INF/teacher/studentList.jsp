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

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
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
                    <div class="logo"><img src="static/images/logo.png" height="70"/></div>
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
                    <li><a href="teacher/teaIndex">首页</a></li>
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
                            <label for="exampleInputClass">班级</label>
                            <input type="text" class="form-control" id="exampleInputClass" name="stuClass"
                                   placeholder="如:软工1811">
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
                                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 600px">
                                </div>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <center>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li><a href="teacher/stuList?page=1">首页</a></li>
                                        <c:if test="${info.pageNum==1}">
                                            <li class="disabled">
                                                <a href="javascript:void(0)" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:if test="${info.pageNum!=1}">
                                            <li>
                                                <a href="teacher/stuList?page=${info.pageNum-1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:if test="${info.pages<=5}">
                                            <c:forEach begin="1" end="${info.pages}" var="i">
                                                <c:if test="${info.pageNum==i}">
                                                    <li class="active"><a href="teacher/stuList?page=${i}">${i}</a></li>
                                                </c:if>
                                                <c:if test="${info.pageNum!=i}">
                                                    <li><a href="teacher/stuList?page=${i}">${i}</a></li>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${info.pages>5}">
                                            <c:forEach begin="1" end="5" var="i">
                                                <c:if test="${info.pageNum==i}">
                                                    <li class="active"><a href="teacher/stuList?page=${i}">${i}</a></li>
                                                </c:if>
                                                <c:if test="${info.pageNum!=i}">
                                                    <li><a href="teacher/stuList?page=${i}">${i}</a></li>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>


                                        <c:if test="${info.pageNum==info.pages}">
                                            <li class="disabled">
                                                <a href="javascript:void(0)" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:if test="${info.pageNum!=info.pages}">
                                            <li>
                                                <a href="teacher/stuList?page=${info.pageNum+1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <li><a href="teacher/stuList?page=${info.pages}">末页</a></li>
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
    $("#btn_stuExport").click(function () {
    });
</script>