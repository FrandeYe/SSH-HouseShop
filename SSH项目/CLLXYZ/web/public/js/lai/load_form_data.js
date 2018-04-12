var canAlter = false;
function  showEditWin(javaObject) {
    var row = $("#list").datagrid("getSelected");
    var objStrNum = javaObject.length;
    if (row) {
        var inputs = $("input");
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