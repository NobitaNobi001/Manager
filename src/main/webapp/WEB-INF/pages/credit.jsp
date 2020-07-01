<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>湖北文理学院创新学分系统</title>
		<%
			pageContext.setAttribute("APP_PATH", request.getContextPath());
		%>
		<link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
		<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css" />
		<link rel="stylesheet" type="text/css" href="${APP_PATH}/webjars/bootstrap/3.3.5/css/bootstrap.css" />
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
							<a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.stuName}(${student.stuNumber})</a>
							<a href="/login.jsp">退出</a>
						</div>
					</div>
					<div class="menu">
						<ul>
							<li class="title"><a href="javascript:;">学生中心</a></li>
							<li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
							<li><a href="${APP_PATH}/student/toupdateInfo/${student.id}">个人信息</a></li>
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
							<li><a href="${APP_PATH}/student/toViewCredit/${student.id}">学分列表</a></li>
							<li><a href="${APP_PATH}/student/toApply/${student.id}">学分申报</a></li>
							<li class="headline"><a href="javascript:;">账号管理</a></li>
							<li><a href="${APP_PATH}/student/toupdateInfo/${student.id}">完善信息</a></li>
							<li><a href="${APP_PATH}/student/toupdatepwd/${student.id}">修改密码</a></li>
						</ul>
					</div>
					<div class="main-right right">
						<!-- 学分列表 start -->
						<div class="credit">
							<h4>我的学分</h4>
							<div class="action" style="text-align: right;margin: 10px 0;padding: 10px 0;">
								<a href="javascript:;" class="btn btn-danger">学分汇总</a>
							</div>
							<table class="table" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>序号</th>
									<th style="text-align: left;">名称</th>
									<th>学分</th>
									<th>操作</th>
								</tr>
								<tr>
									<td>1</td>
									<td style="text-align: left;">大学生学科竞赛活动（含大学生创新创业训练项目）</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-primary btn-2x">审核中</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td style="text-align: left;">大学生文体竞赛活动</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-primary btn-2x">审核中</a></td>
								</tr>
								<tr>
									<td>3</td>
									<td style="text-align: left;">创新创业实践训练（课程）</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-success btn-2x">已完成</a></td>
								</tr>
								<tr>
									<td>4</td>
									<td style="text-align: left;">论文、专利、作品发表</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-primary btn-2x">审核中</a></td>
								</tr>
								<tr>
									<td>5</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-primary btn-2x">审核中</a></td>
								</tr>
								<tr>
									<td>6</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-success btn-2x">已完成</a></td>
								</tr>
								<tr>
									<td>7</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-warning btn-2x">未成功</a></td>
								</tr>
								<tr>
									<td>8</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-success btn-2x">已完成</a></td>
								</tr>
								<tr>
									<td>9</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-success btn-2x">已完成</a></td>
								</tr>
								<tr>
									<td>10</td>
									<td style="text-align: left;">职业（等级）证书</td>
									<td>2</td>
									<td><a href="javascript:;" class="btn btn-default btn-2x">已取消</a></td>
								</tr>
							</table>
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li>
										<a href="#" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li>
										<a href="#" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
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
<script src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>