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
                    <a href="admins/profile">${admins.adminName}(${admins.adminNumber})</a>
                    <a href="logout">退出</a>
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
                    <form action="" method="post" class="form">
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
                                    <label><input type="radio" name="gender" value="1" checked="checked"/> 男 </label>
                                    <label><input type="radio" name="gender" value="2"/> 女 </label>
                                </div>
                                <div class="notice">请选择性别</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">手机号码</div>
                            <div class="col col-7 value">
                                <input type="text" name="telephone"/>
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