<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/15
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>平台活动</title>
    <link  href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%=path%>/public/plugins/lightbox2/dist/css/lightbox.css"  rel="stylesheet"/>
    <link  href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css" rel="stylesheet" />
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet"/>
<body>

<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        url:'<%=path %>/activity/pagerPlatformActivity',
        method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">活动id</th>
        <th data-options="field:'title'">活动标题</th>
        <th data-options="field:'start_time',align:'center',formatter:formatDate">开始时间</th>
        <th data-options="field:'end_time',align:'center',formatter:formatDate">结束时间</th>
        <th data-options="field:'address',align:'center'">地址</th>
        <th data-options="field:'content',align:'center'">活动内容</th>
        <th data-options="field:'buildings',align:'center',formatter:formatObject">楼盘</th>
        <th data-options="field:'agency',align:'center',formatter:formatObject">经销商</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">活动状态</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showActivityDetail('activity.',9);">显示活动详情</a>
    <a href="javascript:void(0);" class="easyui-linkbutton"  onclick="validActivity(1);">激活活动</a>
    <a href="javascript:void(0);" class="easyui-linkbutton"  onclick="validActivity(0);">冻结活动</a>
</div>

<div id="win" class="easyui-window" title="显示区" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px;">
        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="buildings_id"/>
            <input type="hidden" name="agency_id"/>
            <input type="hidden" name="status"/>

            <div class="form-group">
                <label for="title" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="title"
                           id="title"/>
                </div>
            </div>

            <div class="form-group">
                <label for="start_time" class="col-sm-2 control-label">开始时间</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-datebox form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="start_time"
                           id="start_time"/>
                </div>
            </div>
            <div class="form-group">
                <label for="end_time" class="col-sm-2 control-label">结束时间</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-datebox form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="end_time"
                           id="end_time"/>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="address"
                           id="address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-sm-2 control-label">内容</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="content"
                           id="content"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">图片</label>
                <div class="col-sm-6">
                    <a id="logo-a" href="<%=path%>"  data-lightbox="image-group">
                        <img  id="logo-b" class="img-responsive" src="<%=path%>" alt="img-1" style="width: 60px;height: auto;"/>
                    </a>
                </div>
            </div>

            <div class="form-group">
                <label for="activity_image" class="col-sm-2 control-label">添加图片</label>
                <div class="col-sm-6" style="height: 290px;">
                    <input  id="activity_image" type="file" multiple class="form-control file-preview" name="Image"
                            data-overwrite-initial="false" data-max-file-count="1" placeholder="活动图片" style="height: 200px;width:auto;">
                </div>
            </div>

            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="form-group">
                <a class="col-sm-offset-3  btn btn-primary btn-md"
                   onclick="updateActivities();">确认</a>
                <a href="javascript:;" onclick="closeWin('win')" class="col-sm-offset-1 btn btn-default btn-md">取消</a>
            </div>

        </form>
    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path%>/public/plugins/lightbox2/dist/js/lightbox.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path%>/public/js/liu/commonFormat.js"></script>

<script src="<%=path %>/public/js/liu/activity.js"></script>
<script>
    $("#activity_image").fileinput({
        language: 'zh',
        uploadUrl: '/activity/addActivityImg', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif','mp4','txt'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 409600,   //单个文件大小的最大值
        maxFilesNum: 1,
        //allowedFileTypes: ['image', 'video', 'flash'],
//        slugCallback: function (filename) {
//            return filename.replace('(', '_').replace(']', '_');  // 更改默认的名字
//        }
    });
</script>

<script>
    $(function () {
        setPagination("list");
    })
</script>
</body>
</html>
