$(function () {

    getColleges("#college");

    to_page(1);
});

//点击新增按钮时弹出模态框
$("#add_teacher_btn").click(function () {

    //表单重置 表单的数据及样式
    reset_form("#teacherAddModal form");

    //发送ajax请求，查出部门信息显示下拉列表
    getColleges("#teacherAddModal select");

    $("#teacherAddModal").modal({
        //设置点击背景模态框不会消失
        backdrop: "static"
    })

});

//校验教师账号是否已经存在
$("#teacherNumber_add_input").change(function () {

    //拿到教工账号
    var teacherNumber = this.value;

    $.ajax({
        url: "/teacher/checkTeacher",
        data: "teaNumber=" + teacherNumber,
        type: "POST",
        success: function (result) {
            if (result.code == 100) {
                show_validate_msg("#teacherNumber_add_input", "success", "教师账号可用");
                $("#teacher_save_btn").attr("ajax-va", "success");
            } else {
                show_validate_msg("#teacherNumber_add_input", "error", result.extend.msg);
                $("#teacher_save_btn").attr("ajax-va", "error");
            }
        }
    })

});

//校验添加时表单的数据
function validate_add_form() {

    //1.校验工号
    var teacherNumber = $("#teacherNumber_add_input").val();
    //定义正则表达式
    var regTeacherNumber = /^[0-9]{5,}/;
    //校验
    if (!regTeacherNumber.test(teacherNumber)) {
        show_validate_msg("#teacherNumber_add_input", "error", "教师工号格式不正确");
        return false;
    } else {
        show_validate_msg("#teacherNumber_add_input", "success", "")
    }

    //2.校验姓名是否为空输入
    if ($("#teacherNumber_add_input").val().trim() == "") {
        alert("教师姓名不能为空!");
        return false;
    }

    //3.校验是否选择学院
    if ($("#teacherAddModal select").val() == -1) {
        alert("请选择学院!");
        return false;
    }

    return true;
}

//保存教师
$("#teacher_save_btn").click(function () {

    //1.校验表单数据
    if (!validate_add_form()) {
        return false;
    }

    //2.判断教工号是否存在
    if ($(this).attr("ajax-va") == "error") {
        return false;
    }

    //3.发送ajax请求保存教师信息
    $.ajax({
        url: "/teacher/insertTeacher",
        type: "POST",
        data: $("#teacherAddModal form").serialize(),
        success: function (result) {

            if (result.code == 100) {   //成功
                //隐藏模态框
                $("#teacherAddModal").modal('hide');
                //去到最后一页
                to_page(totalPage);
            }

        }, error: function () {
            alert("服务器繁忙!");
        }
    })

});

