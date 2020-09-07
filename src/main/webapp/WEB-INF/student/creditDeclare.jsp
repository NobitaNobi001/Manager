<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/studentHeader.jsp"%>
            <div class="main-right right">
                <!-- 学分申报 start -->
                <div class="credit">
                    <h4>学分申报</h4>
                    <p class="glyphicon glyphicon-question-sign" title="申报帮助" id="applyHelp" style="vertical-align: middle;"></p>
                    <form action="student/apply.html"  class="layui-form"  id="applyForm">
                        <input type="hidden" value="${student.stuNumber }" name="stuNumber">
                        <input type="hidden" value="${student.stuName }" name="stuName">
                        <div class="layui-form-item">
                            <label class="layui-form-label">申报类别</label>
                            <div class="layui-input-block">
                                <select name="sort" lay-verify="required">
                                    <option value=""></option>
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


                        <div class="layui-form-item">
                            <label class="layui-form-label">活动名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="applyName" required lay-verify="applyName" placeholder="请填写申报的创新活动名称" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <label class="layui-form-label">申报学分</label>
                            <div class="layui-input-block">
                                <input type="number" name="applyCredit" required lay-verify="required|applyCredit" placeholder="请填写申报学分" autocomplete="off"
                                       class="layui-input" max="8" min="0.5" step="0.25">
                            </div>
                        </div>

                        <div class="layui-form-item layui-form-text">
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

                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">申报描述</label>
                            <div class="layui-input-block">
                                <textarea name="words" placeholder="填写申报描述(备注内容,选填)" class="layui-textarea"></textarea>
                            </div>
                        </div>


                        <div class="layui-form-item">
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
<%@include file="/WEB-INF/common/studentFooter.jsp"%>
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
<script type="text/javascript">
    // 下拉列表选中
    var sortName='${sessionScope.applySort }';
    if(typeof sortName!="undefined" && sortName!=null &&sortName!=""){
        $("#applyForm select[name='sort']").val([sortName]);
    }

    // 点击问号弹出模态框
    $("#applyHelp").click(function () {
        $("#applyHelpModal").modal({
            backdrop: "static"
        });
    });


    let imgfile = null;
    layui.use('upload',function(){
        var upload = layui.upload; //得到 upload 对象
        var $ = layui.jquery
        //创建一个上传组件
        upload.render({
            elem: '#file',
            auto: false,  // 取消自动上传
            size:1024*10,// 10M
            field: 'img',//自定义图片参数为img
            accept: 'images' ,// 允许上传的文件类型
            acceptMime: 'image/*',
            multiple: false,// 支持多文件上传
            bindAction: '.layui-btn',
            // 选择文件后的回调函数
            choose:function(obj){
                obj.preview(function (index, file, result) {
                    imgfile = file;
                    $('.img-box').show()
                    $('.show-img').attr("src", result);
                    $('.show-img').attr("data-original", result);
                    const viewer = new Viewer(document.querySelector('.show-img'), {
                        url:'data-original'
                    });
                });
            }
        })
    });

    layui.use('form', function () {
        var form = layui.form;
        form.verify({
            applyName: function (value, item) { //value：表单的值、item：表单的DOM对象
                if(!value){
                    return '申报活动名称不能为空'
                }
            }
            , applyCredit: [
                /^[0-9]{1}(.[0-9])?$/
                , '申报一次创新学分必须大于0小于8'
            ]
        });

        //监听提交
        form.on('submit(submitBtn)', function (data) {
            console.log(data.field,imgfile)
            if(!imgfile){
                layer.msg('请上传图片');
                return false
            }else{
                //请求接口
                var formData = new FormData($( "#applyForm" )[0]);
                $.ajax({
                    cache : true,
                    type : "post",
                    url : "student/apply.html",
                    data : formData,
                    async : false,
                    contentType: false,   //jax 中 contentType 设置为 false 是为了避免 JQuery 对其操作，从而失去分界符，而使服务器不能正常解析文件
                    processData: false,   //当设置为true的时候,jquery ajax 提交的时候不会序列化 data，而是直接使用data
                    error : function(request) {
                        parent.layer.alert("网络超时");
                    },
                    success : function(data) {
                        if (data.code == 0) {
                            parent.layer.msg("操作成功");
                            parent.reLoad();
                            //注意这两句
                            var index = parent.layer.getFrameIndex(window.name);///先得到当前iframe层的索引
                            parent.layer.close(index);//再执行关闭，保存、修改页面完成时要获取当前页面并关闭回到上级页面（list页面）起到刷新返回功能
                        } else {
                            parent.layer.alert(data.msg)
                        }
                    }
                });
            }
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>

