/**
 * 下载合同
 */
function dowoloadFile() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var contract = row.contract;
        //var download = $("#downloadA");
        //location.href=contextPath+"/customer/downFile?fileName="+contract;
        //download.attr("href", contextPath + "/customer/downFile?fileName=" + contract);
        $.messager.confirm('下载提示', '您确定要下载该文件吗？<br>'+'<br>文件：\n'+row.contract,function(yes){
            if (yes){
                location.href=contextPath+"/customer/downFile?fileName="+contract;
            }
        });
    }else {
        showAlert("请选择需要操作的栏目！");
    }
}
/**
 *激活与冻结客户
 */
function updateStatusCus(status) {
    var row = $("#list").datagrid("getSelected");
    if (row){
        if(status=="1"||status=="0"){
            if(row.status==status){
                showAlert("无需"+(status=='1'?"激活":"冻结")+"该用户！");
                return;
            }
            var json;
            if(status=='1'){//激活
                json = {
                    "status": '1',
                    "id": row.id
                }
            }else if(status=='0'){//冻结
                json = {
                    "status": '0',
                    "id": row.id
                }
            }
            $.post(
                contextPath+"/customer/statusCustomer",
                json,
                function (data) {
                    if (data.controllerResult.result == "success") {
                        showAlert(data.controllerResult.message);
                        $("#list").datagrid("reload");
                    } else {
                        showAlert(data.controllerResult.message);
                        $("#list").datagrid("reload");
                    }
                },
                "json"
            );
        }else {
            showAlert("修改失败！参数发生了错误");
        }
    }else {
        showAlert("请选择需要操作的栏目！");
    }
}

/**
 *修改客户信息
 */
function showCusEdit() {
    if (formValidate("editCusForm")) {
        var row = $("#list").datagrid("getSelected");
        if (row){
            openWin("editCus");
        }else {
            showAlert("请选择需要修改的栏目！");
        }
    }
}
function updateCusInfo() {
    var birthday = $("#birthday");
    birthday.attr("name","customer.birthday");
    var customer_type = $("#customer_type");
    customer_type.attr("name","customer.customer_type");
    if (formValidate("form")){
        $.post(
            contextPath+"/customer/updateCustomerInfo",
            $("#form").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    $("#list").datagrid("reload");
                    closeWin('win');
                }else {
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
    }
}


/**
 *添加客户
 */
function savaCus() {
    if(formValidate("saveCusForm")){
        $.post(
            contextPath+"/customer/saveCustomer",
            $("#saveCusForm").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    window.location.href="emp_customers.jsp";
                }else {
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
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
function saveName() {
    $.post(
        contextPath+"/customer/saveFileCustomer",
        $("#uploadForm").serialize(),
        function (data) {
            $("#list").datagrid("reload");
            showAlert(data.controllerResult.message);
        },
        "json"
    );
    $('#upload').fileinput('clear');
    closeWin("uploadFile");
}
/**
 *选中某行数据，判断是否有可下载合同
 */
function ClickRow() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        var value = row.contract;
        if (value!=null) {
            $("#downloadBtn").removeAttr("disabled");
            $("#downloadBtn"). css({"background-color":"#6699FF "});
        }else{
            $("#downloadBtn").attr("disabled",true);
            $("#downloadBtn"). css({"background-color":"#CCCCCC "});
        }
    }
}

/**
 *日期格式：出生日期
 */
function formatBirthday(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();

        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }

        return year + "-" + month + "-" + day;
    }
}