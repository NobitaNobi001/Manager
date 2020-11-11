function check() {

    if (!validate_stuNumber()) {
        return false;
    }

    if (!validate_password()) {
        return false;
    }

    $('.login-form form').attr("action", "user/login");

}


//验证密码
function validate_password() {

    var password = $("input[name='password']").val();

    if (password.trim() == "") {
        alert("密码不能为空!");
        return false;
    }

    if (password.trim().length < 5 || password.trim().length > 16) {
        alert("密码格式输入错误!");
        return false;
    }

    return true;

}

//验证学号
function validate_stuNumber() {

    var stuNumber = $("input[name='stuNumber']").val();

    if (stuNumber.trim() == "") {
        alert("账号不能为空!");
        return false;
    }

    var reg = /^[0-9]{5,10}/;

    if (!reg.test(stuNumber)) {
        alert("账号格式不正确");
        return false;
    }

    return true;

}

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
