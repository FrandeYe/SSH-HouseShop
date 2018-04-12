/**
 *
 */
function deleter() {
    closeDig("dlg");
    var row = $("#list").datagrid("getSelected");
    if(row){
        var json = {
            "history.id": row.id
        };
        $.post(contextPath + "/history/deleteHistory",
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

function formatBuildings(value){
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
        showAlert("请选择需要删除的历史记录！");
    }

}