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
    <title>添加活动</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/liu/admin_add_activity.css"/>
</head>
<body>
<div class="col-lg-12" style="margin-top: 30px;margin-bottom: 300px;">

    <form class="form-horizontal" id="saveForm">
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">活动标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true,novalidate:true"
                       validType="CHS2"
                       id="title" name="activity.title" placeholder="请输入活动名称">
            </div>
        </div>
        <div class="form-group">
            <label for="start_time" class="col-sm-2 control-label">开始时间</label>
            <div class="col-sm-6">
                <input type="text" class="easyui-datebox easyui-validatebox" style="width: 541px;"
                       data-options="required:true,novalidate:true" id="start_time" name="activity.start_time"
                       placeholder="开始时间">
            </div>
        </div>
        <div class="form-group">
            <label for="end_time" class="col-sm-2 control-label ">结束时间</label>
            <div class="col-sm-6">
                <input type="text" class="easyui-datebox easyui-validatebox "  style="width: 541px;"
                       data-options="required:true, novalidate:true" id="end_time" name="activity.end_time"
                       placeholder="结束时间">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">活动地点</label>
            <div class="col-sm-6">
                <input type="text" class="form-control  easyui-validatebox" id="address" data-options="required:true, novalidate:true"
                       name="activity.address" placeholder="活动地点">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">活动内容</label>
            <div class="col-sm-6">
                <input type="text" class="form-control  easyui-validatebox" id="content" data-options="required:true, novalidate:true"
                       name="activity.content" placeholder="活动内容">
            </div>
        </div>

        <div class="form-group">
            <label for="activity_image" class="col-sm-2 control-label">添加图片</label>
            <div class="col-sm-6" style="height: 290px;">
                <input  type="file" multiple class="form-control file-preview" id="activity_image"
                       name="Image"
                       data-overwrite-initial="false" data-max-file-count="1" placeholder="活动图片"
                       style="height: 200px;width:auto;">
            </div>
        </div>

        <div class="form-group" style="margin-top:120px;margin-left: 230px; padding:10px">
            <div>
                <a href="javascript:void(0);" type="submit" class="btn btn-primary" onclick="submitFile()">确认</a>
                <a href="javascript:void(0);" class="btn btn-default" style="margin-left: 100px;" onclick="backPage();" >取消</a>
            </div>
        </div>
    </form>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<%--<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>--%>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path%>/public/js/liu/activity_add.js"></script>
<script>
    $("#activity_image").fileinput({
        language: 'zh',
        uploadUrl: '/activity/addActivityImg', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif', 'mp4', 'txt'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 409600,   //单个文件大小的最大值
        maxFilesNum: 1, //
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');  // 更改默认的名字
        }
    });
</script>
<script>
    function backPage() {
        window.location.href="admin_activity_add.jsp"
    }
</script>
</body>
</html>
