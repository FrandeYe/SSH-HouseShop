
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>修改头像</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/liu/admin_add_activity.css"/>
</head>
<body>
<div class="col-sm-12">
        <div class="form-group">
            <div class="col-sm-6" style="height: 300px;width: 340px">
                <input class="file-loading" type="file" multiple class="form-control file-preview" id="headIcon" name="logo"
                       data-overwrite-initial="false" data-max-file-count="1" placeholder="活动图片" style="height: 200px;width:auto;">
            </div>
        </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<%--<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>--%>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path%>/public/js/liu/activity_add.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp.js"></script>
<script>
    $("#headIcon").fileinput({
        language: 'zh',
        uploadUrl: '/employee/uploadHeadIcon',
        allowedFileExtensions: ['jpg', 'png', 'gif','mp4','txt'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 409600,   //单个文件大小的最大值
        maxFilesNum: 1,
    }).on("fileuploaded", function(event, data) {
        if (data.response.controllerResult.result=="success"){
            top.location.reload();
        }else {
            alert(data.response.controllerResult.message);
        }

    });
</script>
</body>
</html>
