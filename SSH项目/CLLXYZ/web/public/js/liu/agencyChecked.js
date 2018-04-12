function checkedAgencies() {
    var rows = $("#list").datagrid("getSelections");
    if (rows.length>0) {
        var len = rows.length;
        var json;
        var ids = "";
        for (var i = 0; i < len; i++) {
            ids += rows[i].id + ",";
            json = {
                "id": ids
            }
        }
        $.post(contextPath+"/agency/checkedAgencies",
            json,
            function (data) {
                showAlert("审核成功!")
                $("#list").datagrid("reload");
            }
        );
    }else {
        showAlert("请选择需要" + (rows.checked_status == 1 ? "否决" : "审核") + "的经销商！");
    }
}
function UncheckedAgencies() {
    var rows = $("#list").datagrid("getSelections");
    if (rows.length > 0) {
        var len = rows.length;
        var json;
        var ids = "";
        for (var i = 0; i < len; i++) {
            ids += rows[i].id + ",";
            json = {
                "id": ids
            }
        }
        $.post(contextPath+"/agency/UncheckedAgencies",
            json,
            function (data) {
                showAlert("否决成功!")
                $("#list").datagrid("reload");
            }
        );
    }else {
        showAlert("请选择需要" + (rows.checked_status == 1 ? "审核" : "否决") + "的经销商！");
    }
}
function formatCheckStatus(value) {
    if (value == 1) {
        return "通过";
    } else {
        return "未通过";
    }
}