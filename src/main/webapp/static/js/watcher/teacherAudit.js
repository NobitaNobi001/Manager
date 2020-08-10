$(function () {

    //去到查询数据的第一页
    to_page(1);
});

function to_page(pn) {

    $.ajax({
        url: "record/auditInfo",
        data: {
            "pn": pn,
            "collegeId": $('#college').val()
        },
        type: "GET",
        success: function (result) {
            if (result.code == 100) {   //返回成功
                //1.构建申报管理表格
                build_declare_table(result);
                //2.解析分页条信息
                build_page_nav(result);
                //3.解析分页信息
                build_page_info(result);
            } else if (result.code == 200) {

                //清空table表格样式
                $("#stuDeclare tbody").empty();
                //清空分页条数据
                $("#page_nav_area").empty();
                //清空分页信息
                $("#page_info_area").empty();

                $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#stuDeclare tbody");
            }

        }, error: function () {
            alert("服务器繁忙!");
        }
    });
}

function build_declare_table(result) {
    //清空table表格样式
    $("#stuDeclare tbody").empty();
    //拿到后台返回的数据
    var stuRecordInfo = result.extend.pageInfo;
    //遍历数据
    $.each(stuRecordInfo.list, function (index, item) {

        //序号
        var stuCount = $("<td></td>").append(index + 1 + (stuRecordInfo.pageNum - 1) * 5);
        //学号
        var stuNumber = $("<td></td>").append(item.stuNumber);
        //姓名
        var stuName = $("<td></td>").append(item.stuName);
        //申报类别
        var applySort = $("<td></td>").append(item.sort);
        //申报名称
        var applyName = $("<td></td>").append(item.applyName);
        //申报学分
        var applyCredit = $("<td></td>").append(item.applyCredit);
        //申报材料
        var applyBtn = $("<td></td>").append($("<a></a>").addClass("btn btn-default apply-btn").attr("apply-id", item.id)
            .attr("tabindex", 0).attr("role", "button").attr("data-toggle", "popover").attr("data-placement", "top")
            .append("查看").attr("url", "applyImg/" + item.picture));
        //审核学分
        var auditCredit = $("<td></td>").append(item.auditCredit);
        //审核教师
        var auditTea = $("<td></td>").append(item.auditTea == null ? "无" : item.auditTea);

        //审核状态
        var auditState = $("<td></td>").append($("<a></a>").addClass("btn btn-success btn-2x").append(item.auditState));

        $("<tr></tr>").append(stuCount)
            .append(stuNumber)
            .append(stuName)
            .append(applySort)
            .append(applyName)
            .append(applyCredit)
            .append(applyBtn)
            .append(auditCredit)
            .append(auditTea)
            .append(auditState)
            .appendTo("#stuDeclare tbody");

    });
}

//查看图片时弹出图片进行查看 双击打开+单击关闭
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
});