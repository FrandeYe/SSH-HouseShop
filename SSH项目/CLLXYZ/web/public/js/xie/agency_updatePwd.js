$(function() {
    $("#updateForm").validate({
        rules: {
            password: {
                required: true,
                /*checkPassword:true,*/
            },
            newPassword: {
                required: true,
                /*checkPassword:true,*/

            },
            confirmPassword: {
                required: true,
                /*checkPassword:true,*/
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

/*$.validator.addMethod("checkPassword",function(value,element,params){
    /!*var checkPassword = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;*!/
    return this.optional(element)||(checkPassword.test(value));
},"*密码必须由6-18字母和数字组成，不能是纯数字或纯英文！");*/

function checkPwd() {
    $.post("/agency/checkPassword",
        $("#updateForm").serialize(),
        function (data) {
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color",data.controllerResult.messageColor);
                if (data.controllerResult.result == "fail") {
                    $("#error_span").css("font-weight","bold");
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
                    $("#fail_span").css("color", data.controllerResult.messageColor);
                    $("#fail_span").css("font-weight", "bold");
                }
                if (data.controllerResult.result == "success") {
                    window.open("/user/login.jsp", "_top");
                }
            }, "json"
        );
}

function  Cancel() {
    $("#updateForm").clear;

}
