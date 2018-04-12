<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 20:26
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
        url:'<%=path %>/message/pagerMessageUser?id=${sessionScope.user.id}',
        method:'get'">
    <thead>
    <tr>

        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'content',width:290">留言内容</th>
        <th data-options="field:'leave_time',width:150,formatter:formatDate">留言时间</th>
        <th data-options="field:'reply',width:295,align:'left'">经销商的回复内容</th>
        <th data-options="field:'agency',width:100,formatter:formatAgency">经销商名称</th>
        <th data-options="field:'reply_time',width:150,formatter:formatDate">回复时间</th>
        <th data-options="field:'status',width:60,align:'center',formatter:formatStatus">状态</th>
    </tr>
    </thead>

</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="valid(1);">激活</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="valid(0);">冻结</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin();">修改</a>
</div>

<!--编辑窗口-->
<div id="editWin" class="easyui-window normal-win" title="修改留言" data-options="closed:true" style="width:450px;height:270px;">
    <form id="editForm">
        <input type="hidden" name="message.id"/>
        <input class=" easyui-textbox easyui-validatebox " data-options="multiline:true,required:true" style="width:430px;height:190px;" name="message.content">

        <div id="dlg-buttons" class="col-md-offset-8" style="margin-top: 10px;">
            <a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateMessage()">确认</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:$('#editWin').dialog('close')">取消</a>
        </div>
    </form>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>

<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/messsage.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
