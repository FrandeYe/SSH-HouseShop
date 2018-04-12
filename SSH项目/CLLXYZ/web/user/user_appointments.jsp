<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet" />
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,
        collapsible:true,
        rownumbers:true,
        pagination:true,
        pageSize:20,
        toolbar:'#tb',
        url:'<%=path %>/appointment/pagerAppointmentUser?id=${sessionScope.user.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'house',width:100,align:'center',formatter:formatHouse">户型号</th>
        <th data-options="field:'employee',width:130,align:'center',formatter:formatEmployee">预约员工</th>
        <th data-options="field:'agency',width:150,align:'center',formatter:formatAgency">预约经销商</th>
        <th data-options="field:'app_arrive_time',width:150,formatter:formatDate">预约看房时间</th>
        <th data-options="field:'arrive_time',width:150,formatter:formatDate">真实看房时间</th>
        <th data-options="field:'created_time',width:150,formatter:formatDate">预约创建时间</th>
        <th data-options="field:'app_status',width:60,align:'center'">预约状态</th>
    </tr>
    </thead>

</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="verifyDelete()">删除预约</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin();">修改</a>
</div>

<div id="editWin" class="easyui-dialog" title="修改预约时间" style="width:350px;height:200px;padding:20px 20px" closed="true">
    <form id="editForm">
        <input type="hidden" name="appointment.id"/>
        <div class="fitem">
            <label>预约看房时间</label>
            <input name="appointment.app_arrive_time" class="easyui-datetimebox" data-options="required:true,novalidate:true,validType:'datetime' ">
        </div>
        <div class="fitem">
            <label>真实看房时间</label>
            <input name="appointment.arrive_time" class="easyui-datetimebox" data-options="required:true,novalidate:true,validType:'datetime' ">
        </div>
    </form>
    <div id="dlg-buttons" style="margin-top: 43px;" class="col-md-offset-7">
        <a href="#" class="easyui-linkbutton" onclick="confirm()">确认</a>
        <a href="#" class="easyui-linkbutton" onclick="javascript:$('#editWin').dialog('close')">取消</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog" title="删除" closed="true" style="width:280px;height:180px;padding:10px"
     data-options="
				buttons: '#dlg-button'
			">
    <div style="margin-left: 80px;margin-top: 25px;">是否确认删除？</div>
</div>

<div id="dlg-button">
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="deleter();">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/appointments.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>

