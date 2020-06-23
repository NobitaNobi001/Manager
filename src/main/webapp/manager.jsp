<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>

    <%
        //        获取webapp的项目路径
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/manager.css"/>
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
                    <a href="profile.jsp">admin@qq.com</a>
                    <a href="login.jsp">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="manager.jsp">首页</a></li>
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
                    <li><a href="manager-declare.jsp">申报管理</a></li>
                    <li><a href="manager-student.jsp">学生管理</a></li>
                    <li><a href="manager-teacher.jsp">教师管理</a></li>
                    <li><a href="manager-overseer.jsp">督查管理</a></li>
                    <li><a href="manager-overseer.jsp">管理员</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <ul class="manager">
                    <li style="background: rgba(0, 153, 255, .1);color: #09f;">
                        <div class="number">1000</div>
                        <div class="title">申报数量</div>
                    </li>
                    <li style="background: rgba(0, 153, 0, .1);color: #090;">
                        <div class="number">120</div>
                        <div class="title">学生</div>
                    </li>
                    <li style="background: rgba(255, 153, 0, .1);color: #f90;">
                        <div class="number">10</div>
                        <div class="title">教师</div>
                    </li>
                    <li style="background: rgba(255, 0, 0, .1);color: #f00;">
                        <div class="number">10</div>
                        <div class="title">督查</div>
                    </li>
                    <li style="background: rgba(153, 153, 0, .1);color: #990;">
                        <div class="number">5</div>
                        <div class="title">管理员</div>
                    </li>
                </ul>
                <!-- 学分申请 start -->
                <div class="declare">
                    <h4>最近学分申报审核</h4>
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
            <div class="copyright">Copyright © 2020 Hubei University of Arts and Science. All Rights Reserved. 湖北文理学院 版权所有</div>
        </div>
    </div>
</footer>
</body>
</html>
