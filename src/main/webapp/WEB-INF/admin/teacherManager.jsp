<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="<%=basePath%>">

    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" media="all">

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>
</head>
<body>

<%--教师修改的的模态框--%>
<div class="modal fade" id="teacherUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                        <label for="teacherNumber_update_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaNumber" class="form-control" id="teacherNumber_update_input"
                                   readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teacherName_update_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaName" class="form-control" id="teacherName_update_input">
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
                        <label for="teacherPosition_update_input" class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaPositon" class="form-control"
                                   id="teacherPosition_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control"
                                   id="email_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone_update_input" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control"
                                   id="phone_update_input">
                            <span class="help-block"></span>
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
                <button type="button" class="btn btn-primary" id="teacher_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 教师添加的模态框 -->
<div class="modal fade" id="teacherAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增教师</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="teacherNumber_add_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaNumber" class="form-control" id="teacherNumber_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teacherName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaName" class="form-control" id="teacherName_add_input">
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
                        <label for="teacherPosition_add_input" class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaPositon" class="form-control"
                                   id="teacherPosition_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <%--部门提交id即可--%>
                            <select class="form-control" name="collegeId">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="teacher_save_btn">保存</button>
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
                    <a href="admin/admProfile">${admin.adminName}(${admin.adminNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
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
                    <li><a href="admin/toSee/studentRecord.html">申报管理</a></li>
                    <li><a href="admin/get/student.html">学生管理</a></li>
                    <li><a href="admin/teaManager">教师管理</a></li>
                    <li><a href="admin/watManager">督查管理</a></li>
                    <li><a href="admin/admManager">学院管理</a></li>
                    <li><a href="admin/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                    <li><a href="admin/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>教师管理</h4>
                    <div class="action" style="float: left;">
                        <div style="float: left;">
                            <select name="college" id="college">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入教师姓名" value=""/>
                            <button onclick="to_page_condition(1)" class="btn btn-primary">搜索</button>
                        </div>
                        <div style="margin-left: 325px;">
                            <button class="btn btn-primary" id="add_teacher_btn">新增教师</button>
                            <button class="btn btn-danger" id="batch_del_teacher">删除教师</button>
                            <button class="btn btn-success" id="batch_add_teacher_btn">导入教师</button>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="teacher_info">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="allChecked">
                            </th>
                            <th>序号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>院系</th>
                            <th>职称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody style="vertical-align: middle;"></tbody>
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
<script type="text/javascript" src="static/js/common/tableCondition.js"></script>
<%--引入一些清空样式的基本操作--%>
<script type="text/javascript" src="static/js/common/prompt.js"></script>
<script type="text/javascript" src="static/js/admin/teacherManager.js"></script>
<script type="text/javascript">
    $(function () {
        to_page(1);
    });

    layui.use('upload', function () {
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: "#batch_add_teacher_btn", // 绑定元素
            url: "teacher/insertTeacherByExcel",// 上传接口
            accept: "file",// 普通文件
            acceptMime: "application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", // 接收的mime类型
            auto: true,// 自动上传
            multiple: false,// 取消多文件上传
            field: "ExcelFile",// 设置字段名
            exts: 'xls|xlsx',// 允许上传的文件后缀
            before: function () {
                layer.msg('上传中', {icon: 16, shade: 0.01}); // 上传loading
            },
            done: function (res, index, upload) {// 上传完毕回调 res服务器响应信息 index当前文件的索引 upload重新上传的方法
                layer.close(layer.index); // 关闭loading
                if (res.code == 100) {
                    layer.msg(res.extend.message, {icon: 1, time: 3000}, function () {
                        // 重新加载页面
                        location.reload();
                    });
                } else {
                    layer.alert(res.extend.message, {icon: 2});
                }
            },
            error: function (index, upload) {// 请求异常回调
                layer.msg("网络请求超时,请稍后再试或联系管理员");
            }
        });

    });
</script>