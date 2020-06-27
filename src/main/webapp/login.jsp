<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>
<<<<<<< HEAD
=======

>>>>>>> origin/Nobita
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css"/>
<<<<<<< HEAD
=======

>>>>>>> origin/Nobita
</head>
<body>
<div id="login">
    <div class="login">
        <div class="top">
            <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="120"/></div>
            <div class="title">湖北文理学院创新学分系统</div>
        </div>
        <div class="login-form">
<<<<<<< HEAD
            <form action="${APP_PATH}/checkuser" method="post" onsubmit="return check()">
                <h4>登录</h4>
                <br></br>
                <div><input type="text" name="stuNumber" id="stuNumber"  placeholder="学号" onchange="checkuser()"/>
                    <span id="checktext"></span>
                </div>
                <div><input type="password" name="password" id="password"  placeholder="密码" onchange="checkpwd()"/></div>
                <div class="type">
                    <label><input type="radio" name="type" id="type1" value="1" checked="checked" />学生</label>
                    <label><input type="radio" name="type" id="type2" value="2" />教师</label>
                    <label><input type="radio" name="type" id="type3" value="3" />督查</label>
                    <label><input type="radio" name="type" id="type4" value="4" />管理员</label>
                </div>
                <br></br>
                <div><button type="submit">登录</button></div>
=======
            <form action="${APP_PATH}/checkuser" method="post">
                <h4>登录</h4>
                <br>
                <div><input type="text" name="stuNumber" id="username" value="" placeholder="学号"/></div>
                <div><input type="password" name="password" id="password" value="" placeholder="密码"/></div>
                <div class="type">
                    <label><input type="radio" name="type" id="type1" value="1" checked="checked"/>学生</label>
                    <label><input type="radio" name="type" id="type2" value="2"/>教师</label>
                    <label><input type="radio" name="type" id="type3" value="3"/>督查</label>
                    <label><input type="radio" name="type" id="type4" value="4"/>管理员</label>
                </div>
                <br>
                <div>
                    <button type="submit">登录</button>
                </div>
>>>>>>> origin/Nobita
            </form>
        </div>
        <div class="foot">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院
                版权所有
            </div>
        </div>
    </div>
</div>
</body>
<<<<<<< HEAD
</html>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
    function checkuser() {
        var check=false;
        var stuNumber=document.getElementById("stuNumber").value;
        stuNumber=stuNumber.trim();
        if(stuNumber==""){
            check=false;
        }else{
            check=true;
        }
        return check;
    }

    function checkpwd() {
        var check=false;
        var password=document.getElementById("password").value;
        if(password==""||password.length==0){
            check=false;
        }else {
            check=true;
        }
        return check;
    }

    function check() {
        if(checkuser()==true&&checkpwd()==true){//输入正确
            document.getElementById("checktext").style.display="none";
            //后台验证
            var msg=$${sessionScope.msg};
            if(msg=='用户名或密码错误'){
                document.getElementById("checktext").innerText="msg";
                return false;
            }
        }else if(checkuser()==true&&checkpwd()==false){//学号不为空但密码为空
            document.getElementById("checktext").innerText="请您输入密码";
        }else if(checkuser()==false&&checkpwd()==false){//学号和密码都为空
            document.getElementById("checktext").innerText="请您输入学号/密码";
        }
        var check=checkuser()&&checkpwd();
        return check;
    }
</script>
=======
</html>
>>>>>>> origin/Nobita
