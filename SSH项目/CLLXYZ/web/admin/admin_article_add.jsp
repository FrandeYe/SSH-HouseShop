<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/7
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>文章添加</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
</head>

<body>
<div class="col-lg-12">
    <form class="form-horizontal" id="addForm" style="margin-top: 30px;">
        <div class="form-group">
            <label class="col-sm-2 control-label">文章标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control   easyui-textbox easyui-validatebox"
                       validType="CHS" style="width: 541px;"
                       data-options="required:true, novalidate:true" name="article.title"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">文章摘要</label>
            <div class="col-sm-6">
                <input type="text" class="form-control  easyui-textbox  easyui-validatebox"
                       data-options="required:true, novalidate:true"  validType="CHS2" style="width: 541px;"
                       name="article.abstracts"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">文章内容</label>
            <div class="col-sm-6">
                <textarea cols="60" rows="10" class="form-control  easyui-validatebox "
                          data-options="required:true, novalidate:true"
                          id="des" name="article.content"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">文章类型</label>
            <div class="col-sm-6">
                <select class="form-control" id="select" name="article.articleType.id">
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="article_image" class="col-sm-2 control-label">文章图片</label>
            <div class="col-sm-6" style="height: 290px;">
                <input id="article_image" type="file" multiple class="form-control file-preview" name="Image"
                       data-overwrite-initial="false" data-max-file-count="1" placeholder="活动图片"
                       style="height: 200px;width:auto;">
            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary"
               onclick="addArticle();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default" onclick="backPage();">取消</button>
        </div>
    </form>
</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script>
    $("#article_image").fileinput({
        language: 'zh',
        uploadUrl: '/article/articleImg', // you must set a valid URL here else you will get an error
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
<script src="<%=path%>/public/js/liu/article.js"></script>
<script>
    $(function () {
        $.post(contextPath + "/articleType/foundTypename",
            function (data) {
                for (var i = 0; i < data.rows.length; i++) {
                    $("#select").append("<option value=" + data.rows[i].id + ">" + data.rows[i].name + "</option>");
                }
            }, "json"
        )
    });
</script>
<script>
    function backPage() {
        window.location.href="admin_article_add.jsp"
    }
</script>
</body>
</html>
