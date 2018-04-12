
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>员工信息</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<!--员工修改自己的信息：开始-->
<div class="col-sm-12">
<form class="form-horizontal" id="editEmpForm">
    <div class="form-group" id="editInfo">
        <a style="margin:2% 1% 1% 35%;"class="col-sm-offset-3  btn btn-primary btn-lg"
           onclick="showEmpEdit();">修改信息</a>
    </div>
    <div class="form-group">
        <div class="col-sm-6">
            <input type="hidden" readonly class=""
                   data-options="required:true, novalidate:true"
                   id="customer_id" name="employee.id" value="${sessionScope.employee.id}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">姓名</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="prompt:'Enter User Name.',required:true,novalidate:true,validType:'length[3,10]'"
                   id="name" name="employee.name" value="${sessionScope.employee.name}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox"
                   data-options="prompt:'Enter a valid email.',novalidate:true,required:true,validType:'email'"
                   onchange="verifyEmail();"
                   id="email" name="employee.email" value="${sessionScope.employee.email}"/>
            <span id="emailTip"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">性别</label>
        <div class="col-sm-6">
            <c:if test="${sessionScope.employee.gender=='M'}">
                <input type="radio" name="employee.gender" disabled="disabled" checked="checked" value="M"/>男
                <input type="radio" name="employee.gender" disabled="disabled" value="F"/>女
            </c:if>
            <c:if test="${sessionScope.employee.gender=='F'}">
                <input type="radio" name="employee.gender" disabled="disabled" value="M"/>男
                <input type="radio" name="employee.gender" disabled="disabled" checked="checked" value="F"/>女
            </c:if>
        </div>
    </div>
    <div class="form-group" id="phoneid">
        <label for="phone" class="col-sm-2 control-label">手机号</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox"
                   data-options="prompt:'Enter your phone number.',novalidate:true,required:true,validType:'length[8,11]'"
                   id="phone" name="employee.phone" value="${sessionScope.employee.phone}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="qq" class="col-sm-2 control-label">QQ号</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="novalidate:true,required:true,validType:'QQ'"
                   id="qq" name="employee.qq" value="${sessionScope.employee.qq}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="wechat"  class="col-sm-2 control-label">微信号</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="novalidate:true,required:true,validType:'length[6,11]'"
                   id="wechat" name="employee.wechat" value="${sessionScope.employee.wechat}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="exp" class="col-sm-2 control-label">工作经验</label>
            <div class="col-sm-6">
                <select id="exp" disabled name="employee.exp" class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                    <option value="1到3年">1到3年</option>
                    <option value="4到6年">4到6年</option>
                    <option value="7年以上">7年以上</option>
                </select>
            </div>
    </div>
    <div class="form-group" id="basic_salaryid">
        <label for="basic_salary" class="col-sm-2 control-label">基本工资</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="required:true, novalidate:true"
                   id="basic_salary" name="employee.basic_salary" value="${sessionScope.employee.basic_salary}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="des" class="col-sm-2 control-label">描述</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="novalidate:true,required:true,validType:'length[0,50]'"
                   id="des" name="employee.des" value="${sessionScope.employee.des}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="intro" class="col-sm-2 control-label">简介</label>
        <div class="col-sm-6">
            <textarea style="height:100px;width: 100%;" disabled id="intro" name="employee.intro">${sessionScope.employee.intro}
            </textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址</label>
        <div class="col-sm-6">
            <input type="text" readonly class="form-control easyui-validatebox  "
                   data-options="novalidate:true,required:true,validType:'length[1,50]'"
                   id="address" name="employee.address" value="${sessionScope.employee.address}"/>
        </div>
    </div>
    <div id="editbtn" style="display: none;margin-left: 5%;">
        <a style="margin-left:25%;" class="col-sm-offset-3  btn btn-primary btn-lg"
           onclick="updateEmpInfo();">确认</a>
        <a style="margin-left:10%" class="col-sm-offset-3  btn btn-warning btn-lg"
           onclick="window.location.reload();">取消</a>
    </div>
</form>
</div>
<!--员工修改自己的信息：结束-->
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--自定义js-->
<script src="<%=path%>/public/js/ye/employee-js/emp.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script type="text/javascript">
    $(function () {
        $("#exp").val("${sessionScope.employee.exp}");
    });
</script>
</html>
