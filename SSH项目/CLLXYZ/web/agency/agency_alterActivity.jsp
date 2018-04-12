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
            <label for="title" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="activity.title"
                       id="title" value="${requestScope.activity.title}" />
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="address" name="activity.address" value ="${requestScope.activity.address}" />
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">活动内容</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="content" name="activity.content" value ="${requestScope.activity.content}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">活动楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="activity.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>
        <div class="form-group ">
            <label class="col-sm-2 control-label ">开始时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimeberbox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="start_time" name="activity.start_time" value ="${requestScope.activity.start_time}"/>
            </div>
        </div>

        <div class="form-group ">
            <label class="col-sm-2 control-label ">结束时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimeberbox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="end_time" name="activity.end_time" value ="${requestScope.activity.end_time}"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="updateActivity();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>
    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_activity.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>