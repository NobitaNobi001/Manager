$(function () {
    //性别的checked选中
    var gender = '${student.gender }';
    if ($("#male").val() == gender) {
        $("#male").prop("checked", "checked");
    } else {
        $("#female").prop("checked", "checked");
    }


    $('#credit form').bootstrapValidator({
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
        fields: {
            phone: {
                validators: {
                    digits: {
                        message: '手机号码只能输入数字'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '手机号只支持支持11位数'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '邮箱地址格式错误'
                    }
                }
            }
        }
    });
});