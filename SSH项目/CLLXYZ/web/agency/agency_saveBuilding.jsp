<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/8/29
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>经销商增加楼栋</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>

</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <input type="hidden" id="id_input" name="building.agency.id" value="${sessionScope.agency.id}" />
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">楼栋名称</label>
            <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'ZE'"
                           id="name" name="building.name" placeholder="请输入楼栋名称:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">楼栋楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="building.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true"></select>
            </div>
        </div>
        <div class="form-group">
            <label for="total_floor" class="col-sm-2 control-label">总层数</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'integer'"
                       id="total_floor" name="building.total_floor" placeholder="请输入总层数:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="floor_rooms" class="col-sm-2 control-label">每层户数</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'integer'"
                       id="floor_rooms" name="building.floor_rooms" placeholder="请输入每层户数:" />
            </div>
        </div>
        <div class="form-group">
            <label for="total_lift" class="col-sm-2 control-label">电梯数</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'integer'"
                       id="total_lift" name="building.total_lift" placeholder="请输入电梯数:"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="addBuilding();">确认</a>
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
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
