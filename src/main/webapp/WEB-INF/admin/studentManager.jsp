
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" media="all">

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px;"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="admin/admProfile">${admin.adminName}(${admin.adminNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:void(0)">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<!-- 添加学生的模态框 -->
<div class="modal fade" id="StuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <form class="form-horizontal" role="form" action="admin/insertStuByForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="addStuCollege">学院</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="collegeId" id="addStuCollege">
                                <option value="-1">请选择学院</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="addStuMajor">专业</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="major" id="addStuMajor">
                                <option value="">请选择专业</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="addStuClass">班级</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="className" id="addStuClass">
                                <option value="">请选择班级</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stuNumber_add_input" class="col-sm-2 control-label">学生学号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="stuNumber" id="stuNumber_add_input"
                                   placeholder="请输入学生学号" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stuName_add_input" class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="stuName" id="stuName_add_input"
                                   placeholder="请输入学生姓名" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign" style="vertical-align: middle;"></span><span
                        style="vertical-align: middle;color: red">提示:初始密码自动生成,默认是学号后6位</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id="stu_save_add_btn">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--添加学生模态框-->


<!-- 修改学生信息的模态框 -->
<div class="modal fade" id="StuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改学生信息</h4>
            </div>
            <form class="form-horizontal" action="admin/updateStu.html" role="form" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id">
                    <input type="hidden" name="pageNum" value="${param.pageNum }">
                    <input type="hidden" name="keyword" value="${param.keyword }">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="updateStuCollege">学院</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="collegeId" id="updateStuCollege">
                                <option value="-1">请选择学院</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="updateStuMajor">专业</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="major" id="updateStuMajor">
                                <option value="">请选择专业</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="updateStuClass">班级</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="className" id="updateStuClass">
                                <option value="">请选择班级</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="updateStuNumber">学生学号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="stuNumber" id="updateStuNumber" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="updateStuName">学生姓名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="stuName" id="updateStuName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录密码</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon">
                                <i class="glyphicon glyphicon-eye-open" id="eye"></i>
                                </span>
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <button type="button" class="btn btn-default" id="resetPwd">重置登录密码</button>
                    <span class="glyphicon glyphicon-exclamation-sign" style="vertical-align: middle;"></span><span
                        style="vertical-align: middle;color: red">提示:密码重置后默认是学号后6位</span>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="stu_save_update_btn">更新</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--修改学生信息模态框-->

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
                    <h4>学生管理</h4>
                    <div class="action">
                        <form class="form-inline pull-left" action="admin/get/student.html" method="get" id="checkForm">
                            <div class="form-group">
                                <select name="college">
                                    <option value="-1">请选择学院</option>
                                    <c:forEach items="${applicationScope.colleges }" var="college">
                                        <c:if test="${college.id ne 19}">
                                            <option value="${college.id }">${college.name }</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="major">
                                    <option value="-1">请选择专业</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="stuClass">
                                    <option value="-1">请选择班级</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="keyword" placeholder="请输入学号/姓名"/>
                                    <span class="input-group-btn">
                               <button type="submit" class="btn btn-warning">查询</button>
                                </span>
                                </div>
                            </div>
                        </form>
                        <div class="pull-right">
                            <button type="button" class="btn btn-primary" id="stu_add_modal_btn">新增学生</button>
                            <button type="button" class="btn btn-danger"
                                    id="deleteStu__All_Btn">删除学生
                            </button>
                            <button type="button" class="btn btn-success" id="importExcel">
                                导入学生
                            </button>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <th><input type='checkbox' id="check_All"/></th>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>创新总学分</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty requestScope.pageInfo.list }">
                            <tr>
                                <td colspan="9" align="center">暂无数据记录</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty requestScope.pageInfo.list }">
                            <c:forEach items="${requestScope.pageInfo.list }" var="student" varStatus="index">
                                <tr>
                                    <td>
                                        <input type="checkbox" class="check_item">
                                    </td>
                                    <td>${index.count+(pageInfo.pageNum-1)*5 }</td>
                                    <td>${student.stuNumber }</td>
                                    <td>${student.stuName }</td>
                                    <td>${student.college.name }</td>
                                    <td>${student.major }</td>
                                    <td>${student.className }</td>
                                    <td>${student.sumCredit }</td>
                                    <td>
                                        <a class="btn btn-primary btn-2x edit_btn" edit_id="${student.id }">编辑</a>
                                        <a class="btn btn-danger btn-2x delete_btn" style="margin-left: 5px;">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <center>
                        <c:choose>
                        <c:when test="${empty requestScope.pageInfo.list}">
                            <nav aria-label="Page navigation">
                                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 600px">
                                </div>
                            </nav>
                        </c:when>
                        <c:otherwise>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="admin/get/student.html?keyword=${param.keyword }&college=${param.college }&major=${param.major}&stuClass=${param.stuClass }&pageNum=1">首页</a>
                                </li>
                                <c:if test="${pageInfo.hasPreviousPage}">
                                    <li>
                                        <a href="admin/get/student.html?keyword=${param.keyword }&college=${param.college }&major=${param.major}&stuClass=${param.stuClass }&pageNum=${pageInfo.prePage }"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach items="${pageInfo.navigatepageNums }" var="page">
                                    <c:if test="${page==pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page }</a></li>
                                    </c:if>
                                    <c:if test="${page!=pageInfo.pageNum }">
                                        <li>
                                            <a href="admin/get/student.html?keyword=${param.keyword }&college=${param.college }&major=${param.major}&stuClass=${param.stuClass }&pageNum=${page }">${page }</a>
                                        </li>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${pageInfo.hasNextPage}">
                                    <li>
                                        <a href="admin/get/student.html?keyword=${param.keyword }&college=${param.college }&major=${param.major}&stuClass=${param.stuClass }&pageNum=${pageInfo.nextPage }"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="admin/get/student.html?keyword=${param.keyword }&college=${param.college }&major=${param.major}&stuClass=${param.stuClass }&pageNum=${pageInfo.pages }">末页</a>
                                </li>
                                <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${pageInfo.pageNum }页，共${pageInfo.pages }页(共${pageInfo.total }条记录)
								</span>
                            </ul>
                        </nav>
                    </center>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- 学分列表 end -->
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
        // 编辑模态框表单验证
        $('#StuUpdateModal form').bootstrapValidator({
            // 通用提示语
            message: 'This value is not valid',
            // 提示字体图标
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            // enabled 字段值有变化就触发验证 disabled提交之后才触发
            live: 'enabled',
            fields: {
                collegeId: {
                    validators: {
                        notEmpty: {
                            message: '学生的学院信息不能为空'
                        }
                    }
                },
                major: {
                    validators: {
                        notEmpty: {
                            message: '学生的专业信息不能为空'
                        }
                    }
                },
                className: {
                    validators: {
                        notEmpty: {
                            message: '学生的班级信息不能为空'
                        }
                    }
                },
                stuName: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: '学生姓名不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码长度必须在6到16位之间'
                        }
                    }
                }
            }
        });
        // 新增模态框表单验证
        $('#StuAddModal form').bootstrapValidator({
            // 通用提示语
            message: 'This value is not valid',
            // 提示字体图标
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            // enabled 字段值有变化就触发验证 disabled提交之后才触发
            live: 'enabled',
            fields: {
                collegeId: {
                    validators: {
                        notEmpty: {
                            message: '学生的学院信息不能为空'
                        }
                    }
                },
                major: {
                    validators: {
                        notEmpty: {
                            message: '学生的专业信息不能为空'
                        }
                    }
                },
                className: {
                    validators: {
                        notEmpty: {
                            message: '学生的班级信息不能为空'
                        }
                    }
                },
                stuName: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: '学生姓名不能为空'
                        }
                    }
                },
                stuNumber: {
                    threshold: 10,// 输入字符在10个以上发送ajax请求
                    validators: {
                        notEmpty: {
                            message: '学生学号不能为空'
                        },
                        regexp: {
                            regexp: /^\d{10}$/,
                            message: '学号格式错误,必须为10位数字'
                        },
                        remote: {
                            url: "admin/checkStuNumberISExist",
                            message: '学号已存在',
                            delay: '2000',// 每2秒发送一个ajax请求判断是否重复
                            type: 'post'
                        }
                    }
                }
            }
        });
        layui.use('upload', function () {
            var upload = layui.upload;
            var uploadInst = upload.render({
                elem: "#importExcel", // 绑定元素
                url: "admin/insertStuByExcel",// 上传接口
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
    });
    // 给新增按钮绑定单击事件出现模态框
    $("#stu_add_modal_btn").click(function () {
        // 表单重置
        $("#StuAddModal form")[0].reset();
        $('#StuAddModal form').data('bootstrapValidator').resetForm(true);
        $("#StuAddModal").modal({
            backdrop: "static"
        });
    });
    // 新增模态框学院改变后重新加载专业
    $("#StuAddModal select[name='collegeId']").change(function () {
        var collegeCode = $("#StuAddModal select[name='collegeId']").val();
        getMajor(collegeCode, "#StuAddModal select[name='major']", "");
        $("#StuAddModal select[name='className']").empty();
        $("#StuAddModal select[name='className']").append($("<option></option>").val("").text("请选择班级"));
    });
    // 新增模态框专业改变后重新加载班级
    $("#StuAddModal select[name='major']").change(function () {
        var collegeCode = $("#StuAddModal select[name='collegeId']").val();
        var majorCode = $("#StuAddModal select[name='major']").val();
        getClass(collegeCode, majorCode, "#StuAddModal select[name='className']", "");
    });
    // 修改模态框学院改变后重新加载专业
    $("#StuUpdateModal select[name='collegeId']").change(function () {
        var collegeCode = $("#StuUpdateModal select[name='collegeId']").val();
        getMajor(collegeCode, "#StuUpdateModal select[name='major']", "");
        $("#StuUpdateModal select[name='className']").empty();
        $("#StuUpdateModal select[name='className']").append($("<option></option>").val("").text("请选择班级"));
    });
    // 修改模态框专业改变后重新加载班级
    $("#StuUpdateModal select[name='major']").change(function () {
        var collegeCode = $("#StuUpdateModal select[name='collegeId']").val();
        var majorCode = $("#StuUpdateModal select[name='major']").val();
        getClass(collegeCode, majorCode, "#StuUpdateModal select[name='className']", "");
    });
    //普通表单学院改变后重新加载专业
    $("#checkForm select[name='college']").change(function () {
        var collegeCode = $("#checkForm select[name='college']").val();
        getMajor(collegeCode, "#checkForm select[name='major']", "-1");
        $("#checkForm select[name='stuClass']").empty();
        $("#checkForm select[name='stuClass']").append($("<option></option>").val("-1").text("请选择班级"));
    });
    // 普通表单专业改变后重新加载班级
    $("#checkForm select[name='major']").change(function () {
        var collegeCode = $("#checkForm select[name='college']").val();
        var majorCode = $("#checkForm select[name='major']").val();
        getClass(collegeCode, majorCode, "#checkForm select[name='stuClass']", "-1");
    });
    // 获取专业
    function getMajor(collegeCode, ele, DefaultValue) {
        $(ele).empty();
        $(ele).append($("<option></option>").val(DefaultValue).text("请选择专业"));
        $.ajax({
            url: "college/getMajor",
            data: {"collegeId": collegeCode},
            type: "GET",
            success: function (data) {
                $.each(data, function (index, element) {
                    $(ele).append($("<option></option>").val(element).text(element));
                });
            },
            async: false,
            dataType: "json"
        })
    };
    //获取班级
    function getClass(collegeCode, majorCode, ele, DefaultValue) {
        $(ele).empty();
        $(ele).append($("<option></option>").val(DefaultValue).text("请选择班级"));
        $.ajax({
            url: "college/getClass",
            data: {"collegeId": collegeCode, "major": majorCode},
            type: "GET",
            success: function (data) {
                $.each(data, function (index, element) {
                    $(ele).append($("<option></option>").val(element).text(element));
                });
            },
            async: false,
            dataType: "json"
        })
    };
    //获取学生信息的ajax显示在更新模态框中
    function getStu(id) {
        $.ajax({
            url: "admin/toQueryStuInfoById/" + id,
            type: "GET",
            success: function (result) {
                stuDate = result.extend.student;
                $("#StuUpdateModal input[name='id']").val(stuDate.id);
                $("#StuUpdateModal select[name='collegeId']").val([stuDate.collegeId]);
                getMajor(stuDate.collegeId, "#StuUpdateModal select[name='major']");
                $("#StuUpdateModal select[name='major']").val([stuDate.major]);
                getClass(stuDate.collegeId, stuDate.major, "#StuUpdateModal select[name='className']");
                $("#StuUpdateModal select[name='className']").val([stuDate.className]);
                $("#StuUpdateModal input[name='stuNumber']").val(stuDate.stuNumber);
                $("#StuUpdateModal input[name='stuName']").val(stuDate.stuName);
                $("#StuUpdateModal input[name='password']").val(stuDate.password);
                $("#StuUpdateModal input[name='gender']").val([stuDate.gender]);
            },
            async: false,
            dataType: "json"
        });
    }
    // 给编辑按钮绑定单击事件出现模态框
    $(document).on("click", ".edit_btn", function () {
        // 表单重置
        $("#StuUpdateModal form")[0].reset();
        $('#StuUpdateModal form').data('bootstrapValidator').resetForm(true);
        //查出学生信息显示在模态框中
        getStu($(this).attr("edit_id"));
        $("#StuUpdateModal").modal({
            backdrop: "static"
        });
    });
    // 点击编辑模态框中的密码输入框后面的小眼睛将password改为text
    $("#eye").click(function () {
        var flag = $(this).hasClass("glyphicon-eye-open");
        if (flag == true) {
            $("#eye").removeClass("glyphicon-eye-open");
            $("#eye").addClass("glyphicon-eye-close");
            $("#StuUpdateModal input[name='password']").attr("type", "Text");
        } else {
            $("#eye").removeClass("glyphicon-eye-close");
            $("#eye").addClass("glyphicon-eye-open");
            $("#StuUpdateModal input[name='password']").attr("type", "password");
        }
    });
    // 重置登录密码
    $("#resetPwd").click(function () {
        // 将输入框的密码变成学号（大于8位小于16位）
        var initPwd = $("#StuUpdateModal input[name='stuNumber']").val().substr(4, 6);
        $("#StuUpdateModal input[name='password']").val(initPwd);
    })
    //全选与全不选功能
    $("#check_All").click(function () {
        var flag = $(this).prop("checked");
        $(".check_item").prop("checked", flag);
    });
    $(document).on("click", ".check_item", function () {
        //判断当前列表中选中的元素是否是5个
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_All").prop("checked", flag);
    });
    // 表单中删除按钮（单个删除）
    $(document).on("click", ".delete_btn", function () {
        // 获取学生姓名
        var stuName = $(this).parents("tr").find("td:eq(3)").text();
        // 学生学号
        var stuNumbers = $(this).parents("tr").find("td:eq(2)").text();
        // confirm
        layer.confirm("确认删除[" + stuName + "]吗?一经删除相关学生信息将无法恢复", {
            btn: ['确认', '再想想'],
            icon: 0,
            skin: 'layui-layer-molv'
        }, function () {
            $.ajax({
                url: "admin/deleteStu/" + stuNumbers,
                type: "DELETE",
                dataType: 'text',
                success: function (result) {
                    if (result == "删除成功") {
                        layer.msg(result, {icon: 1, time: 2000}, function () {
                            // 页面重新加载分页
                            location.reload();
                        });
                    } else {
                        layer.msg(result, {icon: 2, time: 2000});
                    }
                }
            });
        });
    });
    // 批量删除
    $("#deleteStu__All_Btn").click(function () {
        var stuNames = "";
        var stuNumbers = "";
        $.each($(".check_item:checked"), function () {
            stuNames += $(this).parents("tr").find("td:eq(3)").text() + ",";
            stuNumbers += $(this).parents("tr").find("td:eq(2)").text() + "-";
        });
        //去除末尾多余的符号
        stuNames = stuNames.substring(0, stuNames.length - 1);
        stuNumbers = stuNumbers.substring(0, stuNumbers.length - 1);
        if (stuNumbers == "") {
            layer.alert("请选择需要删除的学生!", {icon: 2});
            return false;
        }
        layer.confirm("确认删除[" + stuNames + "]吗?一经删除相关学生信息将无法恢复", {
            btn: ['确认', '再想想'],
            icon: 0,
            skin: 'layui-layer-molv',
            title: '提示'
        }, function () {
            $.ajax({
                url: "admin/deleteStu/" + stuNumbers,
                type: "DELETE",
                success: function (result) {
                    if (result == "删除成功") {
                        layer.msg(result, {icon: 1, time: 2000}, function () {
                            // 页面重新加载分页
                            location.reload();
                        });
                    } else {
                        layer.msg("操作失败", {icon: 2, time: 2000});
                    }
                }, error: function () {
                    layer.msg("服务器繁忙");
                }
            });
        });
    });
</script>