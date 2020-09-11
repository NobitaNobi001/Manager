<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%@include file="/WEB-INF/common/student/studentHeader.jsp"%>
            <div class="main-right right">
                <div class="userinfo">
                    <div class="avatar">
                        <div class="head"></div>
                    </div>
                    <div class="info">
                        <div class="username">${student.stuName }</div>
                    </div>
                    <div class="department"><span>${student.college.name }</span></div>
                    <div class="major"><span>${student.major}</span></div>
                    <div class="className"><span>${student.className }</span></div>
                </div>
                <!-- 学分申请 start -->
                <div class="declare">
                    <h4>学分申报</h4>
                    <ul>
                        <li>
                            <div>大学生学科竞赛活动(含大学生创新创业训练项目)</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/1/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>大学生文体竞赛活动</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/2/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>创新创业实践训练(课程)</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/3/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>论文、专利、作品发表</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/4/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>职业(等级)证书</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/5/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>参与教师科研(或实验室工作)</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/6/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>社会实践(调查)</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/7/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>读书活动</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/8/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>学生工作与社团活动</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/9/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                        <li>
                            <div>专业认定的其他创新实践活动</div>
                            <div name="declareSort"><a href="student/applyCreditWithSort/sort/10/.html" class="btn btn-success btn-2x">立即申报</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 学分申请 end -->
            </div>
        </div>
    </div>
</main>
<%@include file="/WEB-INF/common/student/studentFooter.jsp"%>
</body>
</html>
<script type="text/javascript">
    $(function () {
        var stuName = '${student.stuName}';
        $('.avatar .head').append(stuName.substr(stuName.length - 1, 1));
    })

    // 学分申报类型鼠标悬浮效果
    $("div [name='declareSort']").hover(function () {
        $(this).children().removeClass("btn-success").addClass("btn-danger");
    },function () {
        $(this).children().removeClass("btn-danger").addClass("btn-success");
    })
</script>
