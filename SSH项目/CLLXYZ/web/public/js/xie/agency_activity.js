function showEditWinBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#activityImg").attr("src", contextPath + row.logo);
        $("#content").val(row.content);
        showEditWin('activity.');
    } else {
        showAlert("请选择活动");
    }
}

var activityLogoFileName = "";
function setActivityLogoFileName() {
    var activityValue = $("#activity_logo").val();
    activityLogoFileName = activityValue.substr(activityValue.lastIndexOf('\\') + 1);
}

//修改表单信息（更新）
function updateActivity() {
    $("#buildings").attr("name", "activity.buildings.id");
    $("#start_time").attr("name", "activity.start_time");
    $("#end_time").attr("name", "activity.end_time");
    $("#acitivity_logo_id").val(activityLogoFileName);
    if (formValidate("form")) {
        $.post(contextPath + "/activity/updateActivity",
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


//增加活动
function addActivity() {
   if (formValidate("addForm")) {
        $.post(contextPath + "/activity/saveActivity",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    window.location.href = contextPath + "/agency/agency_allActivity.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}


//验证活动是否可用
function validActivity(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert(/*"无需" + */(status == 'y' ? "激活" : "冻结") + "该活动！");
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
        $.post(contextPath + "/activity/statusActivity",
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
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的活动！");
    }

}

