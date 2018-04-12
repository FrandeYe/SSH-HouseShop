
/**
 * 经销商相关的js
 */
function showAgencyEdit() {
    $('input').attr('readonly',false);
    $('input').removeAttr("disabled");
    $("#intro").attr('readonly', false);
    $('#editbtn').attr('style', ''); //确认按钮
    $('#editInfo').css('display','none'); //修改信息按钮
}

/**
 * 修改经销商的基本信息
 */
function updateBaseMessage() {
    if (formValidate("editAgencyForm")) {
        $.post(contextPath + "/agency/update",
            $("#editAgencyForm").serialize(),
            function (data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result = "success") {
                    top.location.reload();
                }
            }, "JSON");
    }
}