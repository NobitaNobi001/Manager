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
                    <a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">学生中心</a></li>
                    <li><a href="student/stuIndex">首页</a></li>
                    <li><a href="student/updateInfo/${student.id}">个人信息</a></li>
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
                    <li><a href="student/viewCredit">学分列表</a></li>
                    <li><a href="student/applyCredit/${student.id}">学分申报</a></li>
                    <li class="headline"><a href="javascript:;">账号管理</a></li>
                    <li><a href="student/updateInfo/${student.id}">修改信息</a></li>
                    <li><a href="student/updatepwd/${student.id}">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分申报 start -->
                <div class="credit">
                    <h4>
                        学分申报</h4><%--<img src="static/images/help.jpg" style="float: right" alt="申报帮助" data-toggle="modal" data-target="#myModal">--%>
                    <form action="student/apply" method="post" class="form" enctype="multipart/form-data">
                        <input type="hidden" value="${student.stuNumber}" name="stuNumber">
                        <input type="hidden" value="${student.stuName}" name="stuName">
                        <div class="row item">
                            <div class="col col-2 name">申报类别</div>
                            <div class="col col-6 value">
                                <select name="sort">
                                    <option value="1">大学生学科竞赛活动（含大学生创新创业训练项目）</option>
                                    <option value="2">大学生文体竞赛活动</option>
                                    <option value="3">创新创业实践训练（课程）</option>
                                    <option value="4">论文、专利、作品发表</option>
                                    <option value="5">职业（等级）证书</option>
                                    <option value="6">参与教师科研（或实验室工作）</option>
                                    <option value="7">社会实践（调查）</option>
                                    <option value="8">读书活动</option>
                                    <option value="9">学生工作与社团活动</option>
                                    <option value="10">专业认定的其他创新实践活动</option>
                                </select>
                                <div class="notice">请选择要申报的活动类别</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">申报活动名称</div>
                            <div class="col col-4 value">
                                <input type="text" name="applyName" id="applyName" onchange="checkApplyName()"/>
                                <div class="notice">请填写申报的活动名称</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">申报学分</div>
                            <div class="col col-4 value">
                                <input type="number" name="applyCredit" id="applyCredit" max="8" min="0.5" step="0.5"
                                       onchange="checkCredit()"/>
                                <div class="notice">请填写申报学分</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">申报材料</div>
                            <div class="col col-7 value">
                                <input type="file" name="file" id="file" onchange="checkFile(this)"
                                       accept="image/jpeg,image/jpg,image/png,image/svg,image/gif"/>
                                <div class="notice">请选择要上传的申报图片</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">描述</div>
                            <div class="col col-8 value">
                                <textarea name="words" id="words" cols="30" rows="10"></textarea>
                                <div class="notice">填写申报描述备注内容</div>
                            </div>
                        </div>
                        <div class="row item">
                            <div class="col col-2 name">&nbsp;</div>
                            <div class="col value">
                                <button type="button" class="btn btn-primary btn-6x" onclick="check()">提交申报</button>
                            </div>
                        </div>
                    </form>
                    <!-- 学分申报 end -->
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
<!--model-->
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>--%>
</body>
</html>
<script type="text/javascript" src="static/js/student/creditDeclare.js"></script>

