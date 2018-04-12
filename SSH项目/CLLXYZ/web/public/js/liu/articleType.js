/**
 * Created by Administrator on 2017/9/8.
 */
function addArticleType() {
    if(formValidate("addForm")){
    $.post(contextPath+"/articleType/saveArticleType",
        $("#addForm").serialize(),
        function (data) {
            if (data.controllerResult.result == "success") {
                showAlert(data.controllerResult.message);
                window.location.href = "admin_articleType.jsp";
            } else {
                showAlert(data.controllerResult.message);
            }
        }, "json"
    );
    }
}
function validArticleType(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("该类型已被" + (status == 1 ? "激活" : "冻结"));
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
        $.post(contextPath + "/articleType/statusArticleType",
            json,
            function (data) {

                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                }else{
                    showAlert(data.controllerResult.message);
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的类型！");
    }

}

function updateType() {
    if (formValidate("form")) {
        $.post(contextPath + "/articleType/updateArticleType",
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
        closeWin("win");
    }
}