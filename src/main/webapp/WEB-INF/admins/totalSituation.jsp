<%--
  分析统计页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>湖北文理学院创新实践学分管理系统</title>

    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

    <link rel="icon" href="static/images/logo.png" type="image/png">
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/manager.css"/>
    <script type="text/javascript" src="static/js/echarts.common.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.min.js"></script>


    <style>
        .selectDiv {
            position: absolute;
            top: 250px;
            right: 50px;
        }
    </style>
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
                    <a href="admins/profile">${admins.college.name }&nbsp;&nbsp;${admins.adminName}(${admins.adminNumber})</a>
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
                    <li><a href="admins/stuList">学生列表</a></li>
                    <li><a href="admins/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admins/profile">个人信息</a></li>
                    <li><a href="admins/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right">
                <div id="picture" style="width:1080px;height: 600px">

                </div>
                <div class="selectDiv">
                    <form class="form-inline">
                        <select name="Grade" class="form-control">
                            <option value="-1">请选择要查看的年级</option>
                        </select>
                        <button type="button" id="sendBtn" class="btn btn-default" title="点击查看年级创新学分比例图">生成比例图</button>
                    </form>
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
<script type="text/javascript">
    // 初始化echarts对象
    var myChart = echarts.init(document.getElementById('picture'));
    var array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var subtextString = '${admins.college.name}';

    // 页面加载完毕后使用
    $(function () {
        QueryGrade();
        display('${admins.collegeId}', $("select[name='Grade']").val());
    });


    function QueryGrade() {
        $.ajax({
            url: "admins/grades",
            type: "GET",
            data: {"collegeId":${admins.collegeId }},
            success: function (result) {
                if (result.code == 100) {
                    $.each(result.extend.grades, function (index, element) {
                        $("select[name='Grade']").append($("<option></option>").val(element).text(element));
                    });
                }
            },
            dataType: "json"
        })

    }

    function display(collegeId, grade) {
        myChart.showLoading();
        $.ajax({
            url: "admins/getCreditProfileWithGrade",
            type: "GET",
            data: {'collegeId': collegeId, 'Grade': grade},
            success: function (result) {
                myChart.hideLoading();
                build_Echars(result);
            },
            dataType: "json"
        });
    }

    $("#sendBtn").click(function () {
        var grade = $("select[name='Grade']").val();
        display('${admins.collegeId}', grade);
        if (grade != -1) {
            subtextString = '${admins.college.name}';
            subtextString = subtextString + grade;
        }
    });

    function build_Echars(result) {
        array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        $.each(result, function (index, item) {
            switch (item.sort) {
                case '大学生学科竞赛活动(含大学生创新创业训练项目)':
                    array[0] = item.sumUp;
                    break;
                case '大学生文体竞赛活动':
                    array[1] = item.sumUp;
                    break;
                case '创新创业实践训练(课程)':
                    array[2] = item.sumUp;
                    break;
                case '论文、专利、作品发表':
                    array[3] = item.sumUp;
                    break;
                case '职业(等级)证书':
                    array[4] = item.sumUp;
                    break;
                case '参与教师科研(或实验室工作)':
                    array[5] = item.sumUp;
                    break;
                case '社会实践(调查)':
                    array[6] = item.sumUp;
                    break;
                case '读书活动':
                    array[7] = item.sumUp;
                    break;
                case '学生工作与社团活动':
                    array[8] = item.sumUp;
                    break;
                case '专业认定的其他创新实践活动':
                    array[9] = item.sumUp;
                    break;
            }
        });
        // 指定图标配置和数据
        var option = {
            title: {
                text: '各类创新活动总分统计图',
                subtext: subtextString,
                subtextStyle: {
                    fontsize: 20,
                    color: '#235894'
                },
                left: '10%'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                right: 'left',
                top: '20%',
                data: ['大学生学科竞赛活动(含大学生创新创业训练项目)', '大学生文体竞赛活动', '创新创业实践训练(课程)',
                    '论文、专利、作品发表', '职业(等级)证书', '参与教师科研(或实验室工作)', '社会实践(调查)',
                    '读书活动', '学生工作与社团活动', '专业认定的其他创新实践活动']
            },
            series: [
                {
                    name: '创新总学分',
                    type: 'pie',
                    radius: '55%',
                    center: ['30%', '65%'],
                    data: [
                        {value: array[7], name: '读书活动'},
                        {value: array[4], name: '职业(等级)证书'},
                        {value: array[6], name: '社会实践(调查)'},
                        {value: array[1], name: '大学生文体竞赛活动'},
                        {value: array[8], name: '学生工作与社团活动'},
                        {value: array[3], name: '论文、专利、作品发表'},
                        {value: array[2], name: '创新创业实践训练(课程)'},
                        {value: array[9], name: '专业认定的其他创新实践活动'},
                        {value: array[5], name: '参与教师科研(或实验室工作)'},
                        {value: array[0], name: '大学生学科竞赛活动(含大学生创新创业训练项目)'},
                    ],
                    emphasis: {
                        itemStyle: {
                            color: "",
                            borderWidth: 3,
                            borderColor: '#235894',
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    label: {
                        fontSize: 17,// 文字的大小
                    },
                    labelLine: {
                        lineStyle: {
                            color: '#235894'// 线的颜色
                        }
                    },
                }
            ]
        }
        myChart.setOption(option);
    }
</script>