<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 20:25
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
        url:'<%=path %>/like/pagerLikeUser?id=${sessionScope.user.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'buildings',width:150,align:'center',formatter:formatBuildings">点赞楼盘</th>
        <th data-options="field:'created_time',width:150,formatter:formatDate">创建时间</th>
    </tr>
    </thead>

</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="verifyDelete();">删除点赞</a>
</div>

<div id="dlg" class="easyui-dialog" title="删除" closed="true" style="width:280px;height:180px;padding:10px"
     data-options="
				buttons: '#dlg-buttons'
			">
    <div style="margin-left: 80px;margin-top: 25px;">是否确认删除？</div>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="deleter();">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/like.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>

