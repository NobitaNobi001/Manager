//清空表单的信息
function reset_form(ele) {
    $(ele)[0].reset();
    //清空表单样式
    $(ele).find("*").removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
}

//添加校验提示信息
function show_validate_msg(ele, status, msg) {
    //清空当前元素的校验状态
    $(ele).parent().removeClass("has-success has-error");

    $(ele).next("span").text("");

    if ("success" == status) {

        $(ele).parent().addClass("has-success");

        $(ele).next("span").text(msg);
    } else if ("error" == status) {

        $(ele).parent().addClass("has-error");

        $(ele).next("span").text(msg);
    }
}