//给删除按钮绑定删除时间并删除教师信息
$(document).on("click", ".delete-btn", function () {

    //1.弹出会话框进行确认
    var teacherName = $(this).parent("tr").find("td:eq(2)").text();

    var teacherId = $(this).attr("del-id");

    if (confirm("确认删除" + teacherName + "吗?")) {
        $.ajax({
            url: "/teacher/deleteTeacher/" + teacherId,
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

//给修改信息绑定单击事件
$(document).on("click", ".edit-btn", function () {

    //1.查出部门信息并显示部门列表
    getColleges("#teacherUpdateModal select");
    //2.查出员工信息并显示员工列表
    getTeacher($(this).attr("edit-id"));

    //3.把员工id传给模态框的更新按钮
    $("#teacher_update_btn").attr("edit-id", $(this).attr("edit-id"));

    $("#teacherUpdateModal").modal({
        backdrop: "static"
    });
});

//校验修改信息时的表单
function validat_update_form() {

    //1.校验姓名是否为空输入
    if ($("#teacherName_update_input").val().trim() == "") {
        alert("教师姓名不能为空!");
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

    //4.校验是否选择学院
    if ($("#teacherUpdateModal select").val() == -1) {
        alert("请选择学院!");
        return false;
    }

    return true;
}

//修改教师信息
$("#teacher_update_btn").click(function () {

    //1.校验表单数据
    if (!validat_update_form()) {
        return false;
    }

    //2.验证教工账号是否可用
    if ($(this).attr("ajax-va") == "error") {
        return false;
    }

    //3.发送ajax请求保存更新的教师信息
    $.ajax({
        url: "/teacher/updateTeacher/" + $(this).attr("edit-id"),
        type: "PUT",
        data: $("#teacherUpdateModal form").serialize(),
        success: function () {

            //1.关闭对话框
            $("#teacherUpdateModal").modal("hide");
            //2.回到本页面
            if ($("#college").val() == -1 && $("#keywords").val().trim() == "") {
                to_page(currentPage);
            } else {
                to_page_condition(currentPage);
            }
        }, error: function () {
            alert("服务器繁忙!");
        }
    })

});

//获取单个教师的信息
function getTeacher(id) {

    $.ajax({
        url: "/teacher/getTeacher/" + id,
        type: "GET",
        success: function (result) {

            var teacher = result.extend.teacherInfo;
            //工号
            $("#teacherNumber_update_input").val(teacher.teaNumber);
            //姓名
            $("#teacherName_update_input").val(teacher.teaName);
            //密码
            $("#password_update_input").val(teacher.password);
            //性别
            $("#teacherUpdateModal input[name=gender]").val([teacher.gender]);
            //职称
            $("#teacherPosition_update_input").val(teacher.teaPositon == "");
            //手机号
            $("#teacherPhone_update_input").val(teacher.phone);
            //邮箱
            $("#teacherEmail_update_input").val(teacher.email);
            //学院
            $("#teacherUpdateModal select").val([teacher.collegeId]).attr("selected", true);

        }
    })
}


//去到第几页
function to_page(pn) {

    $.ajax({
        url: "/teacher/teachers",
        data: {
            "pn": pn
        },
        type: "GET",
        success: function (result) {
            if (result.code == 100) {   //查询成功

                //1.构教师管理表格信息
                build_teacher_table(result);
                //2.解析分页条信息
                build_page_nav(result);
                //3.解析分页信息
                build_page_info(result);

            } else if (result.code == 200) {     //查询失败
                //清空table表格样式
                $("#teacher_info tbody").empty();
                //清空分页条信息
                $("#page_nav_area").empty();
                //清空分页信息
                $("#page_info_area").empty();

                $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#teacher_info tbody");
            }
        }, error: function () {
            alert("服务器繁忙!");
        }
    })
}

//条件查询+模糊查询
function to_page_condition(pn) {

    $.ajax({
        url: "/teacher/searchTeachers",
        data: {
            "pn": pn,
            "collegeId": $("#college").val(),
            "keywords": $("#keywords").val()
        },
        success: function (result) {

            if (result.code == 100) {   //查询出了数据
                //1.构建教师信息表格
                build_teacher_table(result);
                //2.构建分页条
                build_page_nav_condition(result);
                //3.构建分页信息
                build_page_info(result);
            } else {
                //清空table表格样式
                $("#teacher_info tbody").empty();
                //清空分页信息
                $("#page_info_area").empty();
                //清空分页导航栏
                $("#page_nav_area").empty();

                $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#teacher_info tbody");
            }

        }, error: function () {
            alert("服务器繁忙!");
        }
    })
}

//构建教师管理表格
function build_teacher_table(result) {

    //清空原有数据和样式
    $("#teacher_info tbody").empty();

    //拿到查询到的教师信息
    var teachersInfo = result.extend.pageInfo;
    //遍历数据
    $.each(teachersInfo.list, function (index, item) {

        //序号
        var teaCount = $("<td></td>").append(index + 1 + (teachersInfo.pageNum - 1) * 5);

        //工号
        var teaNumber = $("<td></td>").append(item.teaNumber);

        //姓名
        var teaName = $("<td></td>").append(item.teaName);

        //院系
        var teaCollege = $("<td></td>").append(item.college.name);

        //职称
        var teaPostion = $("<td></td>").append(item.teaPositon == "" ? "无" : item.teaPositon);

        //编辑按钮
        var editBtn = $("<a>编辑</a>").addClass("btn btn-primary btn-2x edit-btn");
        editBtn.attr("edit-id", item.id);

        //删除按钮
        var delBtn = $("<a style='margin-left:5px;'>删除</a>").addClass("btn btn-danger btn-2x delete-btn");
        delBtn.attr("del-id", item.id);

        //操作按钮
        var operateBtn = $("<td></td>").append(editBtn).append(delBtn);

        $("<tr></tr>").append(teaCount)
            .append(teaNumber)
            .append(teaName)
            .append(teaCollege)
            .append(teaPostion)
            .append(operateBtn)
            .appendTo("#teacher_info tbody");
    })

}

//获取学院
function getColleges(sel) {
    //清空下拉框样式及内容
    $(sel).empty();
    $.ajax({
        url: "/college/getColleges",
        type: "GET",
        success: function (result) {

            $("<option></option>").append("请选择").attr("value", -1).attr("selected", true).appendTo(sel);
            // 显示学院信息在下拉列表中
            $.each(result.extend.colleges, function () {
                if (this.id != 19) {
                    var option = $("<option></option>").append(this.name).attr("value", this.id);
                    option.appendTo(sel);
                }

            });
        },
        error: function () {
            alert("服务器繁忙")
        }
    })
}
