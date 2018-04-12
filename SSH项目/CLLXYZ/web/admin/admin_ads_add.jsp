<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/10
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>广告添加</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/liu/admin_add_activity.css"/>
</head>
<body>

<div class="col-lg-12" style="margin-top: 30px;margin-bottom: 300px;">

    <form class="form-horizontal" id="addForm">

        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">广告标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox" id="title" name="ads.title"
                       data-options="required:true, novalidate:true"
                       placeholder="广告标题">
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">广告内容</label>
            <div class="col-sm-6">
                <input type="text" class="form-control  easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       id="content" name="ads.content" placeholder="广告内容">
            </div>
        </div>
        <div class="form-group">
            <label for="created_time" class="col-sm-2 control-label">创建时间</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-datebox  easyui-validatebox" style="width: 541px;"
                       data-options="required:true, novalidate:true" id="created_time" name="ads.created_time"
                       placeholder="创建时间">
            </div>
        </div>
        <div class="form-group">
            <label for="show_order" class="col-sm-2 control-label">显示位置</label>
            <div class="col-sm-6">
                <input type="text" class="form-control  easyui-validatebox" id="show_order" name="ads.show_order"
                       data-options="required:true, novalidate:true" placeholder="广告位置" onblur="checkLocation();"/>
                <span id="error_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="ad_url" class="col-sm-2 control-label">传递的URL</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox"
                       data-options="required:true, novalidate:true"
                       id="ad_url" name="ads.ad_url" placeholder="URL地址">
            </div>
        </div>

        <div class="form-group">
            <label for="logo" class="col-sm-2 control-label">广告图片</label>
            <div class="col-sm-6" style="height: 290px;">
                <input type="file" multiple class="form-control file-preview" id="logo" name="Image"
                       data-overwrite-initial="false" data-max-file-count="1" placeholder="广告图片"
                       style="height: 200px;width:auto;">
            </div>
        </div>

        <div class="form-group" style="margin-top:120px;margin-left: 230px; padding:10px">
            <div>
                <a href="javascript:void(0);" type="submit" class="btn btn-primary" onclick="submitFile()">确认</a>
                <a href="javascript:void(0);" class="btn btn-default" style="margin-left: 100px;" onclick="backPage()">取消</a>
            </div>
        </div>
    </form>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path%>/public/js/liu/ads.js"></script>
<script>
    $("#logo").fileinput({
        language: 'zh',
        uploadUrl: '/ads/addAdsImg', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif', 'mp4', 'txt'],   //文件格式
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
    function backPage() {
        window.location.href="admin_ads_add.jsp"
    }
</script>

</body>
</html>
