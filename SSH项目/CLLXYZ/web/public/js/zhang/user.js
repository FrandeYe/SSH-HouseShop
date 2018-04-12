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
 * 用户登录
 */
function login() {
    $.post("/user/login",
        $("#loginForm").serialize(),
        function (data) {
            if (data.controllerResult.result == "fail") {
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color",data.controllerResult.messageColor);
                $("#error_span").css("font-weight","bold");
            } else if (data.controllerResult.result == "success"){
                $("#error_span").text("");
                window.location.href = "/user/showIndex";
            }
        }, "json"
    );
}

/**
 * 用户的重置
 */
function userReset() {
    $("#input_phone").val("");
    $("#input_password").val("");
    $("#error_span").text("");

}

/**
 * 用户安全退出功能
 */
function userExit() {
    $.post("/user/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/user/showUserLogin", "_top");
            }
        }, "json"
    );
}