
//校验用户名
function checkuser() {
    var check = false;
    var Number = document.getElementById("Number").value;
    Number = Number.trim();
    if (Number == "") {//学号为空
        document.getElementById("checktext").innerText = "请您输入学号";
        check = false;
    } else {
        var reg = /^\d+$|^\d+[.]?\d+$/;
        if (reg.test(Number)) {//学号不为空，正则表达式也正常
            check = true;
        } else {//学号不为空但输入格式错误,只能输入数字
            document.getElementById("checktext").innerText = "用户名格式有误";
            check = false;
        }
    }
    return check;
}

//校验密码
function checkpwd() {
    var check = false;
    var password = document.getElementById("password").value;
    password = password.trim();
    if (password == "" || password.length == 0) {//密码为空
        document.getElementById("checktext").innerText = "请您输入密码";
        check = false;
    } else {
        check = true;
    }
    return check;
}

//校验用户名和密码
function check() {
    var check = checkuser() && checkpwd();
    return check;
}

//显示密码
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