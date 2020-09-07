<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/studentHeader.jsp"%>
            <div class="main-right right">
                <!--个人信息 start-->
                <div class="col-lg-8 col-lg-offset-2">
                    <h4>个人信息</h4>
                    <form class="form-horizontal" action="student/updateStuNullInfo.html" method="post">
                        <input type="hidden" value="${student.id }" name="id">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">姓名</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" value="${student.stuName }"  readonly >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">院系</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" value="${student.college.name }"  readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">班级</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" value="${student.className }"  readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label ">性别</label>
                            <div class="col-lg-9">
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
                            <div class="col-lg-9">
                                <input type="text" name="phone" class="form-control" value="${student.phone }"  placeholder="请输入手机号码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">邮箱</label>
                            <div class="col-lg-9">
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
<%@include file="/WEB-INF/common/studentFooter.jsp"%>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //性别的checked选中
        var gender = '${student.gender }';
        if ($("#male").val() == gender) {
            $("#male").prop("checked", "checked");
        } else {
            $("#female").prop("checked", "checked");
        }


        $('#credit form').bootstrapValidator({
            // 通用提示语
            message: 'This value is not valid',
            // 提示字体图标
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            // enabled 字段值有变化就触发验证 disabled提交之后才触发
            live: 'disabled',
            fields: {
                phone: {
                    validators: {
                        digits: {
                            message: '手机号码只能输入数字'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '手机号只支持支持11位数'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式错误'
                        }
                    }
                }
            }
        });
    });


</script>