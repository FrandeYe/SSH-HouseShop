<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/8
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有文章类别</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/icon.css"/>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        url:'<%=path %>/articleType/pagerArticleType',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">活动id</th>
        <th data-options="field:'name',align:'center'">类别名称</th>
        <th data-options="field:'des',align:'center'">类别描述</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">类别状态</th>
    </thead>
</table>
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('articleType.',12);">修改类型</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validArticleType(1);">激活类型</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validArticleType(0);">冻结类型</a>
</div>

<%--修改区域--%>
<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px;">
        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="status"/>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">类型</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           validType="CHS"
                           id="name"/>
                </div>
            </div>

            <div class="form-group">
                <label for="des" class="col-sm-2 control-label">类型描述</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox easyui-textbox"
                           data-options="required:true, novalidate:true" name="des" style="width: 348px;"
                           id="des"/>
                </div>
            </div>

            <div class="form-group">
                <a class="col-sm-offset-3  btn btn-primary btn-md"
                   onclick="updateType();">确认</a>
                <a href="javascript:;" onclick="closeWin('win')" class="col-sm-offset-1 btn btn-default btn-md">取消</a>
            </div>

        </form>
    </div>
</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path%>/public/js/liu/articleType.js"></script>
<script src="<%=path%>/public/js/liu/article.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</body>
</html>
