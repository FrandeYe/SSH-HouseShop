function showEditWin() {
    var jsonStr = '{"appointment.id":"id_value","appointment.app_arrive_time":"app_arrive_time_value","appointment.arrive_time":"arrive_time_value"}';
    var row = $("#list").datagrid("getSelected"); // 获取数据网格中被选择的单行 getSelections获取数据网格中选中的多行
    if (row) {
        // 选中了行
        jsonStr = jsonStr.replace("id_value", row.id).replace("app_arrive_time_value", row.app_arrive_time).replace("arrive_time_value",row.arrive_time);
        $("#editForm").form("load", JSON.parse(jsonStr)); // 自动把json对象加载到form表单，form里的name与json数据里的属性保持一致
        openWin("editWin"); // JSON.parse把json字符串转成json对象，JSON.stringify,把JSON对象转成JSON字符串
    } else {
        showAlert("请选择需要修改的预约！");
    }

}

function confirm() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $.post(contextPath + "/appointment/updateAppointment",
            $("#editForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                } else {
                    showAlert(data.controllerResult.message);
                }

            }, 'json'
        );
        closeWin("editWin");
    }
}

/**
 *
 */
function deleter() {
    closeDig("dlg");
    var row = $("#list").datagrid("getSelected");
    if(row){
        var json = {
            "appointment.id": row.id
        };
        $.post(contextPath + "/appointment/deleteAppointment",
                json,
            function(data) {
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                } else {
                    showAlert(data.controllerResult.message);
                }

            }, 'json'
        );
    }
}

function formatHouse(value){
    return value.name;
}

function formatEmployee(value){
    return value.name;
}

function formatAgency(value){
    return value.name;
}

/**
 * 确认是否删除
 */
function verifyDelete() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $('#dlg').dialog('open')
    } else {
        showAlert("请选择需要删除的预约！");
    }

}