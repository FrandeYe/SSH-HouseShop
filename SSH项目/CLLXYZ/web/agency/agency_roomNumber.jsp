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
    <title>生成房号</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">选择楼盘</label>
            <div class="col-sm-6">
                <select onchange="setBuilding(1);" id="buildings" name="room.buildings.id" class="form-control">

                </select>
            </div>
            <a style="position: absolute;top: auto;left: auto;" class="btn btn-primary" onclick="setBuilding(1);">确认</a>
        </div>

        <div class="form-group">
            <label for="building" class="col-sm-2 control-label">选择楼栋</label>
            <div class="col-sm-6">
                <select onchange="setHouse()" id="building" name="room.building.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
            <a  href="javascript:void(0)" class="btn btn-primary" onclick="setHouse();">确认</a>

            </div>

            <!--隐藏的div-->
            <div id="hiddenDiv"></div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="openDlg('dlg')">生成房号</a>
        </div>
    </form>
</div>

<div id="dlg" class="easyui-dialog" title="删除" closed="true" style="width:280px;height:150px;padding:10px"
     data-options="
				buttons: '#dlg-buttons'
			">
    <div>生成房号后，数据无法撤销（该楼栋不能再次生成房号），
        是否继续？</div>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="saveRoom();">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDig('dlg')">取消</a>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_room.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
