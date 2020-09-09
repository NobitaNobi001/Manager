<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/studentHeader.jsp"%>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form class="form-horizontal" id="updatePwdForm" action="student/updateStuPassword.html">
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
    </div>
</main>
<%@include file="/WEB-INF/common/studentFooter.jsp"%>
</body>
</html>
<script type="text/javascript">
    $(function () {
        var layer=null;
        layui.use('layer', function(){
            layer = layui.layer;
        });
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
            live: 'disabled',
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
                            max: 18,
                            message: '密码长度必须在6到18位之间'
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
                        dataType: 'json',
                        success: function (data) {
                            if (data.code==100) {
                                layer.msg(data.extend.result, {time: 2000, icon: 1}, function () {
                                    window.location.replace("/login.jsp");
                                });
                            } else {
                                layer.msg(data.extend.result, {time: 2000, icon: 2});
                                // 清空验证框信息
                                $('#updatePwdForm').data('bootstrapValidator').resetForm(true);
                            }
                        },
                        error: function () {
                            layer.alert("网络超时,请稍后再试")
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