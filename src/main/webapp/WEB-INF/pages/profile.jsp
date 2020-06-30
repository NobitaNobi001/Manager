<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css" />
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="${APP_PATH}/static/images/logo.png" height="70" /></div>
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.name}(${student.stuNumber})</a>
                    <a href="/login.jsp">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
                    <li><a href="${APP_PATH}/student/toupdateInfo/${student.id}">个人信息</a></li>
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
                    <li class="headline"><a href="javascript:void (0);">账号管理</a></li>
                    <li><a href="${APP_PATH}/student/toupdateInfo/${student.id}">完善信息</a></li>
                    <li><a href="${APP_PATH}/student/toupdatepwd/${student.id}">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="credit">
                    <h4>个人信息</h4>
                    <form action="${APP_PATH}/student/updateInfo" method="post" class="form" onsubmit="return check()">
                        <input type="hidden" value="${student.id}" name="id">
                        <div class="row item">
                            <div class="col col-2 name">姓名</div>
                            <div class="col col-7 value">
                                <input type="text"  value="${student.name}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">院系</div>
                            <div class="col col-7 value">
                                    <input type="text"  value="${student.institute}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">班级</div>
                            <div class="col col-7 value">
                                <input type="text"  value="${student.className}" readonly>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">性别</div>
                            <div class="col col-7 value">
                                <div class="row">
                                    <label><input type="radio" name="gender" value="男" id="male"/>男</label>
                                    <label><input type="radio" name="gender" value="女" id="female"/> 女</label>
                                </div>
                                <div class="notice">请选择性别</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">手机号码</div>
                            <div class="col col-7 value">
                                <input type="text" name="phone"  id="phone" value="${student.phone}" onchange="checkPhone(this)"/>
                                <div class="notice" id="phonemsg">请填写联系电话</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">电子邮箱</div>
                            <div class="col col-7 value">
                                <input type="text" name="email" id="email" value="${student.email}" onchange="checkEmail(this)"/>
                                <div class="notice" id="emailmsg">请填写邮箱地址</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value"><button type="submit" class="btn btn-primary btn-6x">提交保存</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</main>
<footer>
    <div id="footer">
        <div class="footer">
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</footer>
</body>
</html>
<script src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
<script src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.js"></script>
<script type="text/javascript">
   //左侧的颜色改变 鼠标悬停效果
   $(function () {//性别的checked选中
       var gender='${student.gender}';
       if($("#male").val()==gender){
           $("#male").prop("checked","checked");
       }else{
           $("#female").prop("checked","checked");
       }
   });
   function checkPhone(node){
       var phone = node.value;
       phone=phone.trim();
       if(phone!=""||phone.length!=0){
           var regExp=/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/
           if(!regExp.test(phone)){//不合法
               document.getElementById("phonemsg").innerText="手机号码格式有误";
               document.getElementById("phonemsg").style.color='red';
               return false;
           }else{
               document.getElementById("phonemsg").innerText="";
               return true;
           }
       }else {
           document.getElementById("phonemsg").innerText="";
           return true;
       }
   }
    function checkEmail(node){
        var email = node.value;
        if(email!=""||email.length!=0){
            var regExp=/^[A-Za-z0-9-._]+@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,6})$/;
            if(!regExp.test(email)){//不合法
                document.getElementById("emailmsg").innerText="邮箱地址格式错误";
                document.getElementById("emailmsg").style.color='red';
                return false;
            }else {
                document.getElementById("emailmsg").innerText="";
                return true;
            }
        }else {
            document.getElementById("emailmsg").innerText="";
            return true;
        }
   }
   function check() {
       var flag=checkEmail(document.getElementById("email"))&&checkPhone(document.getElementById("phone"));
       if(flag){
           alert("修改信息成功");
       }
       return flag;
   }
</script>
