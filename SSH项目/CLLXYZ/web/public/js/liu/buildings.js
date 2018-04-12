/**
 * Created by Administrator on 2017/9/4.
 */
var canAlter = false;
function showBuildingsDetail(javaObject, objStrNum) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var inputs = $("input");
        $("#logo-a").attr('href', row.logo);
        $("#logo-b").attr('src', row.logo);
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                if (canAlter) {
                    console.log("加载数据前.改前name:" + name);
                    input.attr("name", name.substr(objStrNum));
                    console.log("加载数据前.改后name:" + input.attr("name") + ",value:" + input.val());
                }
            }
        }
        $("#form").form("load", row);
        for (var i = 0, len = inputs.length; i < len; i++) {
            var input = $(inputs[i]);
            var name = input.attr("name");
            if (name != undefined && name != "undefined") {
                console.log("加载数据后.改前name:" + name);
                input.attr("name", javaObject + name);
                console.log("加载数据后.改后name:" + input.attr("name") + ",value:" + input.val());
            }
        }
        canAlter = true;
        openWin("win");
    }

}

function  showBuildingsImg() {
    var row = $("#list").datagrid("getSelected");
    if (row){
        window.location.href =contextPath + "/buildings/buildingsImg?id=" + row.id;
    }

}
