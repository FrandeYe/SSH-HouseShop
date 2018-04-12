
//修改表单信息（更新）
function updateBuilding() {
    $("#buildings").attr("name", "building.buildings.id");
    if (formValidate("form")) {
        $.post(contextPath + "/building/updateBuilding",
            $("#form").serialize(),
            function(data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, 'json'
        );
        closeWin("win");
    }
}

//增加楼栋
function addBuilding() {
    if (formValidate("addForm")) {
        $.post(contextPath + "/building/saveBuilding",
            $("#addForm").serialize(),
            function (data) {
                if (data.controllerResult.result == "success") {
                    window.location.href = "/agency/agency_allBuilding.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}

//验证楼栋是否可用
function validBuilding(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("无需" + (status == 'y' ? "激活" : "冻结") + "该楼栋！");
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
        $.post(contextPath + "/building/updateStatus",
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
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的楼栋！");
    }
}
