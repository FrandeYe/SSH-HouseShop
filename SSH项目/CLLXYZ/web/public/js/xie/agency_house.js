
function  showEditWinBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#houseImg").attr("src", contextPath + row.logo);
        $("#intro").val(row.intro);
        showEditWin('house.');
    } else {
        showAlert("请选择户型！");
    }
}

/**
 *当图片的文件改变时，获取到改变的文件名，点确认时，保存到数据库
 */
var houseLogoFileName = '';
function setHouseLogoFileName() {
    var houseValue = $("#house_logo").val();
    houseLogoFileName = houseValue.substr(houseValue.lastIndexOf('\\') + 1);
}

//修改表单信息（点击确认时）
function updateHouse() {
    $("#buildings").attr("name", "house.buildings.id");
    $("#house_logo_id").val(houseLogoFileName);
    if (formValidate("form")) {
        $.post(contextPath + "/house/updateHouse",
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

//增加户型
function addHouse() {
   if (formValidate("addForm")) {
        $.post(contextPath + "/house/saveHouse",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    window.location.href = "/agency/agency_allHouse.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}

//验证户型是否可用
function validHouse(status) {
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
        $.post(contextPath + "/house/statusHouse",
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