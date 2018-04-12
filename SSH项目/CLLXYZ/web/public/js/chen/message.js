/**
 * Created by ccf on 2017/9/1.
 */

//删除留言
function removeMessage() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var json;
            json = {
                "id": row.id
             }
        confirm('确定要删除吗?');
        $.post(contextPath + "/message/remove",
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
        showAlert("请选择需要删除的留言！");
    }
}
//回复留言
function showReplyMsgWin() {

        var jsonStr = '{"message.id":"id_value","message.reply":"reply_value"}';
        var row = $("#list").datagrid("getSelected"); // 获取数据网格中被选择的单行 getSelections获取数据网格中选中的多行
        if (row) {
            // 选中了行
            jsonStr = jsonStr.replace("id_value", row.id).replace("reply_value", row.reply);
            $("#editForm").form("load", JSON.parse(jsonStr)); // 自动把json对象加载到form表单，form里的name与json数据里的属性保持一致
            openWin("editWin"); // JSON.parse把json字符串转成json对象，JSON.stringify,把JSON对象转成JSON字符串
        } else {
            showAlert("请选择需要回复的留言！");
        }
}


function replyMessage() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $.post(contextPath + "/message/replyMsg",
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

function formatUsers(value) {
    return  value.name;
}
