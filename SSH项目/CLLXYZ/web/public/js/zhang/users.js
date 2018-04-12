/**
 * 基本信息验证
 */
function updateInfo() {
    if (formValidate("basicInfo")) {
        $.post(contextPath + "/user/updateInfo",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                    $("#addForm").form("clear");
                } else {
                    showAlert(data.controllerResult.message);
                }

            }, 'json'
        );
        closeWin("addWin");
    }
}

/**
 * 将表单数据设置为可输入状态
 */
function updateInputAttr(){ // 清除表单数据
    $('input').attr('readonly',false);
    $('#div').attr('style', '');
}
/**
 * 清除表单数据
 */
function clearForm(){ // 清除表单数据
    $('#updatePwd').form('clear'); // 清除表单的内容
    $('input').attr('readonly',false);
}

/**
 * 修改密码
 */
function deleter() { // 修改密码
    var password = $('#password').textbox('getValue');
    var newpassword = $('#newpassword').textbox('getValue');
    var confirmpassword = $('#confirmpassword').textbox('getValue');
    if ($("#updatePwd").form("validate")) {
        if (newpassword != confirmpassword) {
            $.messager.alert("提示", "您输入的两次密码不匹配", "error");
        } else {
            $.post("<%=path %>/user/updatePassword",
                $("#updatePwd").serialize(), // Form表单序列化
                function(data) {
                    if (data.controllerResult.result == "success") {
                        showAlert(data.controllerResult.message);
                    } else if (data.result.result == "fail") {
                        showAlert(data.controllerResult.message);
                    }
                }, "json");
        }
    } else {
        $.messager.alert("提示", "请正确输入表单数据", "error");
    }
}