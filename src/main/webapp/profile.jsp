<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%
        //        获取webapp的项目路径
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
                    <a href="profile.jsp">admin@qq.com</a>
                    <a href="login.jsp">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">个人中心</a></li>
                    <li><a href="index.jsp">首页</a></li>
                    <li><a href="profile.jsp">个人信息</a></li>
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
                    <li><a href="profile.jsp">个人信息</a></li>
                    <li><a href="password.jsp">修改密码</a></li>
                    <li><a href="telephone.jsp">绑定手机</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分申报 start -->
                <div class="credit">
                    <h4>个人信息</h4>
                    <form action="" method="post" class="form">
                        <div class="row item">
                            <div class="col col-2 name">头像</div>
                            <div class="col col-7 value">
                                <input type="file" name="avatar">
                                <div class="notice">请选择上传头像</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">姓名</div>
                            <div class="col col-7 value">
                                <input type="text" name="username">
                                <div class="notice">请填写真实姓名</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">性别</div>
                            <div class="col col-7 value">
                                <div class="row">
                                    <label><input type="radio" name="gender" value="0" checked="checked" /> 保密 </label>
                                    <label><input type="radio" name="gender" value="1" /> 男 </label>
                                    <label><input type="radio" name="gender" value="2" /> 女 </label>
                                </div>
                                <div class="notice">请选择性别</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">手机号码</div>
                            <div class="col col-7 value">
                                <input type="text" name="telephone" />
                                <div class="notice">请填写联系电话</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">院系</div>
                            <div class="col col-5 value">
                                <select name="department">
                                    <option value="0">请选择所在院系</option>
                                </select>
                                <div class="notice">请选择所在院系</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">联系地址</div>
                            <div class="col col-8 value">
                                <input type="text" name="address" />
                                <div class="notice">请填写联系地址</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">个人简介</div>
                            <div class="col col-8 value">
                                <textarea name="desc" cols="30" rows="10"></textarea>
                                <div class="notice">请填写个人简介</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value"><button type="button" class="btn btn-primary btn-6x">提交保存</button></div>
                        </div>
                    </form>
                    <!-- 学分申报 end -->
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

