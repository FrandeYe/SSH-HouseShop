/**
 * 经销商登录
 */
function agencyLogin() {
    $.post("/agency/agencyPhoneLogin",
        $("#loginForm").serialize(),
        function (data) {
            if (data.controllerResult.result == "fail") {
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color",data.controllerResult.messageColor);
                $("#error_span").css("font-weight","bold");
            } else if (data.controllerResult.result == "success"){
                $("#error_span").text("");
                window.location.href = "/agency/showAgencyIndex";
            }
        }, "json"
    );
}

/**
 * 经销商的重置
 */
function agencyReset() {
    $("#input_phone").val("");
    $("#input_password").val("");
    $("#error_span").text("");

}

/**
 * 经销商安全退出功能
 */
function agencyExit() {
    $.post("/agency/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/agency/showAgencyLogin", "_top");
            }
        }, "json"
    );
}