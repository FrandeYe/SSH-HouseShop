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
    <title>经销商单个查看并修改客户</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/css/xie/demo.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/css/xie/easyui.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/css/xie/icon.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/css/chen/main.css"/>

</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">客户名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="name" name="customer.name" value ="${requestScope.customer.name}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-6">
                <label class="radio-inline">
                    <input type="radio" id="gender1" name="customer.gender" value="F"checked />女
                </label>
                <label class="radio-inline">
                    <input type="radio" id="gender" name="customer.gender" value="M"/>男
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="birthday" class="col-sm-2 control-label">生日</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-datebox"
                       data-options="required:true, novalidate:true"
                       id="birthday" name="customer.birthday"value ="${requestScope.customer.birthday}"/>
            </div>
        </div>
        <div class="form-group ">
            <label for="identity" class="col-sm-2 control-label ">身份证号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="identity" name="customer.identity_id" value ="${requestScope.customer.identity_id}"/>
            </div>
        </div>

        <div class="form-group ">
            <label for="email" class="col-sm-2 control-label ">邮箱</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="email" name="customer.email" value ="${requestScope.customer.email}"/>
            </div>
        </div>
        <div class="form-group ">
            <label for="phone" class="col-sm-2 control-label ">手机号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="phone" name="customer.phone" value ="${requestScope.customer.phone}"/>
            </div>
        </div>

        <div class="form-group ">
            <label for="address" class="col-sm-2 control-label ">联系地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="address" name="customer.address" value ="${requestScope.customer.address}"/>
            </div>
        </div>
        <div class="form-group ">
            <label for="customer.type" class="col-sm-2 control-label ">客户类型</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox easyui-textbox"
                       data-options="required:true, novalidate:true"
                       id="customer.type" name="customer.customer_type" value ="${requestScope.customer.customer_type}"/>
            </div>
        </div>

        <a style="position:absolute;top:380px;left:240px;" class="btn btn-primary" onclick="updateCustomer();">确认</a>
        <button type="reset" style="position:absolute;top:380px;left:440px;" class="btn btn-default">取消</button>
    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/chen/customer.js"></script>

</body>
</html>
