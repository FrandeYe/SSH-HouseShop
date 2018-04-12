<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/9/1
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>查看单个活动详情</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="building.name"
                       id="name" value="${requestScope.building.name}" />
            </div>
        </div>
        <div class="form-group">
            <label for="total_floor" class="col-sm-2 control-label">总层数</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="total_floor" name="building.total_floor" value ="${requestScope.building.total_floor}" />
            </div>
        </div>
        <div class="form-group">
            <label for="total_lift" class="col-sm-2 control-label">电梯数</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="total_lift" name="building.total_lift" value ="${requestScope.building.total_lift}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="floor_rooms" class="col-sm-2 control-label">每层户数</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="floor_rooms" name="building.floor_rooms" value ="${requestScope.building.floor_rooms}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="total_room" class="col-sm-2 control-label">总户数</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="total_room" name="building.total_room" value ="${requestScope.building.total_room}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">楼栋关联的楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="building.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>
        <div class="form-group ">
            <label class="col-sm-2 control-label ">创建时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimebox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="created_time" name="building.created_time" value ="${requestScope.building.created_time}"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="updateBuilding();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>

    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_building.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>