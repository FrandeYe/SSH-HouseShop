/**
 * Created by Administrator on 2017/9/13.
 */
$(function() {
    $("#form").validate({
        rules: {
            pwd: {
                required: true,
                /*checkPassword:true,*/
            },
            newPwd: {
                required: true,
                /*checkPassword:true,*/

            },
            commitPwd: {
                required: true,
                /*checkPassword:true,*/
                equalTo: "#newPwd"
            },
        },
        messages: {
            pwd: {
                required: "请输入原密码",
            },
            newPwd: {
                required: "请输入新密码",
            },
            commitPwd: {
                required: "请输入确认密码",
                equalTo: "新密码与确认密码必须相同"
            },
        }
    });
});

function checkPasswords() {
    $.post("/admin/checkPwd",
        $("#form").serialize(),
        function (data) {
            $("#error_span").text(data.controllerResult.message);
            $("#error_span").css("color",data.controllerResult.messageColor);
            if (data.controllerResult.result == "fail") {
                $("#error_span").css("font-weight","bold");
            }

        }, "json"
    );
}

function verifies() {
    $.post("/admin/updatePwd",
        $("#form").serialize(),
        function (data) {
            if (data.controllerResult.result == "fail") {
                $("#fail_span").text(data.controllerResult.message);
            }
            if (data.controllerResult.result == "success") {
                window.open("/admin/admin_login.jsp", "_top");
            }
        }, "json"
    );
}

function  Canceled() {
    $("#form").form("clear");

}
