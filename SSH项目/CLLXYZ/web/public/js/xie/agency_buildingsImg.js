function openUpdateWinBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#buildingsImgId").val(row.id);
        $("#describe1").val(row.img_des);
        $("#beginImg").attr("src", contextPath + row.img_path);
        openWin('updateWin');
    } else {
        showAlert('请选择需要修改的图片');
    }
}

function openRemoveDlgBefore() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        openDlg('dlg');
    } else {
        showAlert('请选择需要删除的图片');
    }
}

function openSaveWinBefore() {
    $("#buildingsId").val($("#buildings").val());
    openWin('saveWin')
}

function getImagesData() {
    var id = $("#buildings").val();
    $("#list").datagrid("reload", contextPath + "/buildingsImg/pagerBuildingsImgBuildings?id=" + id);
}

var buildingsImgFileName = '';
function setBuildingsImgFileName() {
    var imgFileName = $("#buildingsImg").val();
    buildingsImgFileName = imgFileName.substr(imgFileName.lastIndexOf('\\') + 1);
}
function setBuildingsImgFileNameUpdate() {
    var imgFileName = $("#buildingsImgUpdate").val();
    buildingsImgFileName = imgFileName.substr(imgFileName.lastIndexOf('\\') + 1);
}

function saveImg() {
    closeWin('saveWin');
    if (buildingsImgFileName != '') {
        $("#imgLogo").val(buildingsImgFileName);
    }
    $.post("/buildingsImg/save",
        $("#saveForm").serialize(),
        function (data) {
            showAlert(data.controllerResult.message);
            getImagesData();
        },"json");
}

function removeImg() {
    closeDig('dlg');
    var row = $("#list").datagrid("getSelected");
    $.get(contextPath + "/buildingsImg/remove?id=" + row.id,
        function (data) {
            showAlert(data.controllerResult.message);
            getImagesData();
        }, "json");
}

function updateImg() {
    closeWin('updateWin');
    if (buildingsImgFileName != '') {
        $("#updateImgLogo").val(buildingsImgFileName);
    }
    $.post(contextPath + "/buildingsImg/update",
        $("#updateForm").serialize(),
        function (data) {
            showAlert(data.controllerResult.message);
            getImagesData();
        }, "json");
}