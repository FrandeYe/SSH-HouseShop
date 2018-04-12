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
    <title>销售情况</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet" />
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        url:'<%=path %>/room/pagerRoomAgency',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">销售编号</th>
        <th data-options="field:'name',align:'center'">房号名称</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="validRoom(1);">激活房号</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="validRoom(0);">冻结房号</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="baseMessageRoom();">修改房号信息</a>
</div>


<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的Js-->
<script src="<%=path %>/public/js/xie/agency_room.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</body>
</html>
