/**
 * 管理员登录
 */
function adminLogin() {
    $.post("/admin/adminLogin",
        $("#loginForm").serialize(),
        function (data) {
            if (data.controllerResult.result == "fail") {
                $("#error_span").text(data.controllerResult.message);
            } else if (data.controllerResult.result == "success"){
                $("#error_span").text("");
                window.location.href = "/admin/showAdminIndex";
            }
        }, "json"
    );
}

/**
 * 管理员的重置
 */
function adminReset() {
    $("#input_phone").val("");
    $("#input_password").val("");
    $("#error_span").text("");

}

/**
 * 管理员安全退出功能
 */
function adminExit() {
    $.post("/admin/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/admin/showAdminLogin", "_top");
            }
        }, "json"
    );
}