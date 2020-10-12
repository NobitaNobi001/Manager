<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/student/studentHeader.jsp" %>
<div class="main-right right">
    <!-- 学分列表 start -->
    <div class="credit">
        <h4>我的学分</h4>
        <div class="action" style="text-align: right;margin: 10px 0;padding: 10px 0;">
            <button id="seeSumCredit" class="btn btn-danger" title="点击显示各类明细">总学分:${sumCredit}</button>
        </div>
        <table class="table" border="0" cellspacing="0" cellpadding="0">
            <thead>
            <tr>
                <th>序号</th>
                <th style="text-align: center;">类别</th>
                <th>活动名称</th>
                <th>申报材料</th>
                <th>申报学分</th>
                <th>审核学分</th>
                <th>审核状态</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty requestScope.info.list }">
                <tr>
                    <td colspan="6" align="center">暂无数据记录</td>
                </tr>
            </c:if>

            <c:if test="${!empty requestScope.info.list }">
                <c:forEach var="record" items="${info.list}" varStatus="s">
                    <tr>
                        <td>${s.count+(info.pageNum-1)*5}</td>
                        <td style="text-align: center;">${record.sort}</td>
                        <td>${record.applyName}</td>
                        <td>
                            <button type="button" class="btn btn-default apply-btn" data-container="body"
                                    data-toggle="popover"
                                    data-placement="top" url="applyImg/${record.picture }">查看图片
                            </button>
                        </td>
                        <td>${record.applyCredit}</td>
                        <td>${record.auditCredit}</td>
                        <c:choose>
                            <c:when test="${record.auditState=='已审核' && record.auditCredit>0}">
                                <td>
                                    <button class="btn btn-2x" name="state">已通过</button>
                                </td>
                            </c:when>
                            <c:when test="${record.auditState=='未审核'}">
                                <td>
                                    <button class="btn btn-2x" name="state">未审核</button>
                                </td>
                            </c:when>
                            <c:when test="${record.auditState=='已审核' && record.auditCredit==0}">
                                <td>
                                    <button class="btn btn-2x" name="state">未通过</button>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>

        <c:if test="${!empty requestScope.info.list }">
            <center>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="student/viewCredit.html?page=1">首页</a></li>
                        <c:if test="${info.hasPreviousPage }">
                            <li>
                                <a href="student/viewCredit.html?page=${info.prePage }" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${info.navigatepageNums }" var="page">
                            <c:if test="${page==info.pageNum }">
                                <li class="active"><a href="javascript:void(0)">${page }</a></li>
                            </c:if>
                            <c:if test="${page!=info.pageNum }">
                                <li>
                                    <a href="student/viewCredit.html?page=${page }">${page }</a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${info.hasNextPage }">
                            <li>
                                <a href="student/viewCredit.html?page=${info.nextPage }"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="student/viewCredit.html?page=${info.pages }">末页</a></li>
                        <span style="font-size:15px;margin-left: 5px;line-height: 34px">
										当前第${info.pageNum }页，共${info.pages }页，(${info.total }条记录)
								</span>
                    </ul>
                </nav>
            </center>
        </c:if>
    </div>
    <!-- 学分列表 end -->
</div>
</div>
</div>
</main>
<%@include file="/WEB-INF/common/student/studentFooter.jsp" %>
<!--创新实践学分明细模态框-->
<div class="modal fade" id="SumCreditDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">创新实践学分各申报类别得分情况</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-6 control-label">大学生学科竞赛活动(含大学生创新创业训练项目):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="大学生学科竞赛活动(含大学生创新创业训练项目)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">大学生文体竞赛活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="大学生文体竞赛活动">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">创新创业实践训练(课程):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="创新创业实践训练(课程)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">论文、专利、作品发表:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="论文、专利、作品发表">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">职业(等级)证书:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="职业(等级)证书">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">参与教师科研(或实验室工作):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="参与教师科研(或实验室工作)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">社会实践(调查):</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="社会实践(调查)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">读书活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="读书活动">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">学生工作与社团活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="学生工作与社团活动">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-6 control-label">专业认定的其他创新实践活动:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="sortValue" sort="专业认定的其他创新实践活动">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">总学分:${sumCredit}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--创新实践学分明细模态框-->
</body>
</html>
<script type="text/javascript">
    $(function () {
        var layer = layui.layer;
        var arr = $("button[name='state']");
        $.each(arr, function () {
            if ($(this).text() == "已通过") {
                $(this).addClass("btn-success");
            } else if ($(this).text() == "未审核") {
                $(this).addClass("btn-primary");
            } else {
                $(this).addClass("btn-warning");
            }
        });
        function sumCreditDetail(stuNumber) {
            // 发送ajax请求
            $.ajax({
                url: "student/checkCreditDetail",
                type: "POST",
                data: {"stuNumber": stuNumber},
                dataType: 'json',
                error: function (request) {
                    parent.layer.alert("网络超时,请稍后再试");
                },
                success: function (data) {
                    // 解析模态框里面的数据
                    var sortValues = $("input[name='sortValue']");
                    for (var i = 0; i < sortValues.length; i++) {
                        for (var j = 0; j < data.length; j++) {
                            if ($(sortValues[i]).attr("sort") == data[j].sort) {
                                $(sortValues[i]).val(data[j].sumUp);
                                break;
                            }
                        }
                        if ($(sortValues[i]).val() == "") {
                            $(sortValues[i]).val(0);
                        }
                    }
                }
            });
        }
        // 显示创新学分明细模态框
        $("#seeSumCredit").click(function () {
            // 发送请求查看明细
            sumCreditDetail(${sessionScope.student.stuNumber});
            $("#SumCreditDetail").modal({
                backdrop: "static",
                keyboard: true
            })
        });
        //显示申报图片
        $(document).on("click", ".apply-btn", function () {
            $(this).popover({
                trigger: 'click',
                html: true,
                content: function () {
                    var url = $(this).attr("url");
                    var $div = $("<div style='width: 500px; height:300px;'></div>");
                    var $img = $("<img style='width: 500px; height:300px;'/>");
                    $img.attr("src", url);
                    $img.appendTo($div);
                    return $div;
                }
            });
        })
    })
</script>