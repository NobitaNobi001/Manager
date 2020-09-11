<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>404</title>
	</head>
	<body>
		<style type="text/css">
			*{margin: 0;padding: 0;}
			html, body{height: 100%;}
			#notFound{display: flex;align-items: center;justify-content: center;height: 100%;text-align: center;}
			#notFound .not-found{font-size: 20px;}
			#notFound .not-found .icon{display: flex;justify-content: center;align-items: center;}
			#notFound .not-found .icon div{color: #f70;margin: 10px;text-align: center;font-size: 200px;font-family: '黑体';}
			#notFound .not-found .icon div.txt{background-color: #f70;color: #fff;font-size: 18px;width: 120px;height: 120px;line-height: 120px;border-radius: 50%;font-weight: bold;}
			#notFound .not-found .notice{color: #f70;font-size: 30px;margin-top: 30px;}
			#notFound .not-found .btn{padding: 100px 0;}
			#notFound .not-found .btn a{background-color: #496;text-decoration: none;padding: 10px 20px;color: #fff;font-size: 18px;display: inline-block;margin: 0 40px;border-radius: 5px;}
		</style>
		<div id="notFound">
			<div class="not-found">
				<div class="icon">
					<div>4</div>
					<div class="txt">Not Found</div>
					<div>4</div>
				</div>
				<div class="btn">
					<a href="/logout">返回登录页</a>
					<a href="javascript:;" onclick="history.back();">返回上一页</a>
				</div>
			</div>
		</div>
	</body>
</html>
