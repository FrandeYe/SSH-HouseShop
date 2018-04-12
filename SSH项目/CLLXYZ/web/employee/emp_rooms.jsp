<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/8/29
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">
    <form class="form-horizontal" id="addForm">
        <input type="hidden" id="" name=""/>
        <div class="form-group" style="margin-left:-10%;margin-top:2%;">
            <label for="building"class="col-sm-2 control-label">当前楼栋</label>
            <div class="col-sm-2">
                <select id="building" name="building_id" onchange="setRoomTable();"
                        class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                </select>
            </div>
            <a href="#" style="position: absolute;top: auto;left: auto;" class="btn btn-primary btn-sm"
               onclick="setRoomTable();">确认</a>
        </div>
    </form>
</div>

<table id="list" class="easyui-datagrid"
       data-options="
        onClickRow:ClickRow,
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true"></th>
        <th data-options="field:'house',align:'center',formatter:formatName">户型</th>
        <th data-options="field:'name',align:'center'">房号</th>
        <th data-options="field:'sale_status',align:'center'">销售状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <input title="请选择已售的房号" type="button" disabled class="btn btn-success btn-xs" id="showBtn" value="查看业主详情" onclick="showCustomerWin('customer.');"/>
</div>
<!--业主信息显示：开始-->
<div id="win" class="easyui-window" title="业主信息" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-md-12">
        <form class="form-horizontal" id="form" style="margin-left: 12%">
            <div class="form-group">
                <!--隐藏id-->
                <input type="hidden" name="id" id="id"/>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">客户姓名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="ZE"
                           id="name" name="name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <div class="col-sm-6">
                        <input type="radio" disabled name="gender" id="gender" value="M"/>男
                        <input type="radio" disabled name="gender" id="gender" value="F"/>女
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="identity_id" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="idCode"
                           id="identity_id" name="identity_id" placeholder="请输入身份证号:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                <div class="col-sm-6">
                    <input type="text" disabled style="width:100%" class="form-control easyui-datebox easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           id="birthday" name="birthday"/>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="email"
                           id="email" name="email" placeholder="请输入邮箱:"/>
                </div>
            </div>

            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="length[1,30]"
                           id="address" name="address" placeholder="请输入地址:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="customer_type" class="col-sm-2 control-label">客户类型</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="length[1,30]"
                           id="customer_type" name="customer_type" />
                </div>
            </div>
            <div class="form-group">
                <label for="together" class="col-sm-2 control-label">共同购房人</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="group"
                           id="together" name="together"/>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input style="width:100%" type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="phone" name="phone" placeholder="请输入手机号:"/>
                </div>
            </div>
            <div class="form-group">
                <a style="margin-left:35%;" class="btn btn-warning btn-lg"
                   onclick="closeWin('win');">关闭</a>
            </div>
        </form>

    </div>
</div>
<!--业主信息：结束-->
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_room.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_sale.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_room.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_common.js"></script>
<script>
    $(function () {
        getBuilding("${sessionScope.employee.buildings.id}",0);
        formatSaleStatus();
    })
</script>
</body>
</html>
