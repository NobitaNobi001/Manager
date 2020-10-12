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
    <script type="text/javascript" src="webjars/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="static/js/echarts.common.js"></script>
    <style>
        .selectDiv{
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
                    <a href="admin/admProfile">${admin.adminName}(${admin.adminNumber})</a>
                    <a href="logout">退出</a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li class="title"><a href="javascript:;">管理中心</a></li>
                    <li><a href="admin/index">首页</a></li>
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
                    <li><a href="admin/get/student.html">学生管理</a></li>
                    <li><a href="admin/teaManager">教师管理</a></li>
                    <li><a href="admin/watManager">督查管理</a></li>
                    <li><a href="admin/admManager">学院管理</a></li>
                    <li><a href="admin/situation">学分概览</a></li>
                    <li class="headline"><span>账号管理</span></li>
                    <li><a href="admin/admProfile">个人信息</a></li>
                    <li><a href="admin/password">修改密码</a></li>
                </ul>
            </div>
            <div class="main-right right" >
                <div  id="picture" style="width:1080px;height: 600px">

                </div>
                <div class="selectDiv">
                    <form class="form-inline" action="admins/getCreditProfile">
                        <select name="college" class="form-control">
                            <option value="-1">请选择学院</option>
                            <c:forEach items="${applicationScope.colleges }" var="college">
                                <c:if test="${college.id ne 19}">
                                    <option value="${college.id }">${college.name }</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <button type="button" id="sendBtn" class="btn btn-default" title="点击查看二级学院创新学分比例图">生成比例图</button>
                    </form>
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
    var array=[0,0,0,0,0,0,0,0,0,0];
    var subtextString='';
    // 页面加载完毕后使用
    $(function () {
        display('-1');
    });

    function display(collegeId) {
        myChart.showLoading();
        switch (collegeId) {
            case '-1':
                subtextString='包括所有二级学院';break;
            case '1':
                subtextString='马克思主义学院';break;
            case '2':
                subtextString='政法学院';break;
            case '3':
                subtextString='教育学院';break;
            case '4':
                subtextString='体育学院';break;
            case '5':
                subtextString='文学与传媒学院';break;
            case '6':
                subtextString='外国语学院';break;
            case '7':
                subtextString='数学与统计学院';break;
            case '8':
                subtextString='物理与电子工程学院';break;
            case '9':
                subtextString='计算机工程学院';break;
            case '10':
                subtextString='汽车与交通工程学院';break;
            case '11':
                subtextString='机械工程学院';break;
            case '12':
                subtextString='土木工程与建筑学院';break;
            case '13':
                subtextString='食品科学技术学院·化学工程学院';break;
            case '14':
                subtextString='医学院';break;
            case '15':
                subtextString='资源环境与旅游学院';break;
            case '16':
                subtextString='经济管理学院';break;
            case '17':
                subtextString='美术学院';break;
            case '18':
                subtextString='音乐与舞蹈学院';break;
        }
        console.log(subtextString);
        $.ajax({
            url: "admin/getCreditProfile",
            type: "GET",
            data:{'collegeId':collegeId},
            success: function (result) {
                myChart.hideLoading();
                console.log(result);
                build_Echars(result);
            },
            dataType: "json"
        });
    }

    $("#sendBtn").click(function () {
        display($("select[name='college']").val());
    });

    function build_Echars(result) {
        array=[0,0,0,0,0,0,0,0,0,0];
        $.each(result,function (index,item) {
          switch (item.sort) {
              case '大学生学科竞赛活动(含大学生创新创业训练项目)':
                array[0]=item.sumUp;
                break;
              case '大学生文体竞赛活动':
                array[1]=item.sumUp;
                break;
              case '创新创业实践训练(课程)':
                  array[2]=item.sumUp;
                  break;
              case '论文、专利、作品发表':
                  array[3]=item.sumUp;
                  break;
              case '职业(等级)证书':
                  array[4]=item.sumUp;
                  break;
              case '参与教师科研(或实验室工作)':
                  array[5]=item.sumUp;
                  break;
              case '社会实践(调查)':
                  array[6]=item.sumUp;
                  break;
              case '读书活动':
                  array[7]=item.sumUp;
                  break;
              case '学生工作与社团活动':
                  array[8]=item.sumUp;
                  break;
              case '专业认定的其他创新实践活动':
                  array[9]=item.sumUp;
                  break;
          }
        });
        // 指定图标配置和数据
        var option={
            title: {
                text: '各类创新活动总分统计图',
                subtext:subtextString,
                subtextStyle: {
                    fontsize:20,
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
                top:'20%',
                data: ['大学生学科竞赛活动(含大学生创新创业训练项目)', '大学生文体竞赛活动', '创新创业实践训练(课程)',
                    '论文、专利、作品发表', '职业(等级)证书','参与教师科研(或实验室工作)','社会实践(调查)',
                    '读书活动','学生工作与社团活动','专业认定的其他创新实践活动']
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
                            color:"",
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
