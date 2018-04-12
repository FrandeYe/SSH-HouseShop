<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/8
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>未审核经销商</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet" />
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:false,  <!--是否支持多选 当为false时能支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        url:'<%=path %>/agency/foundUncheckedAgencies',
        method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">经销商id</th>
        <th data-options="field:'logo',align:'center',formatter:formatLogo">图标</th>
        <th data-options="field:'name',align:'right'">名称</th>
        <th data-options="field:'email',align:'right'">邮箱</th>
        <th data-options="field:'leader',align:'right'">领导</th>
        <th data-options="field:'phone',align:'center'">手机号</th>
        <th data-options="field:'tel',align:'center'">固定电话</th>
        <th data-options="field:'address',align:'center'">地址</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">注册日期</th>
        <th data-options="field:'checked_status',align:'center',formatter:formatCheckStatus">审查是否通过</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="checkedAgencies();">审核</a>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/liu/agencyChecked.js"></script>
<script src="<%=path%>/public/js/liu/commonFormat.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>

</body>
</html>
