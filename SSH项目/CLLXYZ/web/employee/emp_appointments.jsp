
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
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
        url:'<%=path %>/appointment/pagerAppointmentEmployee?emp_id=${employee.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id', checkbox:true"></th>
        <th data-options="field:'user',align:'right',formatter:formatUser">姓名</th>
        <th data-options="field:'house',align:'right',formatter:formatHouse">户型名称</th>
        <th data-options="field:'app_status',align:'right'">预约状态</th>
        <th data-options="field:'app_arrive_time',formatter:formatDate">预约看房时间</th>
        <th data-options="field:'arrive_time',align:'right',formatter:formatDate">实际看房时间</th>
        <th data-options="field:'created_time',align:'right',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'right', formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showAppEdit();">修改预约状态</a>
</div>
<!--修改状态窗口-->
<div id="editApp" class="easyui-window normal-win" data-options="closed:true" title="修改预约状态">
    <form id="editAppForm">
        <table>
            <tr>
                <td><label>选择状态</label></td>
                <td>
                    <div class="form-group">
                        <select name="appointment.app_status" id="app_status">
                            <option value="已购房">已购房</option>
                            <option value="已预约">已预约</option>
                            <option value="已联系">已联系</option>
                            <option value="已购房">已看房</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <!--隐藏id-->
                <td>
                    <input type="hidden" id="app_id" name="appointment.id" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="updateAppStatus()">修改</a></td>
            </tr>
        </table>
    </form>
</div>

</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义的js-->
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script>
    $(function () {
        setPagination("list");
        bgcolorStatus();
    })
</script>
</html>
