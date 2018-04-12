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
    <title>经销商增加活动</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link  rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>

</head>
<body>
<div class="col-lg-12">

    <form class="form-horizontal" id="addForm">
        <input type="hidden" name="activity.agency.id" value="${sessionScope.agency.id}" />

        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'ZE'"
                id="title" name="activity.title" placeholder="请输入标题:"/>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true, validType:'ZE'"
                       id="address" name="activity.address" placeholder="请输入地址:"/>
            </div>
        </div>

        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-6">
                <textarea cols="60" rows="10" data-options="required:true, novalidate:true, validType:'ZE'"
                          class="form-control easyui-validatebox" placeholder="请输入内容:"
                          id="content" name="activity.content"></textarea>
        </div>
        </div>
        <div class="form-group">
            <label for="buildings" class="col-sm-2 control-label">活动楼盘</label>
            <div class="col-sm-6">
                <select id="buildings" name="activity.buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                </select>
            </div>
        </div>
        <div class="form-group ">
            <label for="start_time" class="col-sm-2 control-label ">开始时间</label>
            <div class="col-sm-4">
                    <input class="easyui-datetimebox form-control easyui-validatebox "
                           data-options="required:true, novalidate:true"
                           id="start_time" name="activity.start_time"/>
            </div>
        </div>

        <div class="form-group ">
            <label for="end_time" class="col-sm-2 control-label ">结束时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       id="end_time" name="activity.end_time"/>
            </div>
        </div>

        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="addActivity();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>

    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_activity.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
    })
</script>
</body>
</html>
