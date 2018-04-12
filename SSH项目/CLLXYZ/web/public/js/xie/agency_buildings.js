
function setAddress() {
    var province = $("#province").val();
    var city = $("#city").val();
    var district = $("#district").val();
    $("#cityName").val(province + city + district);
}

function showEditWinBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#buildingsImg").attr("src", contextPath + row.logo);
        $("#intro").val(row.intro);
        $("#equipments").val(row.equipments);
        showEditWin('buildings.');
    } else {
        showAlert("请选择楼盘");
    }
}

/**
 *当图片的文件改变时，获取到改变的文件名，点确认时，保存到数据库
 */
var buildingsLogoFileName = '';
function setBuildingsLogoFileName() {
    var begintValue = $("#buildings_logo").val();
    buildingsLogoFileName = begintValue.substr(begintValue.lastIndexOf('\\') + 1);
}

function updateBuildings() {
    var open_date = $("#open_date");
    open_date.attr("name", "buildings.open_date");
    var province = $("#province").val();
    var city = $("#city").val();
    var district = $("#district").val();
    $("#buildings_area_id").val(province + " " + city + " " + district);
    $("#buildings_logo_id").val(buildingsLogoFileName);
    $("#house_type").attr("name", "buildings.house_type");
    $("#building_type").attr("name", "buildings.building_type");
    if (formValidate('form')) {
        $.post(contextPath + "/buildings/updateBuildings",
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

//增加楼盘
function addBuildings() {
    var province = $("#province").val();
    var city = $("#city").val();
    var district = $("#district").val();
    $("#buildings_area").val(province + " " + city + " " + district);
   if (formValidate("addForm")) {
        $.post(contextPath + "/buildings/saveBuildings",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    window.location.href = "/agency/agency_allBuildings.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}
//上传图片（完成）
function submitFile () {
    $.post("/activity/saveActivity",
        $("#form").serialize(),
        function (data) {
            if(data.controllerResult=="success"){
                alert("public/js/liu/activity_add.js:9");
                window.location.href =contextPath + "/admin/admin_activity.jsp";
            }
        },"json"
    );
}

//验证楼盘是否可用
function validBuildings(status) {
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
        $.post(contextPath + "/buildings/updateStatus",
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
