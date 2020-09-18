<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/student/studentHeader.jsp" %>
<div class="main-right right">
    <!-- 学分申报 start -->
    <div class="credit">
        <h4>学分申报</h4>
        <div style="float: right;">
            <p class="glyphicon glyphicon-question-sign" title="申报帮助" id="applyHelp"
               style="vertical-align: middle;"></p>
        </div>
        <form class="layui-form form" id="applyForm" enctype="multipart/form-data" style="margin-left: 100px;">
            <input type="hidden" value="${student.stuNumber }" name="stuNumber">
            <input type="hidden" value="${student.stuName }" name="stuName">
            <div class="layui-form-item row item layui-input-inline">
                <label class="layui-form-label">申报类别</label>
                <div class="layui-input-block">
                    <select name="sort" lay-verify="required|sort" required>
                        <option value="0">请选择申报类别</option>
                        <option value="大学生学科竞赛活动(含大学生创新创业训练项目)">大学生学科竞赛活动(含大学生创新创业训练项目)</option>
                        <option value="大学生文体竞赛活动">大学生文体竞赛活动</option>
                        <option value="创新创业实践训练(课程)">创新创业实践训练(课程)</option>
                        <option value="论文、专利、作品发表">论文、专利、作品发表</option>
                        <option value="职业(等级)证书">职业(等级)证书</option>
                        <option value="参与教师科研(或实验室工作)">参与教师科研(或实验室工作)</option>
                        <option value="社会实践(调查)">社会实践(调查)</option>
                        <option value="读书活动">读书活动</option>
                        <option value="学生工作与社团活动">学生工作与社团活动</option>
                        <option value="专业认定的其他创新实践活动">专业认定的其他创新实践活动</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item row item">
                <label class="layui-form-label">活动名称</label>
                <div class="layui-input-block">
                    <input type="text" name="applyName" required lay-verify="applyName" placeholder="请填写申报的创新活动名称"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item row item">
                <label class="layui-form-label">申报学分</label>
                <div class="layui-input-block">
                    <input type="number" name="applyCredit" required lay-verify="required|applyCredit"
                           placeholder="请填写申报学分" autocomplete="off"
                           class="layui-input" max="8" min="0.5" step="0.5">
                </div>
            </div>

            <div class="layui-form-item layui-form-text row item">
                <label class="layui-form-label">上传图片</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="file">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                    <div class="img-box">
                        <img src="" alt="" class="show-img">
                    </div>
                </div>
            </div>

            <div class="layui-form-item layui-form-text row item">
                <label class="layui-form-label">申报描述</label>
                <div class="layui-input-block">
                    <textarea name="words" placeholder="填写申报描述(备注内容,选填)" class="layui-textarea"></textarea>
                </div>
            </div>


            <div class="layui-form-item row item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="submitBtn">提交申报</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <!-- 学分申报 end -->
</div>
</div>
</div>
</main>
<%@include file="/WEB-INF/common/student/studentFooter.jsp" %>
<!--申报帮助模态框-->
<div class="modal fade" id="applyHelpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">申报帮助</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--申报帮助模态框-->
</body>
</html>
<script type="text/javascript" src="static/js/student/creditDeclare.js"></script>

