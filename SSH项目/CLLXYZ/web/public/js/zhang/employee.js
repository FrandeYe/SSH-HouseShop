$(function () {
    $("#loginForm").validate({
        rules: {
            phone: {
                required: true,
            },
            pwd: {
                required: true,
            },
        },
        messages: {
            phone: {
                required: "必填！",
            },
            pwd: {
                required: "必填！",
            },
        },
        focusInvalid:true,
        focusCleanup:true,
    });
});

/**
 * 员工登录
 */
function employeeLogin() {
    $.post("/employee/EmployeePhoneLogin",
        $("#loginForm").serialize(),
        function (data) {
            if (data.controllerResult.result == "fail") {
                $("#error").text(data.controllerResult.message);
            } else if (data.controllerResult.result == "success"){
                window.location.href = "/index/showHome";
            }
        }, "json"
    );
}

/**
 * 员工的重置
 */
function employeeReset() {
    $("#input_phone").val("");
    $("#input_password").val("");
    $("#error").text("");

}

function employeeExit() {
    $.post("/employee/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/employee/showEmployeeLogin", "_top");
            }
        }, "json"
    );
}