/**
 * Created by Administrator on 2017/9/6.
 */
//加载文章数据
var canAlter = false;
function  showEditWin(javaObject) {
    var row = $("#list").datagrid("getSelected");
    var objStrNum = javaObject.length;
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
        $("#article_image").attr('name','Image');
        $("#hiddenLogo").attr('name','logo');
        $.post("/articleType/foundTypename",
            function (data) {
                for(var i= 0 ;i<data.rows.length;i++){
                    $("#select").append("<option value="+data.rows[i].id+">"+data.rows[i].name+"</option>");
                }
            },"json"
        )

        openWin("win");
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}

//激活文章
function validArticle(status) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("该文章已被" + (status == 1 ? "激活" : "冻结"));
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
        $.post(contextPath + "/article/statusArticle",
            json,
            function (data) {

                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                }
            }, "json"
        );
    } else {
        showAlert("请选择需要" + (status == 1 ? "激活" : "冻结") + "的文章！");
    }

}
//添加文章
function addArticle() {
    var typeId = $('#select option:selected').val();
    if(formValidate("addForm")){
        $.post("/article/saveArticle?typeId="+typeId,$("#addForm").serialize(),
            function (data) {

                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    window.location.href ="admin_article.jsp";
                }else{
                    showAlert(data.controllerResult.message);
                }
            }, "json"
        );
    }
}

//更新文章
function updateArticle() {
    var created_time = $("#created_time");
    var typeId = $('#select option:selected').val();
    created_time.attr('name','article.created_time' );
    if (formValidate("form")) {
        $.post(contextPath + "/article/updateArticle?typeId="+typeId,$("#form").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                }else{
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
        $('#article_image').fileinput('clear');
        closeWin("win");
    }
}