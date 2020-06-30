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
							<a href="javascript:;">湖北文理学院&nbsp;&nbsp;${student.name}(${student.stuNumber})</a>
							<a href="/login.jsp">退出</a>
						</div>
					</div>
					<div class="menu">
						<ul>
							<li class="title"><a href="javascript:;">学生中心</a></li>
							<li><a href="${APP_PATH}/student/stuIndex">首页</a></li>
							<li><a href="${APP_PATH}/student/toupdataInfo/${student.id}">个人信息</a></li>
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
							<li><a href="credit.jsp">学分列表</a></li>
							<li><a href="declare.jsp">学分申报</a></li>
							<li class="headline"><a href="javascript:;">账号管理</a></li>
							<li><a href="${APP_PATH}/student/toupdataInfo/${student.id}">完善信息</a></li>
							<li><a href="${APP_PATH}/student/toupdatepwd/${student.id}">修改密码</a></li>
						</ul>
					</div>
					<div class="main-right right">
						<!-- 学分申报 start -->
						<div class="credit">
							<h4>学分申报</h4>
							<form action="" method="post" class="form">
								<div class="row item">
									<div class="col col-2 name">申报项</div>
									<div class="col col-6 value">
										<select name="credit">
											<option value="0">请选择申报项目</option>
											<option value="0">大学生学科竞赛活动（含大学生创新创业训练项目）</option>
											<option value="0">大学生文体竞赛活动</option>
											<option value="0">创新创业实践训练（课程）</option>
											<option value="0">论文、专利、作品发表</option>
											<option value="0">职业（等级）证书</option>
											<option value="0">参与教师科研（或实验室工作）</option>
											<option value="0">社会实践（调查）</option>
											<option value="0">读书活动</option>
											<option value="0">学生工作与社团活动</option>
											<option value="0">专业认定的其他创新实践活动</option>
										</select>
										<div class="notice">请选择要申报的项目</div>
									</div>
								</div>
								<div class="row item">
									<div class="col col-2 name">申报学分</div>
									<div class="col col-4 value">
										<input type="number" name="score" value="0" />
										<div class="notice">请填写申报学分</div>
									</div>
								</div>
								<div class="row item">
									<div class="col col-2 name">申报材料</div>
									<div class="col col-7 value">
										<input type="file" name="file" />
										<div class="notice">请选择要上传的申报材料</div>
									</div>
								</div>
								<div class="row item">
									<div class="col col-2 name">描述</div>
									<div class="col col-8 value">
										<textarea name="content" id="content" cols="30" rows="10"></textarea>
										<div class="notice">填写申报描述备注内容</div>
									</div>
								</div>
								<div class="row item">
									<div class="col col-2 name">&nbsp;</div>
									<div class="col value"><button type="button" class="btn btn-primary btn-6x">提交申报</button></div>
								</div>
							</form>
						<!-- 学分申报 end -->
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
