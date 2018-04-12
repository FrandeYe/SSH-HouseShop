<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2017/8/31
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="<%=path%>/public/plugins/lightbox2/dist/css/lightbox.css" rel="stylesheet"/>
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
        url:'<%=path %>/user/pagerUser',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">用户id</th>
        <th data-options="field:'headicon',width:60,height:60,align:'center',formatter:formatImage">用户头像</th>
        <th data-options="field:'nickname',align:'center'">用户昵称</th>
        <th data-options="field:'phone',align:'right'">用户手机</th>
        <th data-options="field:'email'">用户邮箱</th>
        <th data-options="field:'name',align:'center'">用户姓名</th>
        <th data-options="field:'gender',align:'center',formatter:formatGander">用户性别</th>
        <th data-options="field:'birthday',align:'center',formatter:formatDate">用户生日</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">是否可用</th>
    </tr>
    </thead>

    <div id="tb">
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('user.',5);">详细信息</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validUser(0);">冻结用户</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validUser(1);">激活用户</a>
    </div>

</table>
/显示详细信息
<div id="win" class="easyui-window" title="详细信息" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px; ">
        <form class="form-horizontal" id="form">

            <div class="form-group">
                <label class="col-sm-2 control-label">用户头像</label>
                <div class="col-sm-6">
                    <a id="logo-a" href="" data-lightbox="image-group">
                        <img id="logo-b" class="img-responsive" src="" alt="img-1" style="width: 60px;height: auto;"/>
                    </a>
                </div>
            </div>

            <div class="form-group">
                <label for="nickname" class="col-sm-2 control-label">用户昵称</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="nickname"
                           id="nickname"/>
                </div>
            </div>

            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">用户手机</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="phone"
                           id="phone"/>
                </div>
            </div>
            <div class="form-group">
                <label for="qq" class="col-sm-2 control-label">用户QQ</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="qq"
                           id="qq"/>
                </div>
            </div>
            <div class="form-group">
                <label for="weChat" class="col-sm-2 control-label">weChat</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="wechat"
                           id="weChat"/>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">用户邮箱</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="email"
                           id="email"/>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">用户姓名</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>

            <%--<div class="form-group">--%>
            <%--<label for="gander" class="col-sm-2 control-label">用户性别</label>--%>
            <%--<div class="col-sm-6">--%>
            <%--<input type="text" readonly class="form-control easyui-validatebox"--%>
            <%--data-options="required:true, novalidate:true" name="gander"--%>
            <%--id="gander"/>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class="form-group">
                <label for="birthday" class="col-sm-2 control-label">用户生日</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="birthday"
                           id="birthday"/>
                </div>
            </div>

        </form>
    </div>
</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path%>/public/plugins/lightbox2/dist/js/lightbox.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path%>/public/js/liu/commonFormat.js"></script>
<script src="<%=path %>/public/js/liu/user.js"></script>
<script>
    $(function () {
        setPagination("list");
    })
</script>
</body>
</html>
