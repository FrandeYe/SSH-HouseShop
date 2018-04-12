
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>员工添加销售记录</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <!--自定义css-->
    <link rel="stylesheet" href="<%=path %>/public/css/ye/employee-css/emp_sale.css"/>
</head>
<body>
<div>
    <div id="saveSale" class="col-md-12">
        <form class="form-horizontal" id="saveSaleForm">
			<div class="form-group">
                <label class="col-sm-2 control-label">客户名</label>
                <div class="col-sm-6">
                    <select id="customers" name="customer_id" class="form-control easyui-validatebox
                    data-options= required:true, novalidate:true">

                    </select>
                </div>
            </div>
            <div>
                <div class="col-sm-6">
                    <input type="hidden" class=""
                           data-options="required:true, novalidate:true"
                           id="employee.id" name="emp_id" value="${sessionScope.employee.id}"/>
                </div>
            </div>
            <div>
                <div class="col-sm-6">
                    <input type="hidden" class=""
                           data-options="required:true, novalidate:true"
                           id="" name="agency_id" value="${sessionScope.employee.agency.id}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">楼栋</label>
                <div class="col-sm-6">
                    <select id="building" name="building_id" onchange="getRoom();"
                            class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                    </select>
                </div>
                <a href="#" style="top: auto;left: auto;" class="btn btn-primary btn-sm"
                   onclick="getRoom();">确认</a>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">房号</label>
                <div class="col-sm-6">
                    <select id="rooms" name="room_id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="unit_price" class="col-sm-2 control-label">销售单价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="unit_price" name="sale.unit_price"/>
                </div>
            </div>
            <div class="form-group">
                <label for="discount" class="col-sm-2 control-label">销售折扣</label>
                <div class="col-sm-6">
                    <input type="discount" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="discount" name="sale.discount"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_cost" class="col-sm-2 control-label">总费用</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-validatebox form-control"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="total_cost" name="sale.total_cost"/>
                </div>
            </div>

            <div class="form-group">
                <label for="sale_time" class="col-sm-2 control-label">销售时间</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-datetimebox form-control"
                           data-options="required:true, novalidate:true"
                           validType="dateTime"
                           id="sale_time" name="sale.sale_time"/>
                </div>
            </div>

            <div class="form-group ">
                <div class="col-sm-6">
                    <input type="hidden" class=""
                           data-options="required:true, novalidate:true"
                           id="created_time" name="sale.created_time" />
                </div>
            </div>
            <div class="form-group" style="margin-left: -5%;">
                <a class="col-sm-offset-3  btn btn-primary btn-lg" onclick="saveSale();">添加</a>
                <button type="reset" class="col-sm-offset-1 btn btn-default btn-lg">重置</button>
                <a style="margin-left:10%;" class="btn btn-warning btn-lg"
                   onclick="window.location.href='emp_sales.jsp'">取消</a>
            </div>
        </form>
    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_emps.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_sale.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script type="text/javascript">
    $(function () {
        setCustomers("${sessionScope.employee.id}");
        getBuilding("${sessionScope.employee.buildings.id}", 0);
    })
</script>
</body>
</html>
