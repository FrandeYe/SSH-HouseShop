
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>添加客户</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <!--自定义css-->
    <link rel="stylesheet" href="<%=path %>/public/css/ye/employee-css/emp_customer.css"/>
</head>
<body>
<div class="col-sm-12">
    <form class="form-horizontal" id="saveCusForm">
        <div class="form-group">
                <!--隐藏id-->
            <input type="hidden" name="customer.employee.id" value="${sessionScope.employee.id}"/>
        </div>
        <div class="form-group">
            <!--隐藏id-->
            <input type="hidden" name="customer.agency.id" value="${sessionScope.employee.agency.id}"/>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">客户姓名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       validType="ZE"
                       id="name" name="customer.name" placeholder="请输入姓名:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">身份证号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       validType="idCode"
                       id="identity_id" name="customer.identity_id" placeholder="请输入身份证号:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">出生日期</label>
            <div class="col-sm-6">
                <input type="text" class="easyui-datebox form-control easyui-validatebox  "
                       data-options="required:true, novalidate:true"
                       id="birthday" name="customer.birthday" placeholder="请输入出生日期:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  "
                       data-options="required:true, novalidate:true"
                       validType="email"
                       id="email" name="customer.email" placeholder="请输入邮箱:"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-6">
                <label class="radio-inline">
                    <input type="radio" id="gender1" name="customer.gender" value="F" checked="checked"/>女
                </label>
                <label class="radio-inline">
                    <input type="radio" id="gender" name="customer.gender" value="M"/>男
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  "
                       data-options="required:true, novalidate:true"
                       validType="length[2,30]"
                       id="address" name="customer.address" placeholder="请输入地址:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="customer_type" class="col-sm-2 control-label">客户类型</label>
            <div class="col-sm-6">
                <select id="customer_type" name="customer.customer_type" class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                    <option value="预约客户" selected="selected">预约客户</option>
                    <option value="意向客户">意向客户</option>
                    <option value="预定客户">预定客户</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="together" class="col-sm-2 control-label">共同购房人</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  "
                       data-options="required:true, novalidate:true"
                       validType="group"
                       id="together" name="customer.together" placeholder="请输入共同购房人："/>
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       validType="mobile"
                       id="phone" name="customer.phone" placeholder="请输入手机号:"/>
            </div>
        </div>

        <div class="form-group" style="margin-left: -5%;">
            <a class="col-sm-offset-3  btn btn-primary btn-lg" onclick="savaCus();">添加</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default btn-lg">重置</button>
            <a style="margin-left:10%;" class="btn btn-warning btn-lg"
               onclick="window.location.href='emp_customers.jsp'">取消</a>
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
<script src="<%=path%>/public/js/ye/employee-js/emp_customer.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
</html>
