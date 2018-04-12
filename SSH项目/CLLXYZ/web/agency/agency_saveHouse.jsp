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
        <input type="hidden" id="id_input" name="house.agency.id" value="${sessionScope.agency.id}" />
        <input type="hidden" name="buildings.area"  id="buildings_area"/>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">户型名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'ZE'"
                       id="name" name="house.name" placeholder="请输入户型名称" />
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">户型所属楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="house.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-6">
                <textarea cols="60" rows="10" data-options="required:true, novalidate:true, validType:'ZE'"
                          class="form-control easyui-validatebox" placeholder="请输入简介:"
                          id="intro" name="house.intro"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="area" class="col-sm-2 control-label">面积</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'number'"
                       id="area" name="house.area" placeholder="请输入面积" />
            </div>
        </div>
        <div class="form-group">
            <label for="unit_price" class="col-sm-2 control-label">参考单价</label>
            <div class="col-sm-6">
                <input type="text"  class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'number'"
                       id="unit_price" name="house.unit_price" placeholder="请输入参考单价"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="addHouse();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>

    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_house.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
