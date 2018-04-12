<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/10
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>广告</title>
    <link  href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%=path%>/public/plugins/lightbox2/dist/css/lightbox.css"  rel="stylesheet"/>
    <link  href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css" rel="stylesheet" />
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet"/>
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
        url:'<%=path %>/ads/pagerAds',
        method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">广告id</th>
        <th data-options="field:'title'">广告标题</th>
        <th data-options="field:'content',align:'center'">广告内容</th>
        <th data-options="field:'show_order',align:'center'">广告位置</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">广告状态</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('ads.',4);">修改广告</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validAds(1);">激活广告</a>
    <a href="javascript:void(0);" class="easyui-linkbutton"  onclick="validAds(0);">冻结广告</a>
</div>

<%--修改区域--%>
<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px;">
        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="logo" id="hiddenLogo">
            <input type="hidden" name="status"/>
            <input type="hidden" name="show_status"/>

            <div class="form-group">
                <label for="title" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="title"
                           id="title"/>
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
                <label for="show_order" class="col-sm-2 control-label">顺序</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="show_order"
                           id="show_order"  onblur="checkLocation();"/>
                    <span id="error_span"></span>
                </div>
            </div>

            <div class="form-group">
                <label for="created_time" class="col-sm-2 control-label">时间</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-datebox form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="created_time" style="width: 354px;"
                           id="created_time"/>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">图片</label>
                <div class="col-sm-6">
                    <a  id = "logo-a" href="" data-lightbox="image-group">
                        <img id="logo-b"  class="img-responsive" src="" alt="img-1" style="width: 60px;height: auto;"/>
                    </a>
                </div>
            </div>

            <div class="form-group">
                <label for="ads_image" class="col-sm-2 control-label">添加图片</label>
                <div class="col-sm-6" style="height: 290px;">
                    <input id="ads_image" type="file" multiple class="form-control file-preview" name="Image"
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
                   onclick="updateAds();">确认</a>
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

<script src="<%=path %>/public/js/liu/ads.js"></script>
<script>
    $("#ads_image").fileinput({
        language: 'zh',
        uploadUrl: '/ads/addAdsImg', // you must set a valid URL here else you will get an error
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
