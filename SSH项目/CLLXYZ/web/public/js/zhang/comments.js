
function showEditWin() {
    var jsonStr = '{"comment.id":"id_value","comment.content":"content_value"}';
    var row = $("#list").datagrid("getSelected"); // 获取数据网格中被选择的单行 getSelections获取数据网格中选中的多行
    if (row) {
        // 选中了行
        jsonStr = jsonStr.replace("id_value", row.id).replace("content_value", row.content);
        $("#editForm").form("load", JSON.parse(jsonStr)); // 自动把json对象加载到form表单，form里的name与json数据里的属性保持一致
        openWin("editWin"); // JSON.parse把json字符串转成json对象，JSON.stringify,把JSON对象转成JSON字符串
    } else {
        showAlert("请选择需要修改的评价！");
    }

}

function updateComment() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $.post(contextPath + "/comment/updateComment",
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
 * 留言的激活与冻结
 * @param status
 */
function valid(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("无需" + (status == 1 ? "激活" : "冻结") + "该评价！");
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
        $.post(contextPath + "/comment/statusComment ",
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
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的评价！");
    }
}

function formatBuildings(value){
    return value.name;
}