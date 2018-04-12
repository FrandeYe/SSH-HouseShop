$(function() {
    $("#updateForm").validate({
        rules: {
            password: {
                required: true,
            },
            newPassword: {
                required: true,

            },
            confirmPassword: {
                required: true,
                equalTo: "#newPassword"
            },
        },
        messages: {
            password: {
                required: "请输入原密码",
            },
            newPassword: {
                required: "请输入新密码",
            },
            confirmPassword: {
                required: "请输入确认密码",
                equalTo: "新密码与确认密码必须相同"
            },
        }
    });
});

function checkPwd() {
    $.post("/user/checkPassword",
        $("#updateForm").serialize(),
        function (data) {
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color",data.controllerResult.messageColor);
                if (data.controllerResult.result == "fail") {
                    $("#error_span").css("font-weight","bold");
                }else{
                    $("#fail_span").text("")
                }

        }, "json"
    );
}

function verify() {
        $.post("/user/updatePassword",
            $("#updateForm").serialize(),
            function (data) {
                if (data.controllerResult.result == "fail") {
                    $("#fail_span").text(data.controllerResult.message);
                }
                if (data.controllerResult.result == "success") {
                    window.open("/user/showUserLogin", "_top");
                }
            }, "json"
        );
}

function  Cancel() {
    $("#password").val("");
    $("#error_span").text("");
    $("#newPassword").val("");
    $("#confirmPassword").val("");
}
