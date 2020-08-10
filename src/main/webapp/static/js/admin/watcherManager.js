//页面初始化
$(function () {

    to_page(1);
});

//新增督察按钮
$("#add_watcher_btn").click(function () {

    //1.表单重置 表单的数据及样式
    reset_form("#watcherAddModal form");

    //3.设置点击背景模态框不会消失
    $("#watcherAddModal").modal({
        backdrop: "static"
    })
});

//校验添加督察账号是否可用
$("#watcherNumber_add_input").change(function () {

    var watcherNumber = this.value;

    $.ajax({
        url: "watcher/checkWatcher",
        type: "POST",
        data: "watcherNumber=" + watcherNumber,
        success: function (result) {
            if (result.code == 100) {
                show_validate_msg("#watcherNumber_add_input", "success", "督察账号可用");
                $("#watcher_save_btn").attr("ajax-va", "success");
            } else {
                show_validate_msg("#watcherNumber_add_input", "error", result.extend.msg);
                $("#watcher_save_btn").attr("ajax-va", "error");
            }
        }
    })
});

//校验添加督察时表单的数据
function validate_add_form() {

    //1.校验工号格式
    var watcherNumber = $("#watcherNumber_add_input").val();
    //定义正则表达式
    var regWatcherNumber = /^[0-9]{5,}$/;
    //校验
    if (!regWatcherNumber.test(watcherNumber)) {
        show_validate_msg("#watcherNumber_add_input", "error", "督察工号格式不正确");
        return false;
    } else {
        show_validate_msg("#watcherNumber_add_input", "success", "")
    }

    //2.校验姓名是否为空输入
    if ($("#watcherName_add_input").val().trim() == "") {
        alert("督察姓名不能为空!");
        return false;
    }

    //3.校验是否选择学院
    if ($("#watcherAddModal select").val() == -1) {
        alert("请选择学院!");
        return false;
    }

    return true;
}

//添加督察
$("#watcher_save_btn").click(function () {

    //1.校验表单数据
    if (!validate_add_form()) {
        return false;
    }

    //2.判断之前的ajax用户名检验是否成功
    if ($(this).attr("ajax-va") == "error") {
        return false;
    }

    //3.发送ajax请求
    $.ajax({
        url: "watcher/insertWatcher",
        type: "POST",
        data: $("#watcherAddModal form").serialize(),
        success: function (result) {
            if (result.code == 100) {    //保存成功

                //隐藏模态框
                $("#watcherAddModal").modal('hide');

                //去到最后一页
                to_page(totalPage);
            }
        }, error: function () {
            alert("服务器繁忙!");

        }
    });
});

