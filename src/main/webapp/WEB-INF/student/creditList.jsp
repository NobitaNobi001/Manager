<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/studentHeader.jsp"%>
            <div class="main-right right">
                <!-- 学分列表 start -->
                <div class="credit">
                    <h4>我的学分</h4>
                    <div class="action" style="text-align: right;margin: 10px 0;padding: 10px 0;">
                        <a href="javascript:void(0);" class="btn btn-danger">总学分:${sumCredit}</a>
                    </div>
                    <table class="table" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th style="text-align: center;">类别</th>
                            <th>名称</th>
                            <th>申请学分</th>
                            <th>审核学分</th>
                            <th>申报状态</th>
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
<%@include file="/WEB-INF/common/studentFooter.jsp"%>
</body>
</html>
<script>
    var arr = $("button [name='state']");

    $.each(arr, function () {
        if ($(this).text() == "已通过") {
            $(this).addClass("btn-success");
        } else if ($(this).text() == "未审核") {
            $(this).addClass("btn-primary");
        } else {
            $(this).addClass("btn-warning");
        }
    })
</script>
