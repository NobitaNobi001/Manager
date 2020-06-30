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
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/teacher.css"/>
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
                    <a href="${APP_PATH}/teacher/profile">${teacher.institute }(${teacher.teaNumber })</a>
                    <a href="login.html">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">教师中心</a></li>
                    <li><a href="teacher.html">首页</a></li>
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
                    <li class="headline"><a href="javascript:;">控制中心</a></li>
                    <li><a href="trainee.html">学生列表</a></li>
                    <li><a href="report.html">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="profile.html">个人信息</a></li>
                    <li><a href="password.html">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="userinfo">
                    <div class="avatar">
                        <div class="head">杨</div>
                    </div>
                    <div class="info">
                        <div class="username">${teacher.name }</div>
                        <%--<div class="telephone">13258565780</div>--%>
                    </div>
                    <div class="department"><span>${teacher.institute }</span></div>
                    <%--<div class="major"><span>计算机信息管理</span></div>--%>
                </div>

                <!-- 学分申请 start -->
                <div class="declare">
                    <h4>学分申报审核</h4>
                    <ul>
                        <li>
                            <div class="title">大学生学科竞赛活动（含大学生创新创业训练项目）</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-danger btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">大学生文体竞赛活动</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">创新创业实践训练（课程）</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">论文、专利、作品发表</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">职业（等级）证书</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">参与教师科研（或实验室工作）</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">社会实践（调查）</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">读书活动</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">学生工作与社团活动）</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                        <li>
                            <div class="title">专业认定的其他创新实践活动</div>
                            <div class="username">淑云</div>
                            <div class="datetime">2020-06-21</div>
                            <div><a href="javascript:;" class="btn btn-success btn-2x">申报审核</a></div>
                        </li>
                    </ul>
                </div>
                <!-- 学分申请 end -->
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
