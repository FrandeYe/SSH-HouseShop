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
        url:'<%=path %>/comment/pagerCommentAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'',checkbox:true"></th>
        <th data-options="field:'user',align:'center',formatter:formatName">用户名称</th>
        <th data-options="field:'buildings',align:'center',formatter:formatName">评价楼盘</th>
        <th data-options="field:'content',align:'center'">评价内容</th>
        <th data-options="field:'comment_time',align:'center',formatter:formatDate">评价时间</th>
        <th data-options="field:'status',align:'center', formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="openDlg('dlg');">删除评价</a>
</div>

<div id="dlg" class="easyui-dialog" title="删除"  style="width:280px;height:180px;padding:10px"
     data-options="
				buttons: '#dlg-buttons',
				closed:true
			">
    <div style="margin-left: 80px;margin-top: 25px;">是否确认删除？</div>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="removeComment();">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDig('dlg')">取消</a>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/chen/comment.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
