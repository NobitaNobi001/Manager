<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<title>湖北文理学院创新学分系统</title>
	<link rel="icon" href="${APP_PATH}/static/images/logo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"/>
	<script type="text/javascript" src="${APP_PATH}/webjars/jquery/3.1.1/jquery.js"></script>
	<script type="text/javascript" src="${APP_PATH}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
					<a href="${APP_PATH}/watcher/watProfile" style="font-size: 14px; color: #337ab7;">
						${watcher.watcherName }(${watcher.watcherNumber })</a>
					<a href="${APP_PATH}/logout" style="font-size: 14px; color: #337ab7;">退出</a>
				</div>
			</div>
			<div class="menu">
				<ul>
					<li class="title"><a href="javascript:;">督查中心</a></li>
					<li><a href="${APP_PATH}/watcher/watIndex">首页</a></li>
					<li><a href="${APP_PATH}/watcher/watProfile">个人信息</a></li>
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
					<li><a href="${APP_PATH}/watcher/fraction">学生学分</a></li>
					<li><a href="${APP_PATH}/watcher/watAudit">教师审核</a></li>
					<li class="headline"><a href="javascript:;">账号设置</a></li>
					<li><a href="${APP_PATH}/watcher/watProfile">个人信息</a></li>
					<li><a href="${APP_PATH}/watcher/watPassword">修改密码</a></li>
				</ul>
			</div>
			<div class="main-right right">
				<!-- 学分列表 start -->
				<div class="student">
					<h4>学生学分列表</h4>
					<form class="action" action="${APP_PATH}/college/conditionSearch" method="post">
						<div>
							<select name="college">
								<option>请选择院系</option>
							</select>
						</div>
						<div>
							<select name="major">
								<option>请选择专业</option>
							</select>
						</div>
						<div>
							<select name="class">
								<option>请选择班级</option>
							</select>
						</div>
						<div>
							<input type="text" name="keywords" id="keywords" placeholder="请输入搜索关键字"/>
							<button type="submit">搜索</button>
						</div>
					</form>
					<table class="table" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>序号</th>
							<th>学号</th>
							<th>姓名</th>
							<th>院系</th>
							<th>专业</th>
							<th>班级</th>
							<th>总学分</th>
						</tr>
						<c:forEach var="student" varStatus="s" items="${info.list}">
							<tr>
								<td>${s.count+(info.pageNum-1)*5}</td>
								<td>${student.stuNumber}</td>
								<td>${student.stuName}</td>
								<td>${student.college.name}</td>
								<td>${student.major}</td>
								<td>${student.className}</td>
								<td>${student.sumCredit}</td>
							</tr>
						</c:forEach>
					</table>
					<center>
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li><a href="${APP_PATH}/watcher//fraction?page=1">首页</a></li>
								<c:if test="${info.pageNum==1}">
									<li class="disabled">
										<a href="javascript:void(0)" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>

								<c:if test="${info.pageNum!=1}">
									<li>
										<a href="${APP_PATH}/watcher//fraction?page=${info.pageNum-1}"
										   aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>

								<c:if test="${info.pages<=5}">
									<c:forEach begin="1" end="${info.pages}" var="i">
										<c:if test="${info.pageNum==i}">
											<li class="active"><a
													href="${APP_PATH}/watcher//fraction?page=${i}">${i}</a></li>
										</c:if>
										<c:if test="${info.pageNum!=i}">
											<li><a href="${APP_PATH}/watcher//fraction?page=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
								</c:if>

								<c:if test="${info.pages>5}">
									<c:forEach begin="1" end="5" var="i">
										<c:if test="${info.pageNum==i}">
											<li class="active"><a
													href="${APP_PATH}/watcher//fraction?page=${i}">${i}</a></li>
										</c:if>
										<c:if test="${info.pageNum!=i}">
											<li><a href="${APP_PATH}/watcher//fraction?page=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
								</c:if>


								<c:if test="${info.pageNum==info.pages}">
									<li class="disabled">
										<a href="javascript:void(0)" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>

								<c:if test="${info.pageNum!=info.pages}">
									<li>
										<a href="${APP_PATH}/watcher//fraction?page=${info.pageNum+1}"
										   aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>

								<li><a href="${APP_PATH}/watcher//fraction?page=${info.pages}">末页</a></li>
								<span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum}页，共${info.pages}页，(${info.total}条记录)
									</span>
							</ul>
						</nav>
					</center>
				</div>
				<!-- 学分列表 end -->
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
	//创建学院数组
	var arr = new Array(
			"马克思主义学院",
			"政法学院",
			"教育学院",
			"体育学院",
			"文学与传媒学院",
			"外国语学院",
			"数学与统计学院",
			"物理与电子工程学院",
			"计算机工程学院",
			"汽车与交通工程学院",
			"机械工程学院",
			"土木工程与建筑学院",
			"食品科学技术学院·化学工程学院",
			"医学院",
			"资源环境与旅游学院",
			"经济管理学院",
			"美术学院",
			"音乐与舞蹈学院"
	);
	$(function () {
		initCollege();
		// 更改学院后的操作
		$("select[name='college']").change(function () {

			var collegeCode = $("select[name='college']").val();

			getMajor(collegeCode);

		});

		// 更改专业后的操作
		$("select[name='major']").change(function () {
			var collegeCode = $("select[name='college']").val();
			var majorCode = $("select[name='major']").val();
			getClass(collegeCode, majorCode);
		});
	});

	function initCollege() {
		// 若是校级督察就将十八个学院全部添加到下拉框中
		if ("${watcher.collegeId }" == 19) {

			for (var i = 0; i < arr.length; i++) {
				$("select[name='college']").append($("<option></option>").val(i + 1).text(arr[i]));
			}
			//设置value值为0的学院为默认选中
			$("#college").find("option[value='1']").attr("selected", true);

		} else {
			$("select[name='college']").append(("<option value='${watcher.collegeId }'>${watcher.college.name }</option>"));
		}
	};

	function getMajor(collegeCode) {
		var firstMajorCode;
		// ajax请求所有市级单位
		$.get("${APP_PATH}/college/getMajor", {
			"collegeId": collegeCode
		}, function (data) {
			// 先清空专业下拉框
			$("select[name='major']").empty();
			$.each(data, function (index, element) {
				$("select[name='major']").append($("<option></option>").val(element).text(element));
			});
			firstMajorCode = data[0];
			// 根据第一个专业code获取对应班级
			getClass(collegeCode, firstMajorCode);
		}, 'json');
	};

	function getClass(collegeCode, majorCode) {
		// ajax请求所有班级
		$.get("${APP_PATH}/college/getClass", {
			"collegeId": collegeCode,
			"major": majorCode
		}, function (data) {
			console.log(data);
			// 先清空班级下拉框
			$("select[name='class']").empty();
			$.each(data, function (index, element) {
				$("select[name='class']").append($("<option></option>").val(element).text(element));
			});
		}, 'json');
	};
</script>
