
/**
 * 点击某行数据，判断是否可以查看业主信息
 * @constructor
 */
function ClickRow() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.sale_status == '已售出') {
            $("#showBtn").removeAttr("disabled");
            $("#showBtn").attr('style','');
        }else{
            $("#showBtn").attr("disabled",true);
            $("#showBtn"). css({"background-color":"#CCCCCC "});
        }
    }
}
var canAlter = false;
function  showCustomerWin(javaObject) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var objStrNum = javaObject.length;
        var inputs = $("input");
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
        $("#form").form("load", row.sale.customer);
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
        $('input').attr("readonly",true);
        openWin("win");
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}