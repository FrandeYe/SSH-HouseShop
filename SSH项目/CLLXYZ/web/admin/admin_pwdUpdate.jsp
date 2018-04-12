<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/11
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/icon.css"/>
</head>
<body class="container">
<div class="col-lg-10" style="margin-top: 30px;margin-bottom: 300px;width: auto;">
        <span id="fail_span" style="margin-left: 140px;font-weight: bold;color: red"></span>
        <form class="form-horizontal" id="form" >

            <div class="form-group">
                <label for="pwd" class="col-sm-2 control-label">原密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入原密码"
                           onblur="checkPasswords();"/>
                    <span id="error_span"></span>
                </div>
            </div>

            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">电话号码</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号码"/>
                </div>
            </div>

            <div class="form-group">
                <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="新密码"/>
                </div>
            </div>

            <div class="form-group">
                <label for="commitPwd" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="commitPwd" name="commitPwd" placeholder="确认密码"/>
                </div>
            </div>

            <div class="form-group" style="margin-left: 230px; padding:10px">
                <div>
                    <a href="javascript:void(0);" type="submit" class="btn btn-primary" onclick="verifies();">确认</a>
                    <a href="javascript:void(0);" class="btn btn-default" style="margin-left: 100px;"
                       onclick="Canceled();">取消</a>
                </div>
            </div>

        </form>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path%>/public/plugins/jquery-validation/dist/jquery.validate.js"></script>
<script src="<%=path%>/public/js/liu/updatePwd.js"></script>
<script src="<%=path%>/public/plugins/jquery-validation/dist/localization/messages_zh.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
</body>
</html>
