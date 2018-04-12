/**
 * Created by ccf on 2017/8/31.
 */


function validAppointment(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("无需" + (status == '1' ? "激活" : "冻结") + "该预约！");
            return;
        }
        var json;
        if (status == '1') {
            // 激活
            json = {
                "status": "1",
                "id": row.id
            }
        } else if (status == '0') {
            // 冻结
            json = {
                "status": "0",
                "id": row.id
            }
        }
        $.post(contextPath + "/appointment/statusAppointment",
            json,
            function (data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == '1' ? "激活" : "冻结") + "的预约！");
    }
}
//返回User对象的name属性
function formatUser(value) {
    return  value.name;
}
//不同预约状态对应的不同颜色
function formatAppStatus(){
   $('#list').datagrid({
       rowStyler:function(index,row){
           if (row.app_status=="已联系"){
               return 'background-color:#CCFFFF;';
           }
           if (row.app_status == "已购房") {
                return 'background-color:#FFDDFF;';
            }
            if (row.app_status == "已预约") {
                return 'background-color:#66CCFF;';
            }
            if (row.app_status == "已看房") {
                return 'background-color:#99FF99;';
            }
        }
    });
}

