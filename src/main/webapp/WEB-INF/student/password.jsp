<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/student/studentHeader.jsp"%>
            <div class="main-right right">
                <!-- 修改密码 start -->
                <div class="credit">
                    <h4>修改密码</h4>
                    <form class="form-horizontal" id="updatePwdForm" action="student/updateStuPassword.html">
                        <input type="hidden" name="stuNumber" value="${student.stuNumber }">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">原密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="oldPassword" placeholder="请输入您的原有密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">新密码</label>
                            <div class="col-lg-5">
                                <div class="input-group">
                                <span class="input-group-addon">
                                <i class="glyphicon glyphicon-eye-open" id="eye"></i>
                                </span>
                                    <input type="password" class="form-control" name="newPassword"
                                           placeholder="请输入您的新密码"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">确认密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="confirmPassword"
                                       placeholder="请输入确认密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" id="submitBtn"><i
                                        class="glyphicon glyphicon-ok"></i>提交修改
                                </button>
                                <button type="button" class="btn btn-info" id="resetBtn"><i
                                        class="glyphicon glyphicon-refresh"></i>重置输入
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- 修改密码 end -->
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/WEB-INF/common/student/studentFooter.jsp"%>
</body>
</html>
<script type="text/javascript" src="static/js/student/password.js"></script>