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
    <title>查看单个员工详情</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="employee.name"
                       id="name" value=${requestScope.employee.name} />
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="employee.email"
                       id="email" value="${requestScope.employee.email}" />
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="employee.password"
                       id="pwd" value ="${requestScope.employee.pwd}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-6">
               <label class="radio-inline">
                   <c:if test="${requestScope.employee.gender == 'F'}">
                       <input type="radio" name="employee.gender" checked />女
                   </c:if>
                   <c:if test="${requestScope.employee.gender == 'M'}">
                       <input type="radio" name="employee.gender"  />女
                   </c:if>
               </label>

               <label class="radio-inline">
                   <c:if test="${requestScope.employee.gender == 'M'}">
                       <input type="radio" name="employee.gender" checked />男
                   </c:if>
                   <c:if test="${requestScope.employee.gender == 'F'}">
                       <input type="radio" name="employee.gender"  />男
                   </c:if>
               </label>
            </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">员工负责的楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="employee.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="exp" class="col-sm-2 control-label">工作经验</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="exp" name="employee.exp" value ="${requestScope.employee.exp}" />
            </div>
        </div>
        <div class="form-group">
            <label for="des" class="col-sm-2 control-label">个人说明</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="des" name="employee.des" value ="${requestScope.employee.des}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="des" class="col-sm-2 control-label">个人简介</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="intro" name="employee.intro" value ="${requestScope.employee.intro}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="address" name="employee.address" value ="${requestScope.employee.address}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="wechat" class="col-sm-2 control-label">微信号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="wechat" name="employee.wechat" value ="${requestScope.employee.wechat}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="phone" name="employee.phone" value ="${requestScope.employee.phone}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="qq" class="col-sm-2 control-label">QQ号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="qq" name="employee.qq" value ="${requestScope.employee.qq}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="basic_salary" class="col-sm-2 control-label">基本工资</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="basic_salary" name="employee.basic_salary" value ="${requestScope.employee.basic_salary}"/>
            </div>
        </div>
        <div class="form-group ">
            <label class="col-sm-2 control-label ">创建时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimeberbox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="created_time" name="building.created_time" value ="${requestScope.employee.created_time}"/>
            </div>
        </div>
        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="updateEmployee();">确认</a>
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

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>