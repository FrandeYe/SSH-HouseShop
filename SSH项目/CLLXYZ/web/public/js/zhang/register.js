function user_reg() {
	$.post('/user/register',$("#reg_form").serialize(),
		function (data) {
			if (data.controllerResult.result == "success") {
                swal({
                    title:"申请成功！",
                    text:"请耐心等待审核",
                    type:"success",
					timer:3000
                });
                // document.getElementById("reg_form").reset;
			}else{
				swal({
					title:"注册失败！",
					text:"请填写规范的信息",
					type:"warning",
					timer:1000
				});
			}
        }, "JSON");
}

function agency_reg() {
    $.post('/agency/register',$("#reg_form").serialize(),
        function (data) {
            if (data.controllerResult.result == "success") {
                sweetAlert({
                    title:"恭喜",
                    text:"申请成功！请耐心等待审核",
                    type:"success"
                });
                $("#reg_form").form('reset');
            } else {
                swal({
                    title:"注册失败！",
                    text:"请填写规范的信息",
                    type:"warning",
                    timer:1000
                });
			}
        }, "JSON");
}

function checkEmail(url) {
	var result = false;
	var regex = new RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
	if (check("#input_email", "#email_span", regex, "✔", "请输入正确的邮箱格式")) {
		$.post(url,
				$("#reg_form").serialize(),
				function (data) {
					$("#email_span").text(data.controllerResult.message);
					$("#email_span").css("color", data.controllerResult.messageColor);
					if (data.controllerResult.result == "success") {
						result = true;
					}
				}, "JSON");
	}
	return result;
}

function checkPhone(url) {
    var regex = new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$");
    if (check("#input_phone", "#phone_span", regex, "✔", "请输入正确的手机号码")) {
		$.post(
			url,
			$("#reg_form").serialize(),
			function(data){
			$("#phone_span").text(data.controllerResult.message);
			$("#phone_span").css("color",data.controllerResult.messageColor);
			if(data.controllerResult.result == "success"){
				return true;
			}
		},"JSON");
	}
    return false;
}

function request(method){
	$.post("index/reg/" + method, 
			$("#reg_form").serialize(),
			function (data) {
				$("#hint_span").text(data.info);
				$("#hint_span").css("color", data.span_color);
			}, "JSON");
}

function checkName() {
	var regex = new RegExp("^[\u4e00-\u9fa5]{1,6}|[a-zA-Z]{1,12}$");
	return check("#input_name", "#name_span", regex, "✔", "请输入合法字符");
}

function checkPwd() {
	var regex = new RegExp("^[a-zA-Z0-9]{6,20}$");
	return check("#input_password", "#password_span", regex, "✔", "请输入正确的密码格式(至少6个字符)");
}

function checkVerify() {
	var pwdVal = $("#input_password").val();
	if (pwdVal.length < 1) {
		var verifyCode = $("#verify_span");
        verifyCode.text("请先输入密码");
        verifyCode.css("color", "red");
	} else {
		var regex = new RegExp("^" + pwdVal + "$");
		return check("#input_verify", "#verify_span", regex, "✔", "两次输入的密码不一致")
	}
}

function checkPrincipal() {
	var regex = new RegExp("^[\u4e00-\u9fa5]{1,6}|[a-zA-Z]{1,12}$");
	return check("#input_principal", "#principal_span", regex, "✔", "请输入合法字符");
}

function checkAddress() {
	var regex = new RegExp("^[\u4e00-\u9fa5]{1,6}|[a-zA-Z]{1,12}$");
	return check("#input_address", "#address_span", regex, "✔", "请输入正确的地址");
}

function checkDate(codeId, spanId){
	var codeValue = $(codeId).val();
	var spanCode = $(spanId);
	if(codeValue == null || codeValue==""){
		spanCode.text("请选择日期");
		spanCode.css("color", "red");
		return false;
	}else{
		spanCode.text("✔");
		spanCode.css("color", "green");
		return true;
	}
}

function check(codeId, spanId, regex, okHint, noHint) {
	var is = false;
	var codeValue = $(codeId).val();
	var spanCode = $(spanId);
	if (regex.test(codeValue)) {
		is = true;
		spanCode.text(okHint);
		spanCode.css("color", "green");
	} else {
		spanCode.text(noHint);
		spanCode.css("color", "red");
	}
	return is;
}

function  resetBtn() {
	$("#input_phone").val("")
	$("#input_password").val("");
	$("#phone_span").text("");
	$("#password_span").text("");
}
