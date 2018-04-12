/**
 * Created by ccf on 2017/9/4.
 */
function showAddWin() {
    openWin("addWin");
}
function showAlertWin() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        window.location.href=contextPath + "/customer/foundById?id=" + row.id;
    }else{
        showAlert("请选择需要修改信息的客户！");
    }
}
//增加顾客
function addCustomer() {
    if (formValidate("addForm")) {
        $.post(contextPath + "/customer/saveCustomers",
            $("#addForm").serialize(),
            function(data) {
                if (data.controllerResult.result == "success") {
                    window.location.href = "/agency/agency_all_customer.jsp";
                } else {
                    showAlert(data.controllerResult.message);
                }
            }, 'json'
        );
    }
}

//修改顾客
function updateCustomer(){

        if (formValidate("addForm")) {
            $.post(contextPath + "/customer/agencyUpdateCustomer",
                $("#addForm").serialize(),
                function(data) {
                    if (data.controllerResult.result == "success") {
                        showAlert(data.controllerResult.message);
                        $("#list").datagrid("reload");
                        $("#addForm").form("clear");
                    } else {
                        showAlert(data.controllerResult.message);
                    }
                }, 'json'
            );
           // closeWin("editWin");
        }
}
//激活、冻结顾客
function validCustomer(status){
    var row = $("#list").datagrid("getSelected");
    if (row) {
        if (row.status == status) {
            showAlert("无需" + (status == '1' ? "激活" : "冻结") + "该客户！");
            return;
        }
        var json;
        if (status == '1') {
            // 激活
            json = {
                "status": "1",
                "id": row.id
            }
        } else if (status == '0') {
            // 冻结
            json = {
                "status": "0",
                "id": row.id
            }
        }

        $.post(contextPath + "/customer/statusCustomer",
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
        showAlert("请选择需要" + (status == '1' ? "激活" : "冻结") + "的客户！");
    }
}

function formatCustomerStatus(){
    $('#list').datagrid({
        rowStyler:function(index,row){
            if (row.customer_type=="购房客户"){
                return 'background-color:#99CC33;';
            }
            if (row.customer_type == "预约客户") {
                return 'background-color:#CC99CC;';
            }
            if (row.customer_type == "意向客户") {
                return 'background-color:#66CCFF;';
            }
            if (row.customer_type == "预定客户") {
                return 'background-color:#CC9966;';
            }
        }
    });
}


function formatStatus1(value) {
    if (value == 1) {
        return "是";
    }
    if(value==0){
        return "否";
    }
}

function formatGender(value) {
    if (value =='F') {
        return '女';
    }
    if(value=='M'){
        return '男';
    }
 }
/**
 *上传文件，给静态变量赋值（步骤01）
 */
function uploadFile(value) {
    var row = $("#list").datagrid("getSelected");
    if (row){
        openWin("uploadFile");
        $("#customer_id").val(row.id);
        $("#fileType").val(value);
    }else{
        showAlert("请选择上传的对象！");
    }
}
/**
 *获取静态变量文件名，并插入到数据库（步骤02）,完成上传
 */
function saveFileName() {
    $.post(
        contextPath+"/customer/saveFileCustomer",
        $("#uploadForm").serialize(),
        function (data) {
            showAlert(data.controllerResult.message);
        },
        "json"
    );
    closeWin("uploadFile");
}
