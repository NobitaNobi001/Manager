//当前页
var currentPage = 0;

//解析分页条信息
function build_page_nav(result) {
    //清空原有数据
    $("#page_nav_area").empty();
    var ul = $("<ul></ul>").addClass("pagination");

    //构建分页条元素
    //首页及前一页
    var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
    var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

    //如果在首页 那么首页和前一页添加禁用
    if (result.extend.pageInfo.hasPreviousPage == false) {
        firstPageLi.addClass("disabled");
        prePageLi.addClass("disabled");
    } else {

        //为元素添加翻页事件
        firstPageLi.click(function () {
            to_page(1);
        });
        prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum - 1);
        });
    }

    //构建下一页和末页元素
    var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));

    //如果在末页 那么末页和下一页添加禁用
    if (result.extend.pageInfo.hasNextPage == false) {
        nextPageLi.addClass("disabled");
        lastPageLi.addClass("disabled");
    } else {
        //点击末页去到最后一页
        lastPageLi.click(function () {
            to_page(result.extend.pageInfo.pages);
        });

        //点击下一页去到下一页
        nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum + 1);
        });
    }

    //首页和上一页添加到分页条
    ul.append(firstPageLi).append(prePageLi);

    //添加页码提示
    $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

        var numLi = $("<li></li>").append($("<a></a>").append(item));
        if (result.extend.pageInfo.pageNum == item) {
            numLi.addClass("active");
        }
        numLi.click(function () {
            to_page(item);
        });

        ul.append(numLi);
    });

    //下一页和末页的提示
    ul.append(nextPageLi).append(lastPageLi);

    //把ul添加到nav元素
    var nav = $("<nav></nav>").append(ul);
    //把nav添加到页码栏区域
    nav.appendTo("#page_nav_area");
}

//解析分页信息
function build_page_info(result) {
    //清空原有数据
    $("#page_info_area").empty();

    $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" + result.extend.pageInfo.pages + "页,"
        + "总" + result.extend.pageInfo.total + "条记录");

    //表示当前页
    currentPage = result.extend.pageInfo.pageNum;
}