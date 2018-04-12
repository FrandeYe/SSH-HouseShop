var canAlter = false;
function showActivityDetail(javaObject, objStrNum) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var inputs = $("input");
        $("#logo-a").attr('href', row.logo);
        $("#logo-b").attr('src', row.logo);
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                if (canAlter) {
                    console.log("加载数据前.改前name:" + name);
                    input.attr("name", name.substr(objStrNum));
                    console.log("加载数据前.改后name:" + input.attr("name") + ",value:" + input.val());
                }
            }
        }
        $("#form").form("load", row);
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                console.log("加载数据后.改前name:" + name);
                input.attr("name", javaObject + name);
                console.log("加载数据后.改后name:" + input.attr("name") + ",value:" + input.val());
            }
        }
        canAlter = true;
        $("#activity_image").attr('name','Image');
        openWin("win");
    }

}
function updateActivities() {
    var start_time = $("#start_time");
    start_time.attr("name", "activity.start_time");
    var end_time = $("#end_time");
    end_time.attr("name", "activity.end_time");
    $("#activity_image").attr('name','Image');
    if (formValidate("form")) {
        $.post(contextPath + "/activity/updateActivity",
            $("#form").serialize(),
            function (data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                }else{
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
        $("#activity_image").fileinput('clear');
        closeWin("win");
    }
}

//验证员工是否可用
function validActivity(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("该活动已被" + (status == 1 ? "激活" : "冻结"));
            return;
        }
        var json;
        if (status == 1) {
            // 激活
            json = {
                "status": 1,
                "id": row.id
            }
        } else if (status == 0) {
            // 冻结
            json = {
                "status": 0,
                "id": row.id
            }
        }
        $.post(contextPath + "/activity/statusActivity",
            json,
            function (data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的活动！");
    }
}
