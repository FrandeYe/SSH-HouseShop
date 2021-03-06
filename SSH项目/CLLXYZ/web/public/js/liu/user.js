
var canAlter = false;
function  showEditWin(javaObject,objStrNum) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var inputs = $("input");
        $("#logo-a").attr('href',row.headicon);
        $("#logo-b").attr('src',row.headicon);
        if(row.gander=="m"){
            $("#gander").val("男")
        }else if (row.gander=="f"){
            $("#gander").val("女")
        }
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                if (canAlter) {
                    // console.log("加载数据前.改前name:" + name);
                    input.attr("name", name.substr(objStrNum));
                    // console.log("加载数据前.改后name:" + input.attr("name") + ",value:" + input.val());
                }
            }
        }
        $("#form").form("load", row);
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                // console.log("加载数据后.改前name:" + name);
                input.attr("name", javaObject + name);
                // console.log("加载数据后.改后name:" + input.attr("name") + ",value:" + input.val());
            }
        }
        canAlter = true;
        openWin("win");
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}
//验证用户是否可用
function validUser(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("该用户已被" + (status == 1 ? "激活" : "冻结"));
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
        $.post(contextPath + "/user/statusUser",
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
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的用户！");
    }
}