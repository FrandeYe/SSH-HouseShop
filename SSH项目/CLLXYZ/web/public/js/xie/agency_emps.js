
function showEditWinBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row.gender == "F") {
        $("#sex1").removeAttr("checked");
        $("#sex2").attr("checked", true);
    }
    $("#intro").val(row.intro);
    $("#des").val(row.des);
    showEditWin('employee.');
}
//
function check(codeId, spanId, regex, okHint, noHint) {
    var is = false;
    var codeValue = $(codeId).val();
    var spanCode = $(spanId);
    if (regex.test(codeValue)) {
        is = true;
        spanCode.text(okHint);
        spanCode.css("color", "green");
    } else {
        spanCode.text(noHint);
        spanCode.css("color", "red");
    }
    return is;
}
//修改表单信息（更新）
function updateEmployee() {
    $("#buildings").attr("name", "employee.buildings.id");
    $("#exp").attr("name", "employee.exp");
    if (formValidate("PwdForm")) {
        $.post(contextPath + "/employee/updateEmployee",
            $("#form").serialize(),
            function(data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, 'json'
        );
        closeWin("win");
    }
}

//验证经销商输入的手机号是否存在于数据库
function verifyPhone(url) {
    var regex = new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$");
    if (check("#input_phone", "#phone_span", regex, "✔", "请输入正确的手机号码")) {
        $.post(
            url,
            $("#addForm").serialize(),
            function(data){
                $("#phone_span").text(data.controllerResult.message);
                $("#phone_span").css("color",data.controllerResult.messageColor);
                if(data.controllerResult.result == "success"){
                    return true;
                }
            },"JSON");
    }
    return false;
}
//验证经销商输入的邮箱是否存在于数据库
function verifyEmail(url) {
    // alert("System.out.println(\"18870798915\");\n");
    var regex = new RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
    if (check("#input_email", "#email_span", regex, "✔", "请输入正确的邮箱格式")) {
        $.post(
            url,
            $("#addForm").serialize(),
            function (data) {
                $("#email_span").text(data.controllerResult.message);
                $("#email_span").css("color", data.controllerResult.messageColor);
                if (data.controllerResult.result == "success") {
                    result = true;
                }
            }, "JSON");
    }
    // return result;
}
//增加员工
function addEmployee() {
   if (formValidate("addForm")) {
        $.post(contextPath + "/employee/saveEmployee",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    window.location.href = contextPath + "/agency/agency_allEmps.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}


//验证员工是否可用
function validEmployee(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("无需" + (status == 'y' ? "激活" : "冻结") + "该员工！");
            return;
        }
        var json;
        if (status == 1) {
            // 激活
            json = {
                "status": 1,
                "id": row.id
            }
        } else if (status == 0) {
            // 冻结
            json = {
                "status": 0,
                "id": row.id
            }
        }
        $.post(contextPath + "/employee/updateStatus",
            json,
            function (data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的员工！");
    }
}
//经销商修改员工密码按钮
function alterPwd() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#employeeId").val(row.id);
        $("#newPwd").val(row.email);
        openWin("pwdWin");
    } else {
        showAlert("请选择员工");
    }
}

//修改编辑窗口表单信息（经销商修改员工密码）
function updatePwd() {
    closeWin('pwdWin');
    if (formValidate("pwdForm")) {
        $.post(contextPath + "/employee/updatePwdAgency",
            $("#pwdForm").serialize(),
            function(data) {
                showAlert(data.controllerResult.message);
            }, 'json'
        );
        closeWin("win");
    }
}