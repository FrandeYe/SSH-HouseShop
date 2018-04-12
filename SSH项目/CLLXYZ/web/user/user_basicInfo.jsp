<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>基本信息的查看</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body>
<div class="col-lg-12">
    <a href="javascript:void(0);" class=" btn btn-default col-md-offset-3" onclick="updateInputAttr();" style="margin-top: 20px;">修改基本信息</a>
    <form id="basicInfo" class="form-horizontal" style="margin-top: 20px;">
        <div class="form-group">
            <label for="nickname" class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-4">
                <input type="text" readonly="true" class=" form-control" id="nickname" name="nickname" value="${sessionScope.user.nickname}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-4">
                <input type="text"  readonly="true" class="form-control " id="name" name="name" value="${sessionScope.user.name}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-4">
                <input type="email"  readonly="true" class="form-control " id="email" name="email" value="${sessionScope.user.email}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">QQ</label>
            <div class="col-sm-4">
                <input type="text" readonly="true" class="form-control" id="qq" name="qq" value="${sessionScope.user.qq}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">微信</label>
            <div class="col-sm-4">
                <input type="text" readonly="true" class="form-control"  id= "wechat" name="wechat" value="${sessionScope.user.wechat}">
            </div>
        </div>

        <div  id="div"  style="display:none" class="col-md-offset-3">
            <a href="javascript:void(0);" class=" btn btn-primary" onclick="updateUserInfo();">确认</a>
            <a href="javascript:void(0);" readonly="true" class=" btn btn-default" style="margin-left: 60px;" onclick="clear();">取消</a>
        </div>
    </form>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/js/zhang/users.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.metadata.js"></script>
<script src="<%=path %>/public/js/zhang/updateBasicInfo.js"></script>

</body>
</html>

