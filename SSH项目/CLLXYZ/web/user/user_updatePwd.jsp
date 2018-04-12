<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>密码的修改</title>
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
    <span id="fail_span" style="margin-left: 160px;font-weight: bold;color: red"></span>
    <form id="updateForm" class="form-horizontal" style="margin-top: 30px;">

        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入原密码" onblur="checkPwd();"/>
                <span id="error_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="newPassword" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码" />
            </div>
        </div>

        <div class="form-group">
            <label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请输入确认密码"/>
            </div>
        </div>

        <div style="margin-left: 230px; padding:10px">
            <div>
                <a href="javascript:void(0);" type="submit" class="btn btn-primary" onclick="verify();">确认</a>
                <a  href="javascript:void(0);" class="btn btn-default" style="margin-left: 100px;" onclick="Cancel();">重置</a>
            </div>
        </div>
    </form>
</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.metadata.js"></script>
<script src="<%=path %>/public/js/zhang/updatePwd.js"></script>
</body>
</html>
