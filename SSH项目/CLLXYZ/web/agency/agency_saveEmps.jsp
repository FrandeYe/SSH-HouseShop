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
    <title>经销商增加员工</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <input type="hidden" id="id_input" name="employee.agency.id" value="${sessionScope.agency.id}" />
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'ZE'"
                           id="name" name="employee.name" placeholder="请输入员工名称:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="input_phone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'number'"
                       id="input_phone" name="employee.phone" onblur="verifyPhone('<%=path%>/employee/checkPhone');" placeholder="请输入手机号:"/>
                <span id="phone_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="input_email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'email'"
                       id="input_email" name="employee.email" onblur="verifyEmail('<%=path%>/employee/checkEmail');" placeholder="请输入邮箱:"/>
                <span id="email_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="basic_salary" class="col-sm-2 control-label">基本工资</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'number'"
                       id="basic_salary" name="employee.basic_salary" placeholder="请输入基本工资:"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-6">
                <label class="radio-inline">
                    <input type="radio" id="gender1" name="employee.gender" value="F" checked  />女
                </label>
                <label class="radio-inline">
                    <input type="radio" id="gender" name="employee.gender" value="M" placeholder="请输入性别:"/>男
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">员工楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="employee.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="exp" class="col-sm-2 control-label">工作经验</label>
            <div class="col-sm-6">
                <select id="exp" name="employee.exp" class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                    <option id="num1">1~3年</option>
                    <option id="num2">4~6年</option>
                    <option id="num3">7年以上</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">个人说明</label>
            <div class="col-sm-6">
                   <textarea cols="60" rows="10" data-options="required:true, novalidate:true"
                             class="form-control easyui-validatebox" placeholder="请输入个人说明:"
                             id="des" name="employee.des"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">个人简介</label>
            <div class="col-sm-6">
               <textarea cols="60" rows="10" data-options="required:true, novalidate:true"
                         class="form-control easyui-validatebox  easyui-textberbox" placeholder="请输入个人简介:"
                         id="intro" name="employee.intro"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'ZE'"
                           id="address" name="employee.address" placeholder="请输入地址:"/>
            </div>
        </div>
        <div class="form-group">
            <label for="wechat" class="col-sm-2 control-label">微信号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       id="wechat" name="employee.wechat" placeholder="请输入微信号:"/>
            </div>
        </div>

        <div class="form-group">
            <label for="qq" class="col-sm-2 control-label">QQ号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'QQ'"
                       id="qq" name="employee.qq" placeholder="请输入qq号:"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="addEmployee();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>
    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_emps.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
