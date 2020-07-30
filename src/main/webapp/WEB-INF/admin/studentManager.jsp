<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新学分系统</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
<header>
    <div id="header">
        <div class="header">
            <div class="top clear">
                <div class="top-left left">
                    <div class="logo"><img src="static/images/logo.png" height="70"/></div>
                    <div class="title">湖北文理学院创新学分系统</div>
                </div>
                <div class="top-right right">
                    <a href="admin/admProfile">admin@qq.com</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/admIndex">首页</a></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
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
                    <li><a href="admin/toSee/studentRecord.html">申报管理</a></li>
                    <li><a href="admin/stuManager">学生管理</a></li>
                    <li><a href="admin/teaManager">教师管理</a></li>
                    <li><a href="admin/watManager">督查管理</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="student">
                    <h4>学生列表</h4>
                    <div class="action">
                        <div>
                            <a href="javascript:;" class="btn btn-primary">新增学生</a>
                            <a href="javascript:;" class="btn btn-danger">导入学生</a>
                        </div>
                        <div>
                            <select name="department">
                                <option value="0">请选择院系</option>
                            </select>
                        </div>
                        <div>
                            <select name="classes">
                                <option value="0">请选择班级</option>
                            </select>
                        </div>
                        <div>
                            <input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字" value="" />
                            <a href="javascript:;" class="btn btn-primary">搜索</a>
                        </div>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>班级</th>
                            <th>院系</th>
                            <th>专业</th>
                            <th>学分</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>2020062101</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td>计算机系（学院）</td>
                            <td>计算机信息管理</td>
                            <td>2</td>
                            <td>
                                <a href="javascript:;" class="btn btn-primary btn-2x">编辑</a>
                                <a href="javascript:;" class="btn btn-danger btn-2x">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2020062102</td>
                            <td>舞云</td>
                            <td>13508250630</td>
                            <td>计算机系（学院）</td>
                            <td>计算机信息管理</td>
                            <td>2</td>
                            <td>
                                <a href="javascript:;" class="btn btn-primary btn-2x">编辑</a>
                                <a href="javascript:;" class="btn btn-danger btn-2x">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2020062103</td>
                            <td>淑云</td>
                            <td>13908250630</td>
                            <td>计算机系（学院）</td>
                            <td>计算机信息管理</td>
                            <td>2</td>
                            <td>
                                <a href="javascript:;" class="btn btn-primary btn-2x">编辑</a>
                                <a href="javascript:;" class="btn btn-danger btn-2x">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2020062104</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td>计算机系（学院）</td>
                            <td>计算机信息管理</td>
                            <td>2</td>
                            <td>
                                <a href="javascript:;" class="btn btn-primary btn-2x">编辑</a>
                                <a href="javascript:;" class="btn btn-danger btn-2x">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2020062105</td>
                            <td>杨歆</td>
                            <td>13208250630</td>
                            <td>计算机系（学院）</td>
                            <td>计算机信息管理</td>
                            <td>2</td>
                            <td>
                                <a href="javascript:;" class="btn btn-primary btn-2x">编辑</a>
                                <a href="javascript:;" class="btn btn-danger btn-2x">删除</a>
                            </td>
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


