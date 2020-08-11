<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新学分系统</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>
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
                    <div class="logo"><img src="static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="student/stuIndex">首页</a></li>
                    <li><a href="student/updateInfo/${student.id }">个人信息</a></li>
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
                    <li><a href="student/viewCredit">学分列表</a></li>
                    <li><a href="student/applyCredit/${student.id }">学分申报</a></li>
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="student/updateInfo/${student.id }">修改信息</a></li>
                    <li><a href="student/updatepwd/${student.id }">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form class="form-horizontal" id="updatePwdForm" action="student/updateStuPassword">
                        <input type="hidden" name="stuNumber" value="${student.stuNumber }">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">原密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="oldPassword" placeholder="请输入您的原有密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">新密码</label>
                            <div class="col-lg-5">
                                <div class="input-group">
                                <span class="input-group-addon">
                                <i class="glyphicon glyphicon-eye-open" id="eye"></i>
                                </span>
                                    <input type="password" class="form-control" name="newPassword"
                                           placeholder="请输入您的新密码"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">确认密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="confirmPassword"
                                       placeholder="请输入确认密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" id="submitBtn"><i
                                        class="glyphicon glyphicon-ok"></i>提交修改
                                </button>
                                <button type="button" class="btn btn-info" id="resetBtn"><i
                                        class="glyphicon glyphicon-refresh"></i>重置输入
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- 修改密码 end -->
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
        $('#updatePwdForm').bootstrapValidator({
            // 通用提示语
            message: 'This value is not valid',
            // 提示字体图标
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            // enabled 字段值有变化就触发验证 disabled提交之后才触发
            live: 'disabled提交之后才触发',
            submitButtons: '#submitBtn',

            fields: {
                oldPassword: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '请填写原有密码'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码长度必须在6到16位之间'
                        },
                        different: {
                            field: 'newPassword',
                            message: '原有密码不能和新密码相同'
                        }
                    }
                },
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                        identical: {
                            field: 'confirmPassword',
                            message: '新密码和确认密码不相同'
                        },
                        different: {
                            field: 'oldPassword',
                            message: '新密码不能和原有密码相同'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '请输入确认密码'
                        },
                        identical: {
                            field: 'newPassword',
                            message: '确认密码和新密码不相同'
                        },
                        different: {
                            field: 'oldPassword',
                            message: '确认密码不能和原有密码相同'
                        }
                    }
                }
            },
            //submitHandler: function(validator, form, submitButton) {
            //validator: 表单验证实例对象
            //form  jq对象  指定表单对象
            //submitButton  jq对象  指定提交按钮的对象
            submitHandler: function (validator, form, submitButton) {
                var flag = $("#updatePwdForm").data("bootstrapValidator").isValid();
                if (flag) {
                    $.ajax({
                        type: "POST",
                        async: true,
                        data: $('#updatePwdForm').serialize(),
                        url: $('#updatePwdForm').attr("action"),
                        success: function (data) {
                            if (data == "修改密码成功，您将返回登录页面") {
                                layer.msg(data, {time: 2000, icon: 1}, function () {
                                    window.location.replace("/login.jsp");
                                });
                            } else {
                                layer.msg(data, {time: 2000, icon: 2});
                                // 清空验证框信息
                                $('#updatePwdForm').data('bootstrapValidator').resetForm(true);
                            }
                        },
                        error: function () {
                            layer.alert("服务器繁忙,请稍后操作")
                        }
                    });
                } else {
                    $("#updatePwdForm button[type=submit]").prop("disabled", disabled);
                }
            }
        });
    });

    // 重置表单
    $('#resetBtn').click(function () {
        $('#updatePwdForm').data('bootstrapValidator').resetForm(true);
    });

    // 点击密码输入框后面的小眼睛将password改为text
    $("#eye").click(function () {
        var flag = $(this).hasClass("glyphicon-eye-open");
        if (flag == true) {
            $("#eye").removeClass("glyphicon-eye-open");
            $("#eye").addClass("glyphicon-eye-close");
            $("#updatePwdForm input[name='newPassword']").attr("type", "Text");
        } else {
            $("#eye").removeClass("glyphicon-eye-close");
            $("#eye").addClass("glyphicon-eye-open");
            $("#updatePwdForm input[name='newPassword']").attr("type", "password");
        }
    });
</script>