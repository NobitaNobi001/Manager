<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/student/studentHeader.jsp"%>
            <div class="main-right right">
                <!--个人信息 start-->
                <div class="credit">
                    <h4>个人信息</h4>
                    <form class="form-horizontal form" action="student/updateStuNullInfo.html" method="post">
                        <input type="hidden" value="${student.id }" name="id">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">姓名</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" value="${student.stuName }"  readonly >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">院系</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" value="${student.college.name }"  readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">班级</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" value="${student.className }"  readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label ">性别</label>
                            <div class="col-lg-4">
                            <label class="radio-inline">
                                    <input type="radio" name="gender" value="男" id="male"/>男
                            </label>
                            <label class="radio-inline">
                                    <input type="radio" name="gender" value="女" id="female"/>女
                            </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">手机号码</label>
                            <div class="col-lg-4">
                                <input type="text" name="phone" class="form-control" value="${student.phone }"  placeholder="请输入手机号码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">邮箱</label>
                            <div class="col-lg-4">
                                <input type="text" name="email" class="form-control" value="${student.email }"  placeholder="请输入邮箱地址"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary"><i
                                        class="glyphicon glyphicon-ok"></i>提交修改
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/WEB-INF/common/student/studentFooter.jsp"%>
</body>
</html>
<script type="text/javascript" src="static/js/student/profile.js"></script>