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
    <title>经销商修改自己密码</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="pwdAgencyFrom" >
        <input type="hidden" name="agency.email", value="${sessionScope.agency.email}"/>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">原密码</label>
            <div class="col-sm-6">
                <input type="password" id="password" class="form-control easyui-validatebox"
                data-options="novalidate:true,required:true"
                validType="pwdVal" onchange="OldPwd();"
                name="agency.pwd" value="" placeholder="请输入原密码"/>
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
                data-options="novalidate:true,required:true" validType="equalTo['#newPwd']"
                name="conPwd"  placeholder="请输入新密码"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary" onclick="updateAgencyPwd();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>
    </form>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--的js-->
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path%>/public/js/xie/agency_pwd.js"></script>

</body>
</html>
