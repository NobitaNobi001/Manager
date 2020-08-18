function checkApplyName() {
    //申报名称不能为空
    if ($("#applyName").val() == "" || $("#applyName").val().length == 0) {
        alert("申报活动名称不能为空");
        return false;
    } else {
        return true;
    }
}

function checkCredit() {
    var credit = $("#applyCredit").val();
    if (credit > 8) {
        alert("申报的创新学分不能超过8");
        return false;
    } else if (credit == 0) {
        alert("申报的创新学分不能为0");
        return false;
    } else if (credit < 0) {
        alert("请输入正确的申报创建学分");
        return false;
    } else {
        return true;
    }
}

function checkFile(file) {
    var fileTypes = [".jpg", ".png", ".jpeg", ".gif", ".svg"];//图片类型
    var filePath = file.value;//文件名
    //当括号里面的值为0、空字符、false 、null 、undefined的时候就相当于false
    if (filePath) {
        var isNext = false;
        var fileEnd = filePath.substring(filePath.indexOf("."));//文件类型
        for (var i = 0; i < fileTypes.length; i++) {
            if (fileTypes[i] == fileEnd) {
                isNext = true;
                break;
            }
        }
        if (!isNext) {
            alert('不支持当前文件上传的类型');
            file.value = "";
            return false;
        } else {
            return true;
        }
    } else {
        alert("请上传申报材料(图片)");
        return false;
    }
}


function check() {
    var flag = checkApplyName() && checkCredit() && checkFile(document.getElementById("file"));
    if (flag) {
        alert("申报成功！");
        document.forms[0].submit();
    }
}