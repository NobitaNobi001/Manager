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
                            <input type="text" name="picture" class="form-control" id="picture" readonly/>
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
                            <input type="text" name="audit_credit" class="form-control" id="audit_credit" />
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">审核状态</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="audit_state">
                                <option checked="checked">未审核</option>
                                <option>已审核</option>
                                <option>未成功</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_audit_btn">导出</button>
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
                    <a href="${APP_PATH}/teacher/teaProfile">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="${APP_PATH}/login.jsp">退出</a>
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
                            <input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字" value="" />
                            <a href="javascript:;" class="btn btn-primary">搜索</a>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th style="text-align: left;">申报项目</th>
                            <th>学分</th>
                            <th>审核状态</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>2020062101</td>
                            <td>杨歆</td>
                            <td style="text-align: left;">大学生学科竞赛活动（含大学生创新创业训练项目）</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-danger btn-2x">待审核</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x" id="audit">审核</a></td>
                        </tr>

                    </table>
                    <div style="text-align: center;">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="#">首页</a></li>
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- 学分列表 end -->
            </div>
        </div>
    </div>
</main>
<footer>
    <div id="footer">
        <div class="footer">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</footer>
</body>
</html>
<script type="text/javascript">

    $("#audit").click(function () {

        $("#stuWithAudit").modal({

            //设置点击背景模态框不会消失
            backdrop: "static"
        });

    });
</script>
