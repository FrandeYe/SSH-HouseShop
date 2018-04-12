var waitTime = 60;
function time(o) {
    if (waitTime == 60) {
        var regex = new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$");
        var checkResult = check("#input_phone", "#phone_span", regex, "✔", "请输入正确的手机号码");
        if (checkResult) {
            $.ajax({
                type: "POST",
                url: "/user/sendVerifyCode",
                data: {phone:$("#input_phone").val()},
                dataType: "json",
                success: function(data){
                    /*alert(data.controllerResult.message);*/
                }
            });
        } else {
            waitTime = 0;
        }
    }
    if (waitTime == 0) {
        o.removeAttribute("disabled");
        o.innerHTML = "免费获取手机验证码";
        waitTime = 60;
    } else {
        o.setAttribute("disabled", true);
        o.innerHTML = "重新发送(" + waitTime + ")";
        waitTime--;
        setTimeout(function () {
                time(o)
            },
            1000)
    }
}

function timeTest(o) {
    if (wait == 60) {
        var checkResult = checkPhone('/user/checkPhone');
        alert("public/js/zhang/repeatVerifyCode.js:6");
        if (checkResult) {
            alert("public/js/zhang/repeatVerifyCode.js:8");
        } else {
            alert("public/js/zhang/repeatVerifyCode.js:10");
            wait = 0;
        }
    }
    if (wait == 0) {
        o.removeAttribute("disabled");
        o.innerHTML = "免费获取手机验证码";
        wait = 60;
    } else {
        o.setAttribute("disabled", true);
        o.innerHTML = "重新发送(" + wait + ")";
        wait--;
        setTimeout(function () {
                timeTest(o)
            },
            1000)
    }
}