
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>修改经销商基本信息</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="editAgencyForm">
        <div class="form-group" id="editInfo">
            <a style="margin:2% 1% 1% 35%;" class="col-sm-offset-3  btn btn-primary btn-lg"
               onclick="showAgencyEdit();">修改信息</a>
        </div>
        <div class="form-group">
            <div class="col-sm-6">
                <input type="hidden" readonly class=""
                       data-options="required:true, novalidate:true"
                       id="customer_id" name="agency.id" value="${sessionScope.agency.id}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control easyui-validatebox  "
                       data-options="prompt:'Enter User Name.',required:true,novalidate:true"
                       id="name" name="agency.name" value="${sessionScope.agency.name}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control easyui-validatebox"
                       data-options="prompt:'Enter a valid email.',novalidate:true,required:true"
                       id="email" name="agency.email" value="${sessionScope.agency.email}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="leader" class="col-sm-2 control-label">负责人</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control easyui-validatebox"
                       data-options="novalidate:true,required:true"
                       id="leader" name="agency.leader" value="${sessionScope.agency.leader}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-6">
                <input type="number" readonly class="form-control easyui-validatebox"
                       data-options="prompt:'Enter your phone number.',novalidate:true,required:true"
                       id="phone" name="agency.phone" value="${sessionScope.agency.phone}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-sm-2 control-label">固定电话</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control easyui-validatebox"
                       data-options="novalidate:true,required:true"
                       id="tel" name="agency.tel" value="${sessionScope.agency.tel}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" readonly class="form-control easyui-validatebox  "
                       data-options="novalidate:true,required:true"
                       id="address" name="agency.address" value="${sessionScope.agency.address}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">公司简介</label>
            <div class="col-sm-6">
                <textarea cols="60" readonly rows="10" data-options="required:true, novalidate:true"
                          class="form-control easyui-validatebox"
                          id="intro" name="agency.intro">${sessionScope.agency.intro}</textarea>
            </div>
        </div>
        <div id="editbtn" style="display: none">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="updateBaseMessage();">确认</a>
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="window.location.reload();">取消</a>
        </div>
    </form>
</div>

<!--修改信息的窗口-->
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义js-->
<script src="<%= path %>/public/js/xie/agency_baseMessage.js"></script>
</html>
