<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

        <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="${APP_PATH}/teacher/teaProfile"
                       style="font-size: 14px; color: #337ab7;">${teacher.teaName }(${teacher.teaNumber })</a>
                    <a href="${APP_PATH}/login.jsp" style="font-size: 14px; color: #337ab7;">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="${APP_PATH}/teacher/teaIndex">首页</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/teacher/stuList">学生列表</a></li>
                    <li><a href="${APP_PATH}/teacher/declareManager">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="${APP_PATH}/teacher/teaProfile">个人信息</a></li>
                    <li class=""><a href="${APP_PATH}/teacher/teaPassword">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分申报 start -->
                <div class="credit">
                    <h4>个人信息</h4>
                    <form action="#" method="post" class="form">
                        <div class="row item">
                            <div class="col col-2 name">姓名</div>
                            <div class="col col-7 value">
                                <input type="text" name="username" value="${teacher.teaName }" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">性别</div>
                            <div class="col col-7 value">
                                <div class="row">
                                    <label><input type="radio" name="gender" value="男"/> 男 </label>
                                    <label><input type="radio" name="gender" value="女"/> 女 </label>
                                </div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">手机号码</div>
                            <div class="col col-7 value">
                                <input type="text" name="telephone" value="${teacher.phone }"/>
                                <div class="notice">请填写联系电话</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">邮箱</div>
                            <div class="col col-7 value">
                                <input type="text" name="email" value="${teacher.email }"/>
                                <div class="notice">请填写邮箱</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">院系</div>
                            <div class="col col-5 value">
                                <input type="text" name="college" value="${teacher.college.name }" readonly/>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value">
                                <button type="button" class="btn btn-primary btn-6x">提交保存</button>
                            </div>
                        </div>
                    </form>
                    <!-- 学分申报 end -->
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div id="footer">
        <div class="footer">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院
                版权所有
            </div>
        </div>
    </div>
</footer>
</body>
</html>
<script type="text/javascript">


    //获取手机号文本框
    var phone = $("input[name='telephone']");
    //获取邮箱文本框
    var email = $("input[name='email']");

    //页面加载完成后就调用
    $(function () {
        //性别文本框设置性别
        //获取性别文本框
        $("input[type='radio'][name='gender'][value='${teacher.gender }']").attr("checked", true);

    });

    //更新个人信息
    $("button").click(function () {

        //校验电话号码的输入
        if (!phone.trigger("input propertychange.validate_phone")) {
            return false;
        }

        //校验邮箱的输入
        if (!email.trigger("input propertychange.validate_email")) {
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/teacher/updateInfo/" +${teacher.id },
            type: "POST",
            data: {
                "gender": $("input[type='radio']:checked").val(),
                "phone": phone.val(),
                "email": email.val()
            },
            success: function (result) {
                alert("修改成功");
                window.location.reload();
            },
            error: function (result) {
                alert("修改失败");
            }
        });

    });

    //给手机号文本框绑定输入值改变事件
    phone.bind("input propertychange.validate_phone", function () {

        //定义验证手机号的正则表达式
        var regPhone = /^[1][0-9]{10}/;

        //如果输入值满足正则表达式
        if (regPhone.test($(this).val())) {
            $(this).next().html("&nbsp;");
            return true;
        } else {  //反之
            $(this).next().html("<p style='color: red;'>电话号码格式错误</p>");
        }
        return false;
    });

    //给邮箱文本框绑定输入值改变事件
    email.bind("input propertychange.validate_email", function () {

        //定义验证邮箱的正则表达式
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        //如果输入值满足正则表达式
        if (regEmail.test($(this).val())) {
            $(this).next().html("&nbsp;");
            return true;
        } else {  //反之
            $(this).next().html("<p style='color: red;'>邮箱格式错误</p>");
        }
        return false;
    });

</script>
