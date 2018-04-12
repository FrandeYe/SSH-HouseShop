<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/27
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有员工</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        url:'<%=path %>/employee/pagerEmployeeAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">员工名称</th>
        <th data-options="field:'name',align:'center'">名称</th>
        <th data-options="field:'email',align:'center'">邮箱</th>
        <th data-options="field:'phone',align:'center'">手机号</th>
        <th data-options="field:'buildings',align:'center', formatter:formatName">所属楼盘</th>
        <th data-options="field:'gender',align:'center',formatter:formatGender">性别</th>
        <th data-options="field:'exp',align:'center'">工作经验</th>
        <th data-options="field:'address',align:'center'">地址</th>
        <th data-options="field:'basic_salary',align:'center'">基本工资</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validEmployee(1);">激活员工</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validEmployee(0);">冻结员工</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWinBefore();">修改员工信息</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="alterPwd();">修改密码</a>
</div>

<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">

        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="status"/>
            <input type="hidden" name="headicon"/>
            <input type="hidden" name="pwd"/>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="input_email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="input_email" name="email" onchange="verifyEmail('<%=path%>/employee/checkEmail');" placeholder="请输入邮箱:"/>
                    <span id="email_span"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="input_phone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                           data-options="required:true, novalidate:true"
                           id="input_phone" name="phone" onchange="verifyPhone('<%=path%>/employee/checkPhone');" placeholder="请输入手机号:"/>
                    <span id="phone_span"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="sex1" value="M" checked>男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="sex2" value="F">女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="buildings" class="col-sm-2 control-label">员工负责的楼盘</label>
                <div class="col-sm-6">
                    <select id="buildings" name="buildings.id"
                            class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="exp" class="col-sm-2 control-label">工作经验</label>
                <div class="col-sm-6">
                    <select id="exp" name="exp" class="form-control">
                        <option id="num1">1~3年</option>
                        <option id="num2">4~6年</option>
                        <option id="num3">7年以上</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="des" class="col-sm-2 control-label">个人说明</label>
                <div class="col-sm-6">
                    <textarea name="employee.des" id="des" cols="30" rows="10" class="form-control easyui-validatebox"
                        data-options="request:true,novalidate:true"
                    ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">个人简介</label>
                <div class="col-sm-6">
                    <textarea name="employee.intro" id="intro" cols="30" rows="10" class="form-control easyui-validatebox"
                        data-options="request:true,novalidate:true"
                    ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="address" name="address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="wechat" class="col-sm-2 control-label">微信号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="wechat" name="wechat"/>
                </div>
            </div>
            <div class="form-group">
                <label for="qq" class="col-sm-2 control-label">QQ号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="qq" name="qq"/>
                </div>
            </div>
            <div class="form-group">
                <label for="basic_salary" class="col-sm-2 control-label">基本工资</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="basic_salary" name="basic_salary"/>
                </div>
            </div>
            <div class="form-group">
                <a class="col-sm-offset-3  btn btn-primary"
                   onclick="updateEmployee();">确认</a>
                <a onclick="closeWin('win')" class="col-sm-offset-1 btn btn-default">取消</a>
            </div>
        </form>

    </div>
</div>

<div id="pwdWin" class="easyui-window" title="修改密码" style="width:600px;height:150px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">

        <form class="form-horizontal" id="pwdForm">
            <input type="hidden" id="employeeId" name="employee.id">
            <div class="form-group">
                <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-6">
                    <input type="password" id="newPwd" class="form-control easyui-validatebox"
                           data-options="novalidate:true,required:true"
                           validType="pwdVal"
                           name="employee.pwd" placeholder="请输入新密码"/>此密码默认为员工的邮箱
                </div>
            </div>
            <div class="form-group">
                <a href="javascript:void(0)" class="col-sm-offset-3  btn btn-primary"
                   onclick="updatePwd();">确认</a>
                <a href="javascript:void(0)" onclick="closeWin('pwdWin')" class="col-sm-offset-1 btn btn-default">取消</a>
            </div>
        </form>

    </div>
</div>


<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/lai/load_form_data.js"></script><%--加载form表单数据的js--%>
<!--自己的Js-->
<script src="<%=path %>/public/js/xie/agency_emps.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script>
    $(function () {
        setPagination("list");
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