//给删除按钮绑定单击事件并执行删除督察信息
$(document).on("click", ".delete-btn", function () {
    //1.弹出对话框进行确认
    var watcherName = $(this).parents("tr").find("td:eq(2)").text();

    var watcherId = $(this).attr("del-id");

    if (confirm("确认删除" + watcherName + "吗？")) {
        //2.发送ajax请求
        $.ajax({
            url: "watcher/deleteWatcher/" + watcherId,
            type: "DELETE",
            success: function () {
                //回到本页
                if ($("#college").val() == -1 && $("#keywords").val().trim() == "") {

                    to_page(1);
                } else {
                    to_page_condition(1);
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        })
    }
});

//修改按钮绑定单击事件
$(document).on("click", ".edit-btn", function () {

    //1.查出部门信息并显示部门列表
    // getColleges("#watcherUpdateModal select");
    //2.查出员工信息并显示员工列表
    getWacther($(this).attr("edit-id"));

    //3.把员工id传给模态框的更新按钮
    $("#watcher_update_btn").attr("edit-id", $(this).attr("edit-id"));
    //4.弹出模态框
    $("#watcherUpdateModal").modal({
        backdrop: "static"
    });
});

//校验修改信息时的督察信息
function validat_update_form() {

    //1.校验姓名是否为空输入
    if ($("#watcherName_update_input").val().trim() == "") {
        alert("督察姓名不能为空!");
        return false;
    }

    // 2.校验邮箱
    var email = $("#email_update_input").val();
    //定义正则表达式
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (regEmail.test(email) || email.trim() == "") {
        show_validate_msg("#email_update_input", "success", "");
    } else {
        show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
        return false;
    }

    //3.校验手机号
    var phone = $("#phone_update_input").val();
    //定义正则表达式
    var regPhone = /^[1][0-9]{10}/;
    if (regPhone.test(phone) || phone.trim() == "") {
        show_validate_msg("#phone_update_input", "success", "");
    } else {
        show_validate_msg("#phone_update_input", "error", "手机号格式不正确");
        return false;
    }

    //4.是否选择学院
    if ($("#watcherUpdateModal select").val() == -1) {
        alert("请选择学院!");
        return false;
    }
    return true;
}

//修改督察信息
$("#watcher_update_btn").click(function () {

    //1.验证表单格式
    if (!validat_update_form()) {
        return false;
    }

    //2.验证督察账号是否可用
    if ($(this).attr("ajax-va") == "error") {
        return false;
    }

    //3.发送ajax请求保存更新的员工信息
    $.ajax({
        url: "watcher/updateWatcher/" + $(this).attr("edit-id"),
        type: "PUT",
        data: $("#watcherUpdateModal form").serialize(),
        success: function () {

            //1.关闭对话框
            $("#watcherUpdateModal").modal("hide");
            //2.回到本页面
            if ($("#college").val() == -1 && $("#keywords").val().trim() == "") {
                to_page(currentPage);
            } else {
                to_page_condition(currentPage);
            }


        }, error: function () {
            alert("服务器繁忙!");
        }
    });
});

//根据id查找督察信息
function getWacther(id) {

    $.ajax({
        url: "watcher/getWatcher/" + id,
        type: "GET",
        success: function (result) {
            //获取到此督察信息
            var watcher = result.extend.watcherInfo;
            //工号
            $("#watcherNumber_update_input").val(watcher.watcherNumber);
            //姓名
            $("#watcherName_update_input").val(watcher.watcherName);
            //性别
            $("#watcherUpdateModal input[name=gender]").val([watcher.gender]);
            //密码
            $("#password_update_input").val(watcher.password);
            //邮箱
            $("#email_update_input").val(watcher.email);
            //手机号
            $("#phone_update_input").val(watcher.phone);
            //学院
            $("#watcherUpdateModal select").val([watcher.collegeId]).attr("selected", true);
        }, error: function () {
            alert("服务器繁忙!");
        }
    })
}

//构建督察信息列表
function build_watcher_table(result) {
    //清空原有数据和样式
    $("#watcher_info tbody").empty();
    //拿到后台返回的数据
    var watchersInfo = result.extend.pageInfo;
    //遍历添加数据到table中
    $.each(watchersInfo.list, function (index, item) {

        //选择框
        var checkItem = $("<td></td>").append("<input type='checkbox' class='check-item'/>");
        //序号
        var watcherCount = $("<td></td>").append(index + 1 + (watchersInfo.pageNum == 0 ? watchersInfo.pageNum : watchersInfo.pageNum - 1) * 5);
        //督察工号
        var watcherNumber = $("<td></td>").append(item.watcherNumber);
        //督察姓名
        var watcherName = $("<td></td>").append(item.watcherName);
        //督察院系
        var college = $("<td></td>").append(item.college.name);

        //编辑按钮
        var editBtn = $("<a>编辑</a>").addClass("btn btn-primary btn-2x edit-btn");
        editBtn.attr("edit-id", item.id);

        //删除按钮
        var delBtn = $("<a style='margin-left:5px;'>删除</a>").addClass("btn btn-danger btn-2x delete-btn");
        delBtn.attr("del-id", item.id);

        //操作按钮
        var operateBtn = $("<td></td>").append(editBtn).append(delBtn);

        $("<tr></tr>")
            .append(checkItem)
            .append(watcherCount)
            .append(watcherNumber)
            .append(watcherName)
            .append(college)
            .append(operateBtn)
            .appendTo("#watcher_info tbody");
    });
}

//查询所有信息去到第几页
function to_page(pn) {

    $.ajax({
        url: "watcher/watchers",
        data: {
            "pn": pn,
        },
        type: "GET",
        success: function (result) {

            if (result.code == 100) {   //查询成功

                //1.构建督察管理表格
                build_watcher_table(result);
                //2.解析分页条信息
                build_page_nav(result);
                //3.解析分页信息
                build_page_info(result);

            } else if (result.code == 200) {     //查询失败
                //清空table表格样式
                $("#watcher_info tbody").empty();
                //清空分页信息
                $("#page_info_area").empty();
                //清空分页导航栏
                $("#page_nav_area").empty();

                $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#watcher_info tbody");
            }
        }
    })
}

//条件查询+模糊查询
function to_page_condition(pn) {

    $.ajax({
        url: "watcher/searchWatchers",
        data: {
            "pn": pn,
            "collegeId": $("#college").val(),
            "keywords": $("#keywords").val().trim()
        },
        type: "GET",
        success: function (result) {

            if (result.code == 100) {   //查询成功

                //1.构建督察管理表格
                build_watcher_table(result);
                //2.解析分页条信息
                build_page_nav_condition(result);
                //3.解析分页信息
                build_page_info(result);

            } else if (result.code == 200) {     //查询失败
                //清空table表格样式
                $("#watcher_info tbody").empty();
                //清空分页信息
                $("#page_info_area").empty();
                //清空分页导航栏
                $("#page_nav_area").empty();

                $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#watcher_info tbody");
            }
        }
    })
}

//全选
$("#checkAllWatchers").click(function () {
    $(".check-item").prop("checked", $(this).prop("checked"));
});

$("#batch_del_watcher").click(function () {

    var watcherNames = "";
    var watcherIds = "";

    $.each($(".check-item:checked"), function () {
        watcherNames += $(this).parents("tr").find("td:eq(3)").text() + ",";
        watcherIds += $(this).parents("tr").find("td:eq(5) a").attr("edit-id") + "-";
        console.log(watcherIds);
    });

    if(watcherNames=""||watcherIds==""){
        alert("请选择需要删除的督察!");
        return false;
    }


    watcherNames = watcherIds.substring(0, watcherNames.length - 1);
    watcherIds = watcherIds.substring(0, watcherIds.length - 1);

    if (confirm("确认删除" + watcherNames + "吗？")) {
        $.ajax({
            url: "watcher/deleteWatcher/" + watcherIds,
            type: "DELETE",
            success: function () {

                $("#checkAllWatchers").prop("checked", false);

                //回到本页面
                if ($("#college").val() == -1 && $("#keywords").val().trim() == "") {
                    to_page(currentPage);
                } else {
                    to_page_condition(currentPage);
                }
            }, error: function () {
                alert("服务器繁忙!");
            }
        })
    }
});