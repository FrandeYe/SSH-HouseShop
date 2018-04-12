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
    <title>经销商添加户型</title>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
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
        url:'<%=path %>/house/pagerHouseAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">户型编号</th>
        <th data-options="field:'name',align:'center'">户型名称</th>
        <th data-options="field:'buildings',align:'center',formatter:formatName">所属楼盘</th>
        <th data-options="field:'intro',align:'center'">简介</th>
        <th data-options="field:'area',align:'center'">面积</th>
        <th data-options="field:'unit_price',align:'center'">参考单价</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validHouse(1);">激活户型</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validHouse(0);">冻结户型</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWinBefore();">修改户型</a>
</div>

<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">

        <form class="form-horizontal" id="form">
            <input type="hidden" name="id">
            <input type="hidden" name="status">
            <input type="hidden" name="logo" id="house_logo_id">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox "
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="buildings" class="col-sm-2 control-label">楼栋所属楼盘</label>
                <div class="col-sm-6">
                    <select id="buildings" name="buildings.id" class="form-control easyui-validatebox data-options= required:true, novalidate:true">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-6">
                    <textarea name="house.intro" id="intro" cols="30" rows="10" class="form-control easyui-validatebox"
                        date-options="request:true,novalidate:true"
                    ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="area" class="col-sm-2 control-label">面积</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="area" name="area" />
                </div>
            </div>
            <div class="form-group">
                <label for="unit_price" class="col-sm-2 control-label">参考单价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="unit_price" name="unit_price" />
                </div>
            </div>
            <div class="form-group">
                <label for="houseImg" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">原始图片</label>
                <div class="col-sm-6">
                    <img class="img-responsive" id="houseImg" src="<%=path %>/public/images/upload/default_house_logo.jpg" />
                </div>
            </div>
            <div class="form-group">
                <label for="house_logo" class="col-sm-2 control-label">修改图片</label>
                <div class="col-sm-6" style="height: 290px;">
                    <input type="file" multiple class="form-control file-preview" id="house_logo" name="houseLogo"
                      onchange="setHouseLogoFileName();"     data-overwrite-initial="false" data-max-file-count="1" style="height: 200px;width:auto;">
                </div>
            </div>
            <div style="height: auto;width: 300px;margin-top:130px;margin-right: auto;margin-left: auto;">
                <a style="">
                    <a  href="javascript:;" class="btn btn-primary" onclick="updateHouse()">确认</a>
                </a>
                <a style="position:absolute;top:280px;left:650px;">
                    <a href="javascript:;" onclick="closeWin('win')"  class="btn btn-default">取消</a>
                </a>
            </div>
        </form>

    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<!--文件上传js-->
<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<!--自己的js-->
<script src="<%=path %>/public/js/xie/agency_house.js"></script>
<script src="<%=path %>/public/js/lai/load_form_data.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>

<script>
    $(function () {
        setPagination("list");
        setBuildings("${sessionScope.agency.id}");
    })
    $("#house_logo").fileinput({
        language: 'zh',
        uploadUrl: '/house/updateHouseLogo', // you must set a valid URL here else you will get an error
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
