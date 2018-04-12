$(function () {
    $("#basicInfo").validate({
        rules: {
            nickname: {
                required: true,
                checkNickname: true
            },
            name: {
                required: true,
                checkName:true
            },
            email: {
                required: true,
                email:true
            },
            qq: {
                required: true,
                checkQQ:true

            },
            wechat: {
                required: true,
                checkChat:true
            }
        },
        messages: {
            nickname: {
                required: "必填！",
            },
            name: {
                required: "必填！",
            },
            email: {
                required: "必填！",
                email:"请输入正确的邮箱"
            },
            qq: {
                required: "必填!",
            },
            wechat: {
                required: "必填!",
            }
        },
        focusInvalid:true,
        focusCleanup:true,
    });
});

$.validator.addMethod("checkQQ",function(value,element,params){
    var checkQQ = /^[1-9][0-9]{4,19}$/;
    return this.optional(element)||(checkQQ.test(value));
},"*请输入正确的QQ号码！");

$.validator.addMethod("checkNickname",function(value,element,params){
    var checkNickname =/^[\u4e00-\u9fa5A-Za-z0-9-_]*$/;
    return this.optional(element)||(checkNickname.test(value));
},"*只能中英文，数字，下划线，减号！");

$.validator.addMethod("checkChat",function(value,element,params){
    var checkChat = /^[a-zA-Z\d_]{5,}$/;
    return this.optional(element)||(checkChat.test(value));
},"*只允许5位英文字母以上、数字或者下画线！");

$.validator.addMethod("checkName",function(value,element,params){
    var checkName = /^([\u4e00-\u9fa5]){2,7}$/;
    return this.optional(element)||(checkName.test(value));
},"*只能是中文，2~7位！");

function updateUserInfo() {
    $.post("/user/updateInfo",
        $("#basicInfo").serialize(),
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/user/showUserIndex","_top");
            } else {
                alert(data.controllerResult.message);
            }
        }, "json");
}

