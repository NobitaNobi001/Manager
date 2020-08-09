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
                    <li><a href="${APP_PATH}/watcher/fraction">学生学分</a></li>
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
<script type="text/javascript">

    //创建学院数组
    var arr = new Array(
        "马克思主义学院",
        "政法学院",
        "教育学院",
        "体育学院",
        "文学与传媒学院",
        "外国语学院",
        "数学与统计学院",
        "物理与电子工程学院",
        "计算机工程学院",
        "汽车与交通工程学院",
        "机械工程学院",
        "土木工程与建筑学院",
        "食品科学技术学院·化学工程学院",
        "医学院",
        "资源环境与旅游学院",
        "经济管理学院",
        "美术学院",
        "音乐与舞蹈学院"
    );
    var currentPage = 0;

    $(function () {

        // 若是校级督察就将十八个学院全部添加到下拉框中
        if ("${watcher.collegeId }" == 19) {

            for (var i = 0; i < arr.length; i++) {
                $("select[name='college']").append($("<option></option>").val(i + 1).text(arr[i]));
            }
            //设置value值为0的学院为默认选中
            $("#college").find("option[value='1']").attr("selected", true);

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
            var applyBtn = $("<td></td>").append($("<button>查看</button>").addClass("btn btn-default"));
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

    function build_page_nav(result) {
        //清空原有数据
        // $("#page_nav_area").empty();
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

    function build_page_info(result) {
        //清空原有数据
        // $("#page_info_area").empty();

        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" + result.extend.pageInfo.pages + "页,"
            + "总" + result.extend.pageInfo.total + "条记录");

        //表示当前页
        currentPage = result.extend.pageInfo.pageNum;
    }

</script>
