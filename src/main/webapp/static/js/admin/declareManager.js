// 给审核按钮添加样式
var arr = $("button[name='state']");
$.each(arr, function () {
    if ($(this).val() == "已通过") {
        $(this).addClass("btn-success");
    } else if ($(this).val() == "未审核") {
        $(this).addClass("btn-primary");
    } else {
        $(this).addClass("btn-warning");
    }
})

// 学院改变后重新加载专业
$(".form-inline select[name='college']").change(function () {
    var collegeCode = $(".form-inline select[name='college']").val();
    getMajor(collegeCode);
});
// 专业改变后重新加载班级
$(".form-inline select[name='major']").change(function () {
    var collegeCode = $(".form-inline select[name='college']").val();
    var majorCode = $(".form-inline select[name='major']").val();
    getClass(collegeCode, majorCode);
});
// 学院改变后重新加载专业
$(".form-horizontal select[name='college']").change(function () {
    var collegeCode = $(".form-horizontal select[name='college']").val();
    getMajor(collegeCode);
});
// 专业改变后重新加载班级
$(".form-horizontal select[name='major']").change(function () {
    var collegeCode = $(".form-horizontal select[name='college']").val();
    var majorCode = $(".form-horizontal select[name='major']").val();
    getClass(collegeCode, majorCode);
});

// 获取专业
function getMajor(collegeCode) {
    $("select[name='major']").empty();
    $("select[name='major']").append($("<option></option>").val("-1").text("请选择专业"));
    // ajax请求所有专业
    $.get("college/getMajor", {
        "collegeId": collegeCode
    }, function (data) {
        $.each(data, function (index, element) {
            $("select[name='major']").append($("<option></option>").val(element).text(element));
        });
    }, 'json');
};

//获取班级
function getClass(collegeCode, majorCode) {
    $("select[name='stuClass']").empty();
    $("select[name='stuClass']").append($("<option></option>").val("-1").text("请选择班级"));
    // ajax请求所有班级
    $.get("college/getClass", {
        "collegeId": collegeCode,
        "major": majorCode
    }, function (data) {
        $.each(data, function (index, element) {
            $("select[name='stuClass']").append($("<option></option>").val(element).text(element));
        });
    }, 'json');
};

// 重置新增员工表单的方法
function reset_form(ele) {
    // 重置表单内容
    $(ele)[0].reset();
}

// 给导出按钮绑定单击事件出现模态框
$("#exportData").click(function () {
    // 每次出现模态框都将之前的信息给清空并且将表单样式也清空
    reset_form("#exportStuRecord form");
    // 设置点网页背景不会关闭模态框
    $("#exportStuRecord").modal({
        backdrop: "static"
    });
});

//显示申报图片
$(document).on("click", ".apply-btn", function () {
    $(this).popover({
        trigger: 'click',
        html: true,
        content: function () {
            var url = $(this).attr("url");
            var $div = $("<div style='width: 500px; height:300px;'></div>");
            var $img = $("<img style='width: 500px; height:300px;'/>");
            $img.attr("src", url);
            $img.appendTo($div);
            return $div;
        }
    });
})