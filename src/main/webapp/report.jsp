<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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
                    <li class="title"><a href="javascript:;">教师中心</a></li>
                    <li><a href="teacher.jsp">首页</a></li>
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
                    <li><a href="trainee.jsp">学生列表</a></li>
                    <li><a href="report.jsp">申报管理</a></li>
                    <li class="headline"><a href="javascript:;">账号设置</a></li>
                    <li><a href="profile.jsp">个人信息</a></li>
                    <li><a href="password.jsp">修改密码</a></li>
                    <li><a href="telephone.jsp">绑定手机</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>学分申报审核列表</h4>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>手机号码</th>
                            <th style="text-align: left;">申报项目</th>
                            <th>学分</th>
                            <th>审核状态</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>2020062101</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td style="text-align: left;">大学生学科竞赛活动（含大学生创新创业训练项目）</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-danger btn-2x">待审核</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x">审核</a></td>
                        </tr>
                        <tr>
                            <td>2020062102</td>
                            <td>舞云</td>
                            <td>13508250630</td>
                            <td style="text-align: left;">大学生文体竞赛活动</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-danger btn-2x">待审核</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x">审核</a></td>
                        </tr>
                        <tr>
                            <td>2020062103</td>
                            <td>淑云</td>
                            <td>13908250630</td>
                            <td style="text-align: left;">参与教师科研（或实验室工作）</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-danger btn-2x">待审核</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x">审核</a></td>
                        </tr>
                        <tr>
                            <td>2020062104</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td style="text-align: left;">创新创业实践训练（课程）</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-warning btn-2x">未通过</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x">审核</a></td>
                        </tr>
                        <tr>
                            <td>2020062105</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td style="text-align: left;">专业认定的其他创新实践活动</td>
                            <td>2</td>
                            <td><a href="javascript:;" class="btn btn-success btn-2x">已通过</a></td>
                            <td><a href="javascript:;" class="btn btn-primary btn-2x">审核</a></td>
                        </tr>
                    </table>
                    <div class="pager">
                        <a href="javascript:;" class="btn btn-default btn-1x">首页</a>
                        <a href="javascript:;" class="btn btn-default btn-1x">上一页</a>
                        <a href="javascript:;" class="btn btn-success btn-1x">1</a>
                        <a href="javascript:;" class="btn btn-1x">2</a>
                        <a href="javascript:;" class="btn btn-default btn-1x">下一页</a>
                        <a href="javascript:;" class="btn btn-default btn-1x">尾页</a>
                    </div>
                </div>
                <!-- 学分列表 end -->
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
