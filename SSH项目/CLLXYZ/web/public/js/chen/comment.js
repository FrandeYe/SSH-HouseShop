/**
 * Created by ccf on 2017/9/4.
 */
//删除留言
function removeComment(){
    closeDig("dlg");
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var json;
        json = {
            "id": row.id
        }
        $.post(contextPath + "/comment/removeComment",
            json,
            function (data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要删除的评价！");
    }
}