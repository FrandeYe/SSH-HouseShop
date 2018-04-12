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
        url:'<%=path %>/message/pagerMessageAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'',checkbox:true"></th>
        <th data-options="field:'user',align:'center',formatter:formatName">用户名称</th>
        <th data-options="field:'buildings',align:'center',formatter:formatName">留言楼盘</th>
        <th data-options="field:'content',align:'center'">留言内容</th>
        <th data-options="field:'leave_time',align:'center',formatter:formatDate">留言时间</th>
        <th data-options="field:'reply',align:'center'">回复内容</th>
        <th data-options="field:'reply_time',align:'center',formatter:formatDate">回复时间</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="removeMessage();">删除留言</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showReplyMsgWin();">回复留言</a>
</div>

<!--编辑窗口-->
<div id="editWin" class="easyui-window normal-win" title="留言回复" data-options="closed:true" style="width:450px;height:270px;"，>
    <form id="editForm">
        <input type="hidden" name="message.id"/>
        <input class="easyui-textbox easyui-validatebox" data-options="multiline:true,required:true" style="width:430px;height:190px;" name="message.reply">

        <div id="dlg-buttons" class="col-md-offset-8" style="margin-top: 10px;">
            <a href="javascript:void(0);" class="easyui-linkbutton" onclick="replyMessage()">确认</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:$('#editWin').dialog('close')">取消</a>
        </div>
    </form>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/chen/message.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
