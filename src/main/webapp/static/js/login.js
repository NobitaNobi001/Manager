
$(function () {
    $('.login-form form').bootstrapValidator({
        // 通用提示语
        message: 'This value is not valid',
        // 提示字体图标
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        live: 'disabled',
        fields: {
            stuNumber: {
                validators: {
                    notEmpty: {
                        message: '登录账号不能为空'
                    },
                    regexp: {
                        regexp: /^\d{4,11}$/,
                        message: '账号格式错误'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '登录密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 18,
                        message: '密码输入错误'
                    }
                }
            }
        }
    });
});

//显示密码
$("#eye").click(function () {
    var flag = $(this).hasClass("glyphicon-eye-open");
    if (flag) {
        $("#eye").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
        $("form input[name='password']").attr("type", "Text");
    } else {
        $("#eye").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
        $("form input[name='password']").attr("type", "password");
    }
});