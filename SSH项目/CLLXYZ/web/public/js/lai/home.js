function viewTaskDetail() {
    // 显示出对话框
    openDlg("taskDetail")
}

function editTaskDetail() {
   openWin("editDetailWin");
}

function delTaskDetail() {
    $.messager.confirm("提示", "是否删除任务？", function(result) {
        if (result) { // 如果result为真，则表示点击了确认按钮
            showAlert("删除成功！");
        }
    });
}

/**
 * 用户安全退出功能
 */
function verify() {
    $.post("/user/quit",
        function (data) {
            if (data.controllerResult.result == "success") {
                window.open("/agency/showAgencyLogin", "_top");
            }
        }, "json"
    );
}