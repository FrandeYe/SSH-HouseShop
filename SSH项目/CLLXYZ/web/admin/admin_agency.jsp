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
    <title>经销商</title>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="<%=path%>/public/plugins/lightbox2/dist/css/lightbox.css" rel="stylesheet"/>
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
        url:'<%=path %>/agency/pagerAgency',
        method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">经销商id</th>
        <th data-options="field:'logo',align:'center',formatter:formatLogo">图标</th>
        <th data-options="field:'name',align:'right'">名称</th>
        <th data-options="field:'email',align:'right'">邮箱</th>
        <th data-options="field:'leader',align:'right'">领导</th>
        <th data-options="field:'phone',align:'center'">手机号</th>
        <th data-options="field:'tel',align:'center'">固定电话</th>
        <th data-options="field:'address',align:'center'">地址</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">注册日期</th>
        <th data-options="field:'checked_status',align:'center',formatter:formatCheckStatus">审查是否通过</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">是否可用</th>

    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showAgency('agency.',8);">显示经销商</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validAgency(1);">激活经销商</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validAgency(0);">冻结经销商</a>
</div>

<div id="win" class="easyui-window" title="详情窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px;">
        <form class="form-horizontal" id="form">
            <input type="hidden" name="id">
            <input type="hidden" name="checked_status">
            <input type="hidden" name="status">
            <input type="hidden" name="pwd">

            <div class="form-group">
                <label class="col-sm-2 control-label">图标</label>
                <div class="col-sm-6">
                    <a id="logo-a" href="" data-lightbox="image-group">
                        <img id="logo-b" src="" alt="img-1" style="width: 60px;height: auto;"/>
                    </a>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="email"
                           id="email"/>
                </div>
            </div>
            <div class="form-group">
                <label for="leader" class="col-sm-2 control-label">领导者</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="leader"
                           id="leader"/>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="phone"
                           id="phone"/>
                </div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">固定电话</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="tel"
                           id="tel"/>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="address"
                           id="address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">介绍</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="intro"
                           id="intro"/>
                </div>
            </div>
            <div class="form-group">
                <label for="created_time" class="col-sm-2 control-label">创建时间</label>
                <div class="col-sm-6">
                    <input type="text" readonly class=" form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="created_time"
                           id="created_time"/>
                </div>
            </div>

        </form>
    </div>
</div>
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path%>/public/plugins/lightbox2/dist/js/lightbox.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path %>/public/js/lai/load_form_data.js"></script>
<script src="<%=path %>/public/js/liu/agency.js"></script>
<script src="<%=path%>/public/js/liu/commonFormat.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</html>
