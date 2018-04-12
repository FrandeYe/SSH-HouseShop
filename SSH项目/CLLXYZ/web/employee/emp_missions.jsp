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
        url:'<%=path %>/mission/pagerMissionEmployee?id=${sessionScope.employee.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id', checkbox:true"></th>
        <th data-options="field:'monthes'">月份</th>
        <th data-options="field:'quantity',align:'right'">任务量</th>
        <th data-options="field:'saleCount',align:'center'">已完成任务量</th>
        <th data-options="field:'bonus_percent',align:'right'">销售提成</th>
        <th data-options="field:'employee',align:'right',formatter:formatEmployee">基本工资</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="">

</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义的js-->
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script src="<%=path %>/public/js/lai/agency_mission.js"></script>
<script>
    $(function () {
        setPagination("list");
        formatSaleCount();
    })
</script>
</html>
