<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/28
  Time: 8:51
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
        url:'<%=path %>/admin/pagerUser',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">编号</th>
        <th data-options="field:'headicon',width:80">头像</th>
        <th data-options="field:'nickname',width:80">昵称</th>
        <th data-options="field:'name',width:80">真实姓名</th>
        <th data-options="field:'phone',width:90,align:'right'">手机号</th>
        <th data-options="field:'email',width:150,align:'right'">邮箱</th>
        <th data-options="field:'gender',width:80,align:'center'">性别</th>
        <th data-options="field:'birthday',width:150,align:'center'">生日</th>
        <th data-options="field:'tel',width:90,align:'center'">固定电话</th>
        <th data-options="field:'checked_time',width:60,formatter:formatStatus">审核状态</th>
        <th data-options="field:'status',width:60,align:'center',formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="valid(1);">激活</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="valid(0);">冻结</a>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/users.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
