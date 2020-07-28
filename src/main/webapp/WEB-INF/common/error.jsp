<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="Jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("button").click(function () {
                window.history.back();
            });
        });
    </script>
    <style>
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div>
                <a class="navbar-brand" href="admin/to/login.html" style="font-size: 32px;">众筹网</a>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <h3 style="text-align: center;"><font color="red">${requestScope.exception.message}</font></h3>
    <button style="width: 150px;margin: 50px auto 0px auto;" class="btn btn-lg btn-success btn-block">点我返回上一步</button>
</div>
</body>
</html>

