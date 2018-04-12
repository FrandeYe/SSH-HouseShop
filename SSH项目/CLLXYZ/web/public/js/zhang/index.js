/**
 * 用户安全退出功能
 */
function userExit() {
    $.post("/user/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/user/showIndex", "_top");
            }
        }, "json"
    );
}