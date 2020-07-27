<%--
  学生学分
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>湖北文理学院创新学分系统</title>

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

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
                    <a href="${APP_PATH}/watcher/watProfile" style="font-size: 14px; color: #337ab7;">
                        ${watcher.watcherName }(${watcher.watcherNumber })</a>
                    <a href="${APP_PATH}/logout" style="font-size: 14px; color: #337ab7;">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">督查中心</a></li>
                    <li><a href="${APP_PATH}/watcher/watIndex">首页</a></li>
                    <li><a href="${APP_PATH}/watcher/watProfile">个人信息</a></li>
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
                    <h4>学生学分列表</h4>
                    <form class="action" action="" method="post">
                        <div>
                            <select name="college" id="college">
                                <option selected="selected">请选择</option>
                            </select>
                        </div>
                        <div>
                            <select name="major" id="major">
                                <option selected="selected">请选择</option>
                            </select>
                        </div>
                        <div>
                            <select name="class" id="stuClass">
                                <option selected="selected">请选择</option>
                            </select>
                        </div>
                        <div>
                            <%--<input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字"/>--%>
                            <button type="submit" class="btn btn-default" id="selectCondition">确定</button>
                        </div>
                    </form>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>总学分</th>
                        </tr>
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
                    </table>
                    <center>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${APP_PATH}/watcher/stuCredit?page=1">首页</a></li>
                                <c:if test="${info.pageNum==1}">
                                    <li class="disabled">
                                        <a href="javascript:void(0)" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${info.pageNum!=1}">
                                    <li>
                                        <a href="${APP_PATH}/watcher//stuCredit?page=${info.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${info.pages<=5}">
                                    <c:forEach begin="1" end="${info.pages}" var="i">
                                        <c:if test="${info.pageNum==i}">
                                            <li class="active"><a
                                                    href="${APP_PATH}/watcher//stuCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${info.pageNum!=i}">
                                            <li><a href="${APP_PATH}/watcher//stuCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${info.pages>5}">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:if test="${info.pageNum==i}">
                                            <li class="active"><a
                                                    href="${APP_PATH}/watcher//stuCredit?page=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${info.pageNum!=i}">
                                            <li><a href="${APP_PATH}/watcher//stuCredit?page=${i}">${i}</a></li>
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
                                        <a href="${APP_PATH}/watcher//stuCredit?page=${info.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <li><a href="${APP_PATH}/watcher//stuCredit?page=${info.pages}">末页</a></li>
                                <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页，(${info.total}条记录)
									</span>
                            </ul>
                        </nav>
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

    $(function () {

        // 若是校级督察就将十八个学院全部添加到下拉框中
        if ("${watcher.collegeId }" == 19) {

            getColleges("#college");

            //二级联动
            $("select[name='college']").change(function () {
                var collegeCode = $("select[name='college']").val();
                getMajor(collegeCode);
            });

            //三级联动
            $("select[name='major']").change(function () {
                var collegeCode = $("select[name='college']").val();
                var majorCode = $("select[name='major']").val();
                getClass(collegeCode, majorCode);
            });

        } else {
            $("select[name='college']").append(("<option value='${watcher.collegeId }'>${watcher.college.name }</option>"));

            //获取专业
            getMajor($("select[name='college']").val());

            //获取班级
            getClass($("select[name='college']").val(), $("select[name='major']").val());
        }
    });

    //根据学院 专业 班级查询出数据
    $("#selectCondition").click(function () {

        $.ajax({
            url: "${APP_PATH}/college/conditionSearch",
            data: {
                "collegeId": "${watcher.collegeId }" == 19 ? $('#college option:selected').val() : "${watcher.collegeId }",
                "major": $("#major option:selected").val(),
                "stuClass": $("#stuClass option:selected").val()
            },
            type: "GET",
            success: function (result) {

            }
        });
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

    //获取专业
    function getMajor(collegeCode) {

        var firstMajorCode;

        // ajax请求所有专业
        $.get("${APP_PATH}/college/getMajor", {
            "collegeId": collegeCode
        }, function (data) {
            // 先清空专业下拉框
            $("select[name='major']").empty();
            $.each(data, function (index, element) {
                $("select[name='major']").append($("<option></option>").val(element).text(element));
            });
            firstMajorCode = data[0];
            // 根据第一个专业code获取对应班级
            getClass(collegeCode, firstMajorCode);
        }, 'json');
    };

    //获取班级
    function getClass(collegeCode, majorCode) {

        // ajax请求所有班级
        $.get("${APP_PATH}/college/getClass", {
            "collegeId": collegeCode,
            "major": majorCode
        }, function (data) {
            console.log(data);
            // 先清空班级下拉框
            $("select[name='class']").empty();
            $.each(data, function (index, element) {
                $("select[name='class']").append($("<option></option>").val(element).text(element));
            });
        }, 'json');
    };

</script>