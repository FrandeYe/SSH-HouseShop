/**
 * 员工相关的js
 */
function showEmpEdit() {
    $('input').attr('readonly',false);//取消input的不可编辑状态，将true改为false
    document.getElementById("intro").disabled=false;
    document.getElementById("exp").disabled=false;
    $('input').removeAttr("disabled");
    $('#editbtn').attr('style', '');//清除效果
    $('#editInfo').css('display','none');//隐藏
    $('#phoneid').css('display','none');
    $('#basic_salaryid').css('display','none');
}


/**
 * 修改员工的信息
 */
function verifyEmail() {
    $.get(
        contextPath+"/employee/verifyEmail",
        $("#editEmpForm").serialize(),
        function (data) {
            if (data.controllerResult.result=="fail"){
                $("#emailTip").text(data.controllerResult.message);
                document.getElementById("emailTip").style.color="red";
            }else {
                $("#emailTip").text("");
                document.getElementById("emailTip").style.color="#ffffff";
            }

        }
    );
}
function updateEmpInfo() {
    if (formValidate("editEmpForm")) {
        $.post(
            contextPath+"/employee/updateEmployeeSelf",
            $("#editEmpForm").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    top.location.reload();
                }else {
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
    }
}

/**
 * 修改员工密码
 */
/**
 * 失去焦点，验证原密码
 */
function checkOldPwd() {
    $.post(
        contextPath+"/employee/checkOldPwd",
        $("#pwdEmpForm").serialize(),
        function (data) {
            var pwdTip = document.getElementById("pwdTip");
            var msg = data.controllerResult.message;
            pwdTip.innerHTML=msg;
            if (msg=="正确！"){
                document.getElementById("pwdTip").style.color='\n' +
                    '#009933 ';
            }else{
                document.getElementById("pwdTip").style.color='red';
            }
        },
        "json"
    );
}
function updateEmpPwd() {
    if (formValidate("pwdEmpForm")) {
        $.post(
            contextPath+"/employee/updateEmpPwd",
            $("#pwdEmpForm").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    top.location.reload();
                    window.location.href="emp_information.jsp";
                }else{
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
    }
}
