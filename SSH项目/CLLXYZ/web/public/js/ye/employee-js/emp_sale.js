/**
 * 获取楼盘的楼栋
 */
function getBuilding(id, roomStatus) {
    $.post("/building/pagerBuildingBuildingsVO?id=" + id + "&roomStatus=" + roomStatus,
        function (data) {
            if (data) {
                var buildingsSelect = $("#building");
                $.each(data.nameIdVOList, function (index, buildings) {
                    buildingsSelect.append('<option value="' + buildings.id + '"> ' + buildings.name + '</option>');
                });
            }
        }, "json"
    );
}
/**
 *根据楼栋id获取房号
 */
function getRoom() {
    var id = $("#building").val();
    $.post("/room/pagerRoomBuildingVO?id=" + id,
        function (data) {
            if (data) {
                var roomSelect = $("#rooms");
                roomSelect.empty();
                $.each(data.nameIdVOList, function (index, room) {
                    roomSelect.append('<option value="' + room.id + '"> ' + room.name + '</option>');
                });
            } "json"});
}

/**
 *激活与冻结记录
 */
function updateStatusSale(status) {
    var row = $("#list").datagrid("getSelected");
    if (row){
        if(row.status==status){
            showAlert("无需"+(status=='1'?"激活":"冻结")+"该记录！");
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
            contextPath+"/sale/statusSale",
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
        showAlert("请选择需要操作的栏目！");
    }
}
/**
 * 销售记录的修改
 */
function showSaleEdit() {
    if (row){
    }else {
        showAlert("请选择需要修改的栏目！");
    }
}
function updateSale() {
    var created_time = $("#created_time");
    created_time.attr("name","sale.created_time");
    var sale_time = $("#sale_time");
    sale_time.attr("name","sale.sale_time");
    if (formValidate("form")){
        $.post(
            contextPath+"/sale/updateSale",
            $("#form").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    closeWin("win");
                    $("#list").datagrid("reload");
                }else {
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
    }
}
/**
 *客户信息
 */
function  showCustomer() {
    var row = $("#list").datagrid("getSelected");
    if (row) {
        $("#name").val(row.customer.name);
        if (row.customer.gender=='F'){
            $("#gender").val('女');
        }else {
            $("#gender").val('男');
        }
        $("#identity_id").val(row.customer.identity_id);
        $("#birthday").val(row.customer.birthday);
        $("#email").val(row.customer.email);
        $("#address").val(row.customer.address);
        $("#customer_type").val(row.customer.customer_type);
        $("#together").val(row.customer.together);
        $("#phone").val(row.customer.phone);
        openWin("winCustomer");
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}
/**
 *添加销售记录
 */
function saveSale() {
    if (formValidate("saveSaleForm")){
        $.post(
            contextPath+"/sale/saveSale",
            $("#saveSaleForm").serialize(),
            function (data) {
                if (data.controllerResult.result=="success"){
                    showAlert(data.controllerResult.message);
                    window.location.href="emp_sales.jsp";
                }else {
                    showAlert(data.controllerResult.message);
                }
            },
            "json"
        );
    }
}
function setCustomers(id) {
    $.post(
        contextPath+"/customer/pagerCustomerEmployeeVO?emp_id=" + id,
        function (data) {
            if (data) {
                var customerSelect = $("#customers");
                $.each(data.nameIdVOList, function (index, customers) {
                    customerSelect.append('<option value="' + customers.id + '"> ' + customers.name + '</option>');
                });
            }
        }, "json"
    );
}

/**
 *显示修改记录
 */
var canAlter = false;
function  showEditWin(javaObject, objStrNum) {
    var row = $("#list").datagrid("getSelected");
    if (row) {
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
    }else{
        showAlert("请选择需要操作的栏目！");
    }
}