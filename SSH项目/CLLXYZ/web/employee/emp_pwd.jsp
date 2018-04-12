
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-sm-12">
    <form class="form-horizontal" id="pwdEmpForm">
        <div class="form-group">
            <div class="col-sm-6">
                <input type="hidden" class="form-control" name="employee.id" value="${employee.id}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-6">
                <input type="password" id="password" class="form-control easyui-validatebox"
                       data-options="novalidate:true,required:true"
                       validType=" pwdVal" onchange="checkOldPwd();"
                       name="employee.pwd" value="" placeholder="请输入原密码"/>
                <span id="pwdTip"></span>
            </div>
        </div>

        <div class="form-group">
            <label for="newPwd" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-6">
                <input type="password" id="newPwd" class="form-control easyui-validatebox"
                       data-options="novalidate:true,required:true"
                       validType="pwdVal"
                       name="newPwd" placeholder="请输入新密码"/>
            </div>
        </div>
        <div class="form-group">
            <label for="conPwd" class="col-sm-2 control-label">确认新密码</label>
            <div class="col-sm-6">
                <input type="password" id="conPwd" class="form-control easyui-validatebox"
                       data-options="novalidate:true,required:true"
                       validType="equalTo['#newPwd']"
                       name="conPwd"  placeholder="请输入新密码"/>
            </div>
        </div>
        <div class="form-group" style="margin-left:10%;">
            <a style="margin:1% 1% 1% 23%;" class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="updateEmpPwd();">确认</a>
            <a style="margin:1% 1% 1% 5%;" class="btn btn-warning btn-lg" onclick="top.location.reload();">取消</a>
        </div>
    </form>
</div>
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义js-->
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp.js"></script>
</html>
