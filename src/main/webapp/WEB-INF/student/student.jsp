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
    <title>湖北文理学院创新学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" type="image/png" href="static/images/logo.png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/student.css"/>
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
                    <div class="logo"><img src="static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分管理系统</div>
                </div>
                <div class="top-right right">
                    <a href="javascript:void (0)">湖北文理学院&nbsp;&nbsp;${student.stuName }(${student.stuNumber })</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="student/stuIndex">首页</a></li>
                    <li><a href="student/updateInfo/${student.id }">个人信息</a></li>
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
                    <li><a href="student/viewCredit.html">学分列表</a></li>
                    <li><a href="student/applyCredit/${student.id }.html">学分申报</a></li>
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="student/updateInfo/${student.id }.html">修改信息</a></li>
                    <li><a href="student/updatePwd/${student.id }.html">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div class="userinfo">
                    <div class="avatar">
                        <div class="head"></div>
                    </div>
                    <div class="info">
                        <div class="username">${student.stuName}</div>
                    </div>
                    <div class="department"><span>${student.college.name}</span></div>
                    <div class="major"><span>${student.className}</span></div>
                </div>

                <!-- 学分申请 start -->
                <div class="declare">
                    <h4>学分申报</h4>
                    <ul>
                        <li>
                            <div>大学生学科竞赛活动（含大学生创新创业训练项目）</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-danger btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>大学生文体竞赛活动</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>创新创业实践训练（课程）</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>论文、专利、作品发表</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>职业（等级）证书</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>参与教师科研（或实验室工作）</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>社会实践（调查）</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>读书活动</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>学生工作与社团活动）</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>专业认定的其他创新实践活动</div>
                            <div><a href="student/applyCredit/${student.id}" class="btn btn-success btn-2x">立即申报</a>
                            </div>
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
<script type="text/javascript">
    $(function () {
        var stuName = '${student.stuName}';
        $('.avatar .head').append(stuName.substr(stuName.length - 1, 1));
    })
</script>
