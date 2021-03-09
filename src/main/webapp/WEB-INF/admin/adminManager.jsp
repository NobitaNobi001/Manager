<%--
  二级学院管理员管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/manager.css"/>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" media="all">

    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }
    </style>

    <%--引入jQuery文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/layui/layui.js"></script>
</head>
<body>

<%--管理员修改的模态框--%>
<div class="modal fade" id="AdminUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="adminNumber_update_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="AdminNumber" class="form-control" id="adminNumber_update_input"
                                   readonly/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="adminName_update_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="adminName" class="form-control" id="adminName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password_update_input" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="password_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男"
                                       checked="checked"/>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女"/>女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control"
                                   id="email_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone_update_input" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control"
                                   id="phone_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <%--部门提交id即可--%>
                            <select class="form-control" name="collegeId">
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <option value="${college.id }">${college.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="admin_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--管理员添加的模态框--%>
<div class="modal fade" id="adminAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增管理员</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="adminNumber_add_input" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" name="adminNumber" class="form-control" id="adminNumber_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="adminName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="adminName" class="form-control" id="adminName_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"/>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"/>女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学院</label>
                        <div class="col-sm-4">
                            <%--部门提交id即可--%>
                            <select class="form-control" name="collegeId">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <option value="${college.id }">${college.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="admin_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px;"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="admin/admProfile">${admin.adminName}(${admin.adminNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<main>
    <div id="main">
        <div class="main clear">
            <div class="main-left left">
                <ul>
                    <li class="headline"><a href="javascript:;">控制中心</a></li>
                    <li><a href="admin/toSee/studentRecord.html">申报管理</a></li>
                    <li><a href="admin/get/student.html">学生管理</a></li>
                    <li><a href="admin/teaManager">教师管理</a></li>
                    <li><a href="admin/watManager">督查管理</a></li>
                    <li><a href="admin/admManager">学院管理</a></li>
                    <li><a href="admin/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                    <li><a href="admin/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="student">
                    <h4>学院管理</h4>
                    <div class="action" style="float: left;">
                        <div style="float: left;">
                            <select name="college" id="college">
                                <option value="-1">请选择院系</option>
                                <c:forEach items="${applicationScope.colleges }" var="college">
                                    <c:if test="${college.id ne 19}">
                                        <option value="${college.id }">${college.name }</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入管理员姓名" value=""/>
                            <button onclick="to_page_condition(1)" class="btn btn-primary">搜索</button>
                        </div>
                        <div style="margin-left: 280px;">
                            <button class="btn btn-primary" id="add_admin_btn">新增管理员</button>
                            <button class="btn btn-danger" id="batch_del_admin">删除管理员</button>
                            <button class="btn btn-success" id="batch_add_admin_btn">导入管理员</button>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0" id="admin_info">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="allChecked">
                            </th>
                            <th>序号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>院系</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody style="vertical-align: middle;"></tbody>
                    </table>
                </div>
                <div style=" height:74px;line-height:74px;margin: 0 auto; width: 800px">
                    <%--分页条信息--%>
                    <div id="page_nav_area" style="float:left;"></div>
                    <%--分页文字信息--%>
                    <div id="page_info_area" style="float:left; margin-left: 10px;"></div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div id="footer">
        <div class="footer">
            <%--<div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院--%>
                <%--版权所有--%>
            <%--</div>--%>
        </div>
    </div>
</footer>
</body>
</html>
<script type="text/javascript" src="static/js/common/tableInfo.js"></script>
<script type="text/javascript" src="static/js/common/tableCondition.js"></script>
<script type="text/javascript" src="static/js/common/prompt.js"></script>
<script type="text/javascript">
    $(function () {
        to_page(1);
    });

    function to_page(pn) {

        $.ajax({
            url: "admin/admins",
            data: {
                "pn": pn
            },
            type: "GET",
            success: function (result) {

                if (result.code == 100) {   //查询出数据
                    //构建管理员信息表格
                    build_admin_table(result);
                    //构建分页条信息
                    build_page_nav(result);
                    //构建分页信息
                    build_page_info(result);

                } else {      //没有管理员数据
                    $("#admin_info tbody").empty();
                    $("#page_nav_area").empty();
                    $("#page_info_area").empty();
                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#admin_info tbody");
                }
            }, error: function () {
                alert("服务器繁忙!");
            }
        });
    }

    //条件查询+模糊查询
    function to_page_condition(pn) {

        $.ajax({
            url: "admin/searchAdmins",
            data: {
                "pn": pn,
                "collegeId": $("#college").val(),
                "keywords": $("#keywords").val()
            },
            success: function (result) {

                if (result.code == 100) {   //查询出了数据
                    //1.构建管理员信息表格
                    build_admin_table(result);
                    //2.构建分页条
                    build_page_nav_condition(result);
                    //3.构建分页信息
                    build_page_info(result);
                } else {
                    //清空table表格样式
                    $("#admin_info tbody").empty();
                    //清空分页信息
                    $("#page_info_area").empty();
                    //清空分页导航栏
                    $("#page_nav_area").empty();

                    $("<tr></tr>").append($("<td></td>").append("暂无数据记录").attr("align", "center").attr("colspan", "10")).appendTo("#admin_info tbody");
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        })
    }

    function build_admin_table(result) {
        $("#admin_info tbody").empty();

        var admimsInfo = result.extend.pageInfo;

        $.each(admimsInfo.list, function (index, item) {

            //选择框
            var checkItem = $("<td></td>").append("<input type='checkbox' class='check_item'/>");

            //序号
            var count = $("<td></td>").append(index + 1 + (admimsInfo.pageNum == 0 ? admimsInfo.pageNum : admimsInfo.pageNum - 1) * 5);

            //工号
            var adminNumber = $("<td></td>").append(item.adminNumber);

            //姓名
            var adminName = $("<td></td>").append(item.adminName);

            //学院
            var adminCollege = $("<td></td>").append(item.college.name);

            //操作
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
                .append(count)
                .append(adminNumber)
                .append(adminName)
                .append(adminCollege)
                .append(operateBtn)
                .appendTo("#admin_info tbody");
        });
    }

    //添加管理员按钮
    $("#add_admin_btn").click(function () {

        $("#adminAddModal").modal({
            backdrop: "static"
        })
    });

    //校验添加时的信息
    function add_admin_validate() {

        //1.校验工号
        var adminNumber = $("#adminNumber_add_input").val();
        //定义正则表达式
        var regAdminNumber = /^[0-9]{5,}/;
        //校验
        if (!regAdminNumber.test(adminNumber)) {
            show_validate_msg("#adminNumber_add_input", "error", "管理员工号格式不正确");
            return false;
        } else {
            show_validate_msg("#adminNumber_add_input", "success", "")
        }

        //2.校验姓名是否为空输入
        if ($("#adminNumber_add_input").val().trim() == "") {
            alert("管理员姓名不能为空!");
            return false;
        }

        //3.校验是否选择学院
        if ($("#adminAddModal select").val() == -1) {
            alert("请选择学院!");
            return false;
        }

        return true;
    }

    //校验管理员账号是否存在
    $("#adminNumber_add_input").change(function () {

        //拿到管理员账号
        var adminNumber = this.value;

        $.ajax({
            url: "admin/checkAdmin",
            data: "adminNumber=" + adminNumber,
            type: "POST",
            success: function (result) {

                if (result.code == 100) {
                    show_validate_msg("#adminNumber_add_input", "success", "管理员账号可用");
                    $("#admin_save_btn").attr("ajax-va", "success");
                } else {
                    show_validate_msg("#adminNumber_add_input", "error", result.extend.msg);
                    $("#admin_save_btn").attr("ajax-va", "error");
                }
            },
            error: function () {
                alert("服务器繁忙!");
            }
        })

    })


    $("#admin_save_btn").click(function () {

        //1.校验表单数据
        if (!add_admin_validate()) {
            return false;
        }

        //2.判断管理员工号是否存在
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        //3.发送ajax请求保存管理员信息
        $.ajax({
            url: "admin/admin",
            type: "POST",
            data: $("#adminAddModal form").serialize(),
            success: function (result) {

                if (result.code == 100) {   //成功
                    //隐藏模态框
                    $("#adminAddModal").modal('hide');
                    //去到最后一页
                    to_page(totalPage);
                }

            }, error: function () {
                alert("服务器繁忙!");
            }
        })


    });

    //校验修改时的信息
    function update_admin_validate() {

        //1、校验管理员的姓名是否为空输入
        if ($("#adminName_update_input").val().trim() == "") {
            alert("管理员的姓名不能为空!")
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
        if ($("#AdminUpdateModal select").val() == -1) {
            alert("请选择学院!");
            return false;
        }

        return true;
    }

    //修改信息
    $("#admin_update_btn").click(function () {

        if (!update_admin_validate()) {
            return false;
        }

        $.ajax({
            url: "admin/admin/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#AdminUpdateModal form").serialize(),
            success: function () {

                //1、关闭对话框
                $("#AdminUpdateModal").modal('hide');
                //2、回到本页面
                if ($("#college").val() == -1 && $("#keywords").val().trim() == "") {
                    to_page(currentPage);
                } else {
                    to_page_condition(currentPage);
                }
            },
            error: function () {
                alert("服务器繁忙!");
            }
        })
    })

    //给管理员编辑按钮绑定单击事件
    $(document).on("click", ".edit-btn", function () {

        //查出管理员信息
        getAdmin($(this).attr("edit-id"));

        //将管理员的id给更新按钮
        $("#admin_update_btn").attr("edit-id", $(this).attr("edit-id"));

        //弹出模态框
        $("#AdminUpdateModal").modal({
            backdrop: "static"
        });
    });

    //获取单个管理员的信息
    function getAdmin(id) {

        $.ajax({
            url: "admin/admin/" + id,
            type: "GET",
            success: function (result) {

                var admin = result.extend.adminInfo;
                //工号
                $("#adminNumber_update_input").val(admin.adminNumber);
                //姓名
                $("#adminName_update_input").val(admin.adminName);
                //密码
                $("#password_update_input").val(admin.password);
                //性别
                $("#AdminUpdateModal input[name=gender]").val([admin.gender]);
                //管理员类型
                $("#AdminUpdateModal input[name=isSuper]").val([admin.isSuper]);
                //邮箱
                $("#email_update_input").val(admin.email);
                //手机号
                $("#phone_update_input").val(admin.phone);
                //学院
                $("#AdminUpdateModal select").val([admin.collegeId]).attr("selected", true);

            },
            error: function () {
                alert("服务器繁忙!");
            }
        })
    }

    //删除单个管理员
    $(document).on("click", ".delete-btn", function () {

        //1、管理员姓名
        var adminName = $(this).parent("tr").eq(2).text();
        //2、管理员id
        var adminId = $(this).attr("del-id");

        if (confirm("确认删除" + adminName + "吗?")) {

            $.ajax({
                url: "admin/admin/" + adminId,
                type: "DELETE",
                success: function () {
                    to_page(1);
                },
                error: function () {
                    alert("服务器繁忙!");
                }
            })
        }

    });

    //当单击页面头部的全选时进行全选
    $("#allChecked").click(function () {

        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //批量删除管理员
    $("#batch_del_admin").click(function () {

        //批量删除的管理员姓名
        var adminNames = "";
        //批量删除管理员的id
        var adminIds = "";

        $.each($(".check_item:checked"), function () {
            adminNames += $(this).parents("tr").find("td:eq(3)").text() + ",";
            adminIds += $(this).parents("tr").find("td:eq(5) a").attr("edit-id") + "-";
        });

        if (adminNames == "" || adminIds == "") {
            alert("请选择需要删除的管理员!");
            return false;
        }

        adminNames = adminNames.substring(0, adminNames.length - 1);
        adminIds += adminIds.substring(0, adminIds.length - 1);

        if (confirm("确认删除" + adminNames + "吗?")) {
            $.ajax({
                url: "admin/admin/" + adminIds,
                type: "DELETE",
                success: function () {
                    $("#allChecked").prop("checked", false);
                    to_page(currentPage);
                },
                error: function () {
                    alert("服务器繁忙!");
                }
            })
        }
    });

    layui.use('upload', function () {
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: "#batch_add_admin_btn", // 绑定元素
            url: "admin/insertAdminByExcel",// 上传接口
            accept: "file",// 普通文件
            acceptMime: "application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", // 接收的mime类型
            auto: true,// 自动上传
            multiple: false,// 取消多文件上传
            field: "ExcelFile",// 设置字段名
            exts: 'xls|xlsx',// 允许上传的文件后缀
            before: function () {
                layer.msg('上传中', {icon: 16, shade: 0.01}); // 上传loading
            },
            done: function (res, index, upload) {// 上传完毕回调 res服务器响应信息 index当前文件的索引 upload重新上传的方法
                layer.close(layer.index); // 关闭loading
                if (res.code == 100) {
                    layer.msg(res.extend.message, {icon: 1, time: 3000}, function () {
                        // 重新加载页面
                        location.reload();
                    });
                } else {
                    layer.alert(res.extend.message, {icon: 2});
                }
            },
            error: function (index, upload) {// 请求异常回调
                layer.msg("网络请求超时,请稍后再试或联系管理员");
            }
        });

    });

</script>