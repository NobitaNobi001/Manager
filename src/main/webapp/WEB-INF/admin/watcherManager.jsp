<%--
  //督察管理
  Created by IntelliJ IDEA.
  User: jihn
  Date: 20/7/26
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <base href="<%=basePath%>">

    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<%--督察修改的模态框--%>
<div class="modal fade" id="watcherUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="watcherNumber_update_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="watcherNumber" class="form-control"
                                   id="watcherNumber_update_input" readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="watcherName_update_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="watcherName" class="form-control" id="watcherName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password_update_input" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="password_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone_update_input" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男"
                                       checked="checked"/>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女"/>女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <%--部门提交id即可--%>
                            <select class="form-control" name="collegeId">
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <option value="${college.id }">${college.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="watcher_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 督察添加的模态框 -->
<div class="modal fade" id="watcherAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增督察</h4>
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
                            <select class="form-control" name="collegeId">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <option value="${college.id }">${college.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="watcher_save_btn">保存</button>
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
                        <div style="float: left;">
                            <select name="college" id="college">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <option value="${college.id }">${college.name }</option>
                                </c:forEach>
                            </select>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入督察姓名" value=""/>
                            <button onclick="to_page_condition(1)" class="btn btn-primary">搜索</button>
                        </div>
                        <div style="margin-left: 325px;">
                            <button class="btn btn-primary" id="add_watcher_btn">新增督查</button>
                            <button class="btn btn-danger" id="batch_del_watcher">删除督察</button>
                            <button class="btn btn-success" id="batch_add_watcher_btn">导入督察</button>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="watcher_info">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="checkAllWatchers"/>
                            </th>
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
<script type="text/javascript" src="${APP_PATH}/static/js/common/tableInfo.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/common/tableCondition.js"></script>
<%--引入一些清空样式的基本操作--%>
<script type="text/javascript" src="${APP_PATH}/static/js/common/prompt.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/admin/watcherManager.js"></script>

