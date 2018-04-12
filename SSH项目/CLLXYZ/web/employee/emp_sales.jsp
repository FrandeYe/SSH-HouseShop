
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,
        collapsible:true,
        rownumbers:true,
        pagination:true,
        striped:true,
        pageSize:20,
        toolbar:'#tb',
        url:'<%=path %>/sale/pagerSale?id=${sessionScope.employee.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id', checkbox:true"></th>
        <th data-options="field:'customer',align:'right',formatter:formatUser">客户姓名</th>
        <th data-options="field:'unit_price',align:'right'">销售单价</th>
        <th data-options="field:'discount',align:'right'">销售折扣</th>
        <th data-options="field:'total_cost'">销售总价</th>
        <th data-options="field:'sale_time',align:'right',formatter:formatDate">销售时间</th>
        <th data-options="field:'created_time',align:'right',formatter:formatBirthday">创建时间</th>
        <th data-options="field:'status',align:'right', formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('sale.',5);">修改记录</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateStatusSale('1');">激活记录</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateStatusSale('0');">冻结记录</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showCustomer('customer.',9);">查看客户详情</a>
</div>
<!--修改记录窗口：开始-->
<div id="win" class="easyui-window" title="修改销售记录" style="width:800px;height:400px"
      data-options="closed:true,modal:true">
    <div class="col-md-12">
        <form class="form-horizontal" style="margin-left: 8%" id="form">
            <div class="form-group">
                <div class="col-sm-6">
                    <input type="hidden" class="form-control"
                           id="id" name="id"/>
                </div>
            </div>
            <div class="form-group">
                <label for="unit_price" class="col-sm-2 control-label">销售单价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="unit_price" name="unit_price"/>
                </div>
            </div>
            <div class="form-group">
                <label for="discount" class="col-sm-2 control-label">销售折扣</label>
                <div class="col-sm-6">
                    <input type="discount" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="discount" name="discount"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_cost" class="col-sm-2 control-label">总费用</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-validatebox form-control"
                           data-options="required:true, novalidate:true"
                           validType="xiaoshu"
                           id="total_cost" name="total_cost"/>
                </div>
            </div>

            <div class="form-group">
                <label for="sale_time" class="col-sm-2 control-label">销售时间</label>
                <div class="col-sm-6">
                    <input type="text" style="width: 100%" class="easyui-datetimebox form-control"
                           data-options="required:true, novalidate:true"
                           id="sale_time" name="sale_time"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <input type="hidden" class="easyui-datetimebox"
                           data-options="required:true, novalidate:true"
                           id="created_time" name="created_time"/>
                </div>
            </div>
            <div class="form-group" style="margin-left: -10%;">
                <a class="col-sm-offset-3  btn btn-primary btn-lg" onclick="updateSale();">修改</a>
                <a class="col-sm-offset-3  btn btn-warning btn-lg" style="margin-left:23%;" onclick="closeWin('win');">取消</a>
            </div>
        </form>
    </div>
</div>
<!--修改记录窗口：结束-->
<!--客户详情：开始-->
<div id="winCustomer" class="easyui-window" title="客户信息" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12" >
        <form class="form-horizontal" id="formCustomer" style="margin-left: 12%">
            <%--<div class="form-group">--%>
                <%--<!--隐藏id-->--%>
                <%--<input type="hidden" name="id" id="id"/>--%>
            <%--</div>--%>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">客户姓名</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="ZE"
                           id="name" name="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="gender" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="gender" name="gender"/>
                </div>
            </div>
            <div class="form-group">
                <label for="identity_id" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="idCode"
                           id="identity_id" name="identity_id" placeholder="请输入身份证号:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                <div class="col-sm-6">
                    <input type="text" readonly style="width:100%" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           id="birthday" name="birthday"/>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="email"
                           id="email" name="" placeholder="请输入邮箱:"/>
                </div>
            </div>

            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="length[1,30]"
                           id="address" name="address" placeholder="请输入地址:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="customer_type" class="col-sm-2 control-label">客户类型</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="group"
                           id="customer_type" name="customer_type"/>
                </div>
            </div>
            <div class="form-group">
                <label for="together" class="col-sm-2 control-label">共同购房人</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="group"
                           id="together" name="together"/>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input style="width:100%" type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="phone" name="phone" />
                </div>
            </div>
            <div class="form-group">
                <a style="margin-left:35%;" class="btn btn-warning btn-lg"
                   onclick="closeWin('winCustomer')">关闭</a>
            </div>
        </form>

    </div>
</div>
<!--客户详情：结束-->
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义的js-->
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_sale.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_common.js"></script>
<%--<script src="<%=path %>/public/js/lai/load_form_data.js"></script>--%>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
