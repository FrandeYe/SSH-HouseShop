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
    <title>经销商添加楼栋</title>

    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
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
        url:'<%=path %>/building/pagerBuildingAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">楼栋编号</th>
        <th data-options="field:'name',align:'center'">名称</th>
        <th data-options="field:'buildings',align:'center',formatter:formatName">所属楼盘</th>
        <th data-options="field:'total_floor',align:'center'">总层数</th>
        <th data-options="field:'total_lift',align:'center'">电梯数</th>
        <th data-options="field:'floor_rooms',align:'center'">每层多少户</th>
        <th data-options="field:'total_room',align:'center'">总户数</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validBuilding(1);">激活楼栋</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validBuilding(0);">冻结楼栋</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('building.', 9);">修改楼栋</a>
</div>

<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">

        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="status"/>
            <input type="hidden" name="logo"/>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_floor" class="col-sm-2 control-label">总层数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                           data-options="required:true, novalidate:true"
                           id="total_floor" name="total_floor"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_lift" class="col-sm-2 control-label">电梯数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                           data-options="required:true, novalidate:true"
                           id="total_lift" name="total_lift"/>
                </div>
            </div>
            <div class="form-group">
                <label for="floor_rooms" class="col-sm-2 control-label">每层户数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                           data-options="required:true, novalidate:true"
                           id="floor_rooms" name="floor_rooms"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_room" class="col-sm-2 control-label">总户数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                           data-options="required:true, novalidate:true"
                           id="total_room" name="total_room"/>
                </div>
            </div>
            <div class="form-group">
                <label for="buildings" class="col-sm-2 control-label">楼栋所属楼盘</label>
                <div class="col-sm-6">
                    <select id="buildings" name="buildings.id"
                            class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                    </select>
                </div>
            </div>
            <div class="form-group">

                <a href="javascript:;" class="col-sm-offset-3 btn btn-primary" onclick="updateBuilding()">确认</a>
                <a href="javascript:;" onclick="closeWin('win')" class="btn btn-default">取消</a>
            </div>
        </form>

    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!--自己的js-->
<script src="<%=path %>/public/js/xie/agency_building.js"></script>
<script src="<%=path %>/public/js/lai/load_form_data.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>


<script>
    $(function () {
        setPagination("list");
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
