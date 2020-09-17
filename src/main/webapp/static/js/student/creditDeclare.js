// 下拉列表选中
var sortName = '${sessionScope.applySort }';
if (typeof sortName != "undefined" && sortName != null && sortName != "") {
    $("#applyForm select[name='sort']").val([sortName]);
}

// 点击问号弹出模态框
$("#applyHelp").click(function () {
    $("#applyHelpModal").modal({
        backdrop: "static"
    });
});


let imgfile = null;
layui.use('upload', function () {
    var upload = layui.upload; //得到 upload 对象
    var $ = layui.jquery;
    //创建一个上传组件
    upload.render({
        elem: '#file',
        auto: false,  // 取消自动上传
        size: 1024 * 10,// 10M
        field: 'file',//自定义图片参数为img
        accept: 'images',// 允许上传的文件类型
        acceptMime: 'image/*',
        multiple: false,// 取消多文件上传
        // 选择文件后的回调函数
        choose: function (obj) {
            obj.preview(function (index, file, result) {
                imgfile = file;
                $('.img-box').show()
                $('.show-img').attr("src", result);
                $('.show-img').attr("data-original", result);
                const viewer = new Viewer(document.querySelector('.show-img'), {
                    url: 'data-original'
                });
            });
        }
    })
});

layui.use('form', function () {
    var form = layui.form;
    form.verify({
        applyName: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (!value) {
                return '请填写申报活动名称'
            }
        }
        , applyCredit: function (value, item) {
            if (value <= 0) {
                return "申报创新学分必须大于0小于8,可保留2位小数"
            }
            if (value >= 8) {
                return "申报创新学分必须大于0小于8,可保留2位小数"
            }
            if (value.toString().length > 4) {
                return "申报创新学分必须大于0小于8,可保留2位小数"
            }
        }
    });

    //监听提交
    form.on('submit(submitBtn)', function (data) {
        if (!imgfile) {
            layer.msg('请上传图片');
            return false
        } else {
            var formData = new FormData();
            formData.append('stuNumber', $("input[name='stuNumber']").val());
            formData.append('stuName', $("input[name='stuName']").val());
            formData.append('sort', $("select[name='sort']").val());
            formData.append('applyName', $("input[name='applyName']").val());
            formData.append('applyCredit', $("input[name='applyCredit']").val());
            formData.append('words', $("textarea[name='words']").val());
            formData.append('file', imgfile);
            $.ajax({
                url: "student/apply.html",
                type: "POST",
                data: formData,
                cache: false,//上传文件无需缓存
                contentType: false, //jax 中 contentType 设置为 false 是为了避免 JQuery 对其操作，从而失去分界符，而使服务器不能正常解析文件
                processData: false, //当设置为true的时候,jquery ajax 提交的时候不会序列化 data，而是直接使用data
                dataType: 'json',
                error: function (request) {
                    parent.layer.alert("网络超时,请稍后再试");
                },
                success: function (data) {
                    var iconCode = data.code == 100 ? 1 : 2;
                    layer.msg(data.extend.result, {icon: iconCode, time: 3000});
                }
            });
        }
        return false;//阻止表单跳转
    });
});