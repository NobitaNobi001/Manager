<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>湖北文理学院创新学分系统</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrapvalidator/css/bootstrapValidator.css"/>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/layer/layer.js"></script>
</head>
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
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
                    <a href="${APP_PATH}/logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
                    <li><a href="${APP_PATH}/student/updateInfo/${student.id}">个人信息</a></li>
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
                    <li><a href="${APP_PATH}/student/viewCredit">学分列表</a></li>
                    <li><a href="${APP_PATH}/student/applyCredit/${student.id}">学分申报</a></li>
                    <li class="headline"><a href="javascript:void (0);">账号管理</a></li>
                    <li><a href="${APP_PATH}/student/updateInfo/${student.id}">修改信息</a></li>
                    <li><a href="${APP_PATH}/student/updatepwd/${student.id}">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="credit">
                    <h4>个人信息</h4>
                    <form action="${APP_PATH}/student/updateStuNullInfo" method="post" class="form">
                        <input type="hidden" value="${student.id}" name="id">
                        <div class="row item">
                            <div class="col col-2 name">姓名</div>
                            <div class="col col-7 value">
                                <input type="text" value="${student.stuName}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">院系</div>
                            <div class="col col-7 value">
                                <input type="text" value="${student.college.name}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">班级</div>
                            <div class="col col-7 value">
                                <input type="text" value="${student.className}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">性别</div>
                            <div class="col col-7 value">
                                <div class="row">
                                    <label><input type="radio" name="gender" value="男" id="male"/>男</label>
                                    <label><input type="radio" name="gender" value="女" id="female"/> 女</label>
                                </div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">手机号码</div>
                            <div class="col col-7 value">
                                <input type="text" name="phone" id="phone" value="${student.phone}"
                                       onchange="checkPhone(this)"/>
                                <div class="notice" id="phonemsg">请填写联系电话</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">电子邮箱</div>
                            <div class="col col-7 value">
                                <input type="text" name="email" id="email" value="${student.email}"
                                       onchange="checkEmail(this)"/>
                                <div class="notice" id="emailmsg">请填写邮箱地址</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value">
                                <button type="button" class="btn btn-primary btn-6x" onclick="check()">提交保存</button>
                            </div>
                        </div>
                    </form>
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
    $(function () {//性别的checked选中
        var gender = '${student.gender}';
        if ($("#male").val() == gender) {
            $("#male").prop("checked", "checked");
        } else {
            $("#female").prop("checked", "checked");
        }
    });

    function checkPhone(node) {
        var phone = node.value;
        phone = phone.trim();
        if (phone != "" || phone.length != 0) {
            var regExp = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/
            if (!regExp.test(phone)) {//不合法
                document.getElementById("phonemsg").innerText = "手机号码格式有误";
                document.getElementById("phonemsg").style.color = 'red';
                return false;
            } else {
                document.getElementById("phonemsg").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
                return true;
            }
        } else {
            document.getElementById("phonemsg").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            return true;
        }
    }

    function checkEmail(node) {
        var email = node.value;
        if (email != "" || email.length != 0) {
            var regExp = /^[A-Za-z0-9-._]+@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,6})$/;
            if (!regExp.test(email)) {//不合法
                document.getElementById("emailmsg").innerText = "邮箱地址格式错误";
                document.getElementById("emailmsg").style.color = 'red';
                return false;
            } else {
                document.getElementById("emailmsg").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
                return true;
            }
        } else {
            document.getElementById("emailmsg").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            return true;
        }
    }

    function check() {
        var flag = checkEmail(document.getElementById("email")) && checkPhone(document.getElementById("phone"));
        if (flag) {
            if ($("input[name='gender']:checked").val() == '${student.gender}' && $("#email").val() == '${student.email}' && $("#phone").val() == '${student.phone}') {
                alert("您没有修改信息");
            } else {
                alert("修改信息成功");
                document.forms[0].submit();
            }
        } else {
            alert("请填写正确的信息")
        }
    }
</script>