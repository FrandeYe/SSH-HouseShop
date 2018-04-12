/**
* Created by Administrator on 2017/9/10.
*/
//在编辑窗口加载属性
var canAlter = false;
function  showEditWin(javaObject,objStrNum) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var inputs = $("input");
        $("#logo-a").attr('href',row.logo);
        $("#logo-b").attr('src',row.logo);

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
        $("#activity_image").attr('name','Image');
        $("#hiddenLogo").attr('name','logo');
        openWin("win");
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}

//验证广告是否可用
function validAds(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("该广告已被" + (status == 1 ? "激活" : "冻结"));
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
        $.post(contextPath + "/ads/statusAds",
            json,
            function (data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的广告！");
    }
}
//保存广告
function submitFile() {
    if (formValidate("addForm")){
        $.post(contextPath+"/ads/saveAds",
            $("#form").serialize(),
            function (data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    window.location.href="admin_ads.jsp";
                }else{
                    showAlert(data.controllerResult.message);
                }
            },'json'
        );
    }
}
//更新广告
function updateAds() {
    var created_time = $("#created_time");
    created_time.attr("name", "ads.created_time");
    if (formValidate("form")) {
        $.post(contextPath + "/ads/updateAds",
            $("#form").serialize(),
            function(data) {
                showAlert(data.controllerResult.message);
                if (data.controllerResult.result == "success") {
                    $("#list").datagrid("reload");
                }
            }, 'json'
        );
        $("#ads_image").fileinput('clear');
        closeWin("win");
    }
}
function checkLocation() {
    var location = $("#show_order").val();
    var jsonStr ={
        "location":location
    }
    $.post(contextPath+"/ads/checkLocation",
        jsonStr,
        function (data) {
            if (data.controllerResult.result == "success") {
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color","green");
            }else{
                $("#error_span").text(data.controllerResult.message);
                $("#error_span").css("color","red");
                $("#error_span").css("font-weight","bold");
            }
        },"json"
    );
}