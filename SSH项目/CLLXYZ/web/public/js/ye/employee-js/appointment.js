/**
 * 预约相关js
 */

function formatHouse(value) {
    return value.name;
}
function formatName(value) {
    return value.name;
}
function formatUser(value) {
    return value.name;
}

function formatEmployee(value) {
    return value.basic_salary;
}

function showAppEdit() {
    var jsonStr = '{"appointment.app_status":"app_status_value","appointment.id":"id_value"}';
    var row = $("#list").datagrid("getSelected");
    if (row){
        jsonStr = jsonStr.replace("app_status_value", row.app_status).replace("id_value", row.id);
        $("#editAppForm").form("load", JSON.parse(jsonStr));
        openWin("editApp");
    }else {
        showAlert("请选择需要修改的栏目！");
    }
}

//更新购房预约状态
function updateAppStatus() {
        $.post(contextPath + "/appointment/appStatusAppointment",
            $("#editAppForm").serialize(),
            function(data) {
                    $("#list").datagrid("reload");
                    $("#editAppForm").form("clear");
            }, 'json'
        );
        closeWin("editApp");
}

/**
 * 预约背景色
 */
function bgcolorStatus() {
    $('#list').datagrid({
        rowStyler:function(index,row){
            if (row.app_status=="已购房"){
                return 'background-color:#99CC33;';
            }
            if (row.app_status == "已预约") {
                return 'background-color:#CC99CC;';
            }
            if (row.app_status == "已联系") {
                return 'background-color:#66CCFF;';
            }
            if (row.app_status == "已看房") {
                return 'background-color:#99FF99;';
            }
        }
    });
}