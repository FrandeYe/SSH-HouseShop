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
    <title>楼盘图片</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">
    <div class="form-inline">
        <label for="buildings" class="control-label">选择楼盘</label>
        <select onchange="getImagesData();" id="buildings" class="form-control"></select>
        <a href="javascript:void(0)" class="btn btn-primary" onclick="getImagesData();">确认</a>
    </div>
</div>

<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,
        collapsible:true,
        rownumbers:true,
        pagination:true,
        pageSize:20,
        toolbar:'#tb',
        method:'get'">
    <thead>

    <tr>
        <th data-options="field:'id',checkbox:true,align:'center'"></th>
        <th data-options="field:'img_path', width:100,align:'center', formatter:formatImgPath">图片</th>
        <th data-options="field:'img_des',align:'center'">描述</th>
        <th data-options="field:'created_time',align:'center', formatter:formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="openRemoveDlgBefore();">删除图片</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="openSaveWinBefore();">增加图片</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="openUpdateWinBefore();">修改图片</a>
</div>

<div id="saveWin" class="easyui-window" title="增加楼盘图片" style="width:800px;height:500px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">
        <form class="form-horizontal" id="saveForm">
            <input type="hidden" id="buildingsId" name="buildingsImg.buildings.id">
            <input type="hidden" value="default_buildings_image.jpg" id="imgLogo" name="buildingsImg.img_path">
            <div class="form-group">
                <label for="describe" class="col-sm-2 control-label">图片描述</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="buildingsImg.img_des"
                           id="describe"/>
                </div>
            </div>
            <div class="form-group">
                <label for="buildingsImg" class="col-sm-2 control-label">添加图片</label>
                <div class="col-sm-6">
                    <input type="file" onchange="setBuildingsImgFileName();" multiple class="form-control file-preview" id="buildingsImg" name="buildingsImage"
                           data-overwrite-initial="false" data-max-file-count="1" >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-primary" onclick="saveImg()">保存</a>
                </div>
                <div class=" col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-default" onclick="closeWin('saveWin')" >取消</a>
                </div>
            </div>
        </form>
    </div>
</div>

<div id="dlg" class="easyui-dialog" title="删除" closed="true" style="width:280px;height:150px;padding:10px"
     data-options="buttons: '#dlg-buttons'">
    是否确认删除该图片。
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="removeImg();">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDig('dlg')">取消</a>
</div>

<div id="updateWin" class="easyui-window" title="修改楼盘图片" style="width:800px;height:500px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">
        <form class="form-horizontal" id="updateForm">
            <input type="hidden" id="buildingsImgId" name="buildingsImg.id"/>
            <input type="hidden" value="default_buildings_image.jpg" id="updateImgLogo" name="buildingsImg.img_path">
            <div class="form-group">
                <label for="describe1" class="col-sm-2 control-label">图片描述</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="buildingsImg.img_des"
                           id="describe1"/>
                </div>
            </div>
            <div class="form-group">
                <label for="beginImg" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">原始图片</label>
                <div class="col-sm-6">
                    <img class="img-responsive" id="beginImg" src="<%=path %>/public/images/upload/default_buildings_image.jpg" />
                </div>
            </div>
            <div class="form-group">
                <label for="buildingsImgUpdate" class="col-sm-2 control-label">修改图片</label>
                <div class="col-sm-6">
                    <input type="file" onchange="setBuildingsImgFileNameUpdate();" multiple class="form-control file-preview" id="buildingsImgUpdate" name="buildingsImage"
                           data-overwrite-initial="false" data-max-file-count="1" >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-primary" onclick="updateImg();">保存</a>
                </div>
                <div class=" col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-default" onclick="closeWin('updateWin')" >取消</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>

<script src="<%=path %>/public/js/xie/agency.js"></script>
<script src="<%=path%>/public/js/liu/commonFormat.js"></script>
<script src="<%=path %>/public/js/xie/agency_buildingsImg.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");

    })
    $("#buildingsImg").fileinput({
        language: 'zh',
        uploadUrl: '/buildingsImg/uploadBuildingsImage', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif','mp4','txt'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 409600,   //单个文件大小的最大值
        maxFilesNum: 1, //
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');  // 更改默认的名字
        }
    });
    $("#buildingsImgUpdate").fileinput({
        language: 'zh',
        uploadUrl: '/buildingsImg/uploadBuildingsImage', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif','mp4','txt'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 409600,   //单个文件大小的最大值
        maxFilesNum: 1, //
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');  // 更改默认的名字
        }
    });
</script>
</body>
</html>
