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
                       data-options="required:true, novalidate:true" name="house.name"
                       id="name" value="${requestScope.house.name}" />
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="intro" name="house.intro" value ="${requestScope.house.intro}" />
            </div>
        </div>
        <div class="form-group">
            <label for="area" class="col-sm-2 control-label">面积</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="area" name="house.area" value ="${requestScope.house.area}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="unit_price" class="col-sm-2 control-label">参考单价</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="unit_price" name="house.unit_price" value ="${requestScope.house.unit_price}"/>
            </div>
        </div>

        <div class="form-group ">
            <label class="col-sm-2 control-label ">创建时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimeberbox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="created_time" name="house.created_time" value ="${requestScope.house.created_time}"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="updateHouse();">确认</a>
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

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>