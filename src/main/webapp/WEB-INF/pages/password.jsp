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
                    <a href="profile.html">admin@qq.com</a>
                    <a href="login.html">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
                    <li><a href="profile.html">个人信息</a></li>
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
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="profile.html">完善信息</a></li>
                    <li><a href="password.html">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form action="" method="post" class="form">
                        <div class="row item">
                            <div class="col col-2 name">原密码</div>
                            <div class="col col-7 value">
                                <input type="text" name="password">
                                <div class="notice">请输入当前用户密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">新密码</div>
                            <div class="col col-7 value">
                                <input type="text" name="pass">
                                <div class="notice">请填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">重复密码</div>
                            <div class="col col-7 value">
                                <input type="text" name="respass">
                                <div class="notice">请再次填写新密码</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value"><button type="button" class="btn btn-primary btn-6x">提交绑定</button></div>
                        </div>
                    </form>
                    <!-- 修改密码 end -->
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
