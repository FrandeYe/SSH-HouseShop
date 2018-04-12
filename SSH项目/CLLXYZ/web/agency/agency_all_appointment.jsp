<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/27
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
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
        url:'<%=path %>/appointment/pagerAppointmentAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>

    <tr>
        <th data-options="field:'',checkbox:true,align:'center'"></th>
        <th data-options="field:'user',align:'center',formatter:formatUser">用户名称</th>
        <th data-options="field:'app_arrive_time',align:'center',formatter:formatDate">预约看房时间</th>
        <th data-options="field:'arrive_time',align:'center',formatter:formatDate">真实看房时间</th>
        <th data-options="field:'app_status',align:'center'">预约状态</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validAppointment(1);">激活预约</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validAppointment(0);">冻结预约</a>
</div>
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/chen/appointment.js"></script>
<script>
    $(function () {
        setPagination("list");
        formatAppStatus();
    })
</script>
</html>
