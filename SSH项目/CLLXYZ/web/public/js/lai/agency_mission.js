function setSelectTime() {
    var date = new Date();
    var year = date.getYear() + 1900;
    var month = date.getMonth() + 1;
    $("#yearMonthSelect").val(year + "年" + month + "月");
}

function getNewData(id) {
    var time = $("#yearMonthSelect").val();
    var date = new Date();
    var year = date.getYear() + 1900;
    var month = date.getMonth() + 1;
    if (time == (year + "年" + month + "月")) {
        $("#list").datagrid("reload", contextPath + "/mission/pagerMissionAgencyNoTime?id=" + id);
    } else {
        $("#list").datagrid("reload", contextPath + "/mission/pagerMissionAgencyByTime?id=" + id + "&time=" + time);
    }
}

function formatSaleCount() {
    $('#list').datagrid({
        rowStyler: function (index, row) {
            if (row.saleCount < row.quantity) {
                return 'background-color:#FFCC00;';//红色：未完成
            } else {
                return 'background-color:#99CC00;';//绿色：已完成
            }
        }
    });
}

/**
 *计算可领工资：可领工资 = 基本工资 + 销量*提成
 */

function formatRealSalary() {

}

/**
 * 显示修改任务量和提成的窗口
 */
function showQuantityWin() {
    var jsonStr = '{"mission.id":"id_value","mission.quantity":"quantity_value","mission.bonus_percent":"bonus_percent_value"}';
    var row = $("#list").datagrid("getSelected"); // 获取数据网格中被选择的单行 getSelections获取数据网格中选中的多行
    if (row) {
        // 选中了行
        jsonStr = jsonStr.replace("id_value", row.id).replace("quantity_value", row.quantity).replace("bonus_percent_value", row.bonus_percent);
        $("#editForm").form("load", JSON.parse(jsonStr)); // 自动把json对象加载到form表单，form里的name与json数据里的属性保持一致
        openWin("editWin"); // JSON.parse把json字符串转成json对象，JSON.stringify,把JSON对象转成JSON字符串
    } else {
        showAlert("请选择需要修改的对象！");
    }

}

/**
 * 显示修改提成的窗口
 */
function showQuantityPercentWin() {
    openWin("editPercentWin");
}

/**
 * 执行修改任务量与提成操作
 */
function updateQuantity() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (formValidate("editForm")) {
            $.post(contextPath + "/mission/updateQuantityPercent",
                $("#editForm").serialize(),
                function (data) {
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
}

function updateBonusPercent() {
    if (formValidate("percentForm")) {
        $.post(contextPath + "/mission/updateBonusPercent",
            $("#percentForm").serialize(),
            function (data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                } else {
                    showAlert(data.controllerResult.message);
                }

            }, 'json'
        );
        closeWin("editPercentWin");
    }
}