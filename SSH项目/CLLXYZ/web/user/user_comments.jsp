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
        url:'<%=path %>/comment/pagerCommentUser?id=${sessionScope.user.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'content',width:150">评价内容</th>
        <th data-options="field:'comment_time',width:150,formatter:formatDate">评价时间</th>
        <th data-options="field:'buildings',width:150,align:'center',formatter:formatBuildings">所在楼盘</th>
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
<div id="editWin" class="easyui-window normal-win" title="修改评价" data-options="closed:true" style="width:450px;height:260px;">
    <form id="editForm">
        <input type="hidden" name="comment.id"/>
        <table>
            <tr>
                <td>
                    <input class="easyui-textbox easyui-validatebox" data-options="multiline:true,required:true" style="width:430px;height:190px;" name="comment.content">
                </td>
            </tr>
            <tr>
                <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="updateComment()" style="margin-left: 370px;">修改</a></td>
            </tr>
        </table>
    </form>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/comments.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
