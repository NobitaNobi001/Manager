<%--
 个人信息
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/manager.css"/>

    <%--引入jQuery外部文件--%>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70" style="margin-top: 40px;"/></div>
                    <div class="title">湖北文理学院创新实践学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="admins/profile" style="font-size: 14px; color: #337ab7;">${admins.college.name }&nbsp;&nbsp;${admins.adminName}(${admins.adminNumber})</a>
                    <a href="logout" style="font-size: 14px; color: #337ab7;">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admins/index">首页</a></li>
                    <li><a href="admins/profile">个人信息</a></li>
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
                    <li><a href="admins/auditTeacherManager">审核管理</a></li>
                    <li><a href="admins/ruleManager">审核规则</a></li>
                    <li><a href="admins/stuList">学生列表</a></li>
                    <li><a href="admins/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admins/profile">个人信息</a></li>
                    <li><a href="admins/password">修改密码</a></li>
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
                                <input type="text" name="username" value="${admins.adminName }" readonly>
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
                                <input type="text" name="telephone" value="${admins.phone }"
                                       onchange="validate_phone()"/>
                                <div class="notice">请填写联系电话</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">邮箱</div>
                            <div class="col col-7 value">
                                <input type="text" name="email" value="${admins.email }" onchange="validate_email()"/>
                                <div class="notice">请填写邮箱</div>
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
        $("input[type='radio'][name='gender'][value='${admins.gender }']").attr("checked", true);

    });

    //更新个人信息
    $("button").click(function () {

        //校验电话号码的输入
        if (!validate_phone()) {
            return false;
        }

        //校验邮箱的输入
        if (!validate_email()) {
            return false;
        }

        $.ajax({
            url: "admins/updateInfo/" +${admins.id },
            type: "PUT",
            data: {
                "gender": $("input[type='radio']:checked").val(),
                "phone": phone.val(),
                "email": email.val()
            },
            success: function (result) {
                if (result.code == 100) {
                    alert("修改成功");
                    window.location.reload();
                } else {
                    alert(result.extend.msg);
                    window.location.reload();
                }
            },
            error: function () {
                alert("服务器繁忙");
            }
        });

    });

    //校验手机号格式
    function validate_phone() {

        //定义验证手机号的正则表达式
        var regPhone = /^[1][0-9]{10}/;

        //如果输入值满足正则表达式
        if (regPhone.test(phone.val())) {
            phone.next().html("&nbsp;");
            return true;
        } else {  //反之

            if (phone.val().trim() == "") {
                return true;
            }

            phone.next().html("<p style='color: red;'>格式错误</p>");
        }
        return false;
    }

    //校验邮箱格式
    function validate_email() {

        //定义验证邮箱的正则表达式
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        //如果输入值满足正则表达式
        if (regEmail.test(email.val())) {
            email.next().html("&nbsp;");
            return true;
        } else {  //反之

            if (email.val().trim() == "") {
                return true;
            }
            email.next().html("<p style='color: red;'>邮箱格式错误</p>");
        }
        return false;
    }

</script>