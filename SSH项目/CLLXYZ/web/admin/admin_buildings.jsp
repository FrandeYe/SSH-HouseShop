<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/2
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/zhang/main.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%=path%>/public/plugins/lightbox2/dist/css/lightbox.css"  rel="stylesheet"/>
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
        url:'<%=path %>/buildings/pagerBuildingsAdmin',
        method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">楼盘id</th>
        <th data-options="field:'name'">楼盘名称</th>
        <th data-options="field:'agency',formatter:formatObject">经销商名称</th>
        <th data-options="field:'address',align:'center'">楼盘地址</th>
        <th data-options="field:'floor_area',align:'center'">占地面积</th>
        <th data-options="field:'building_area',align:'center'">建筑面积</th>
        <th data-options="field:'house_type',align:'center'">房源类型</th>
        <th data-options="field:'building_type',align:'center'">建筑类型</th>
        <th data-options="field:'avg_price',align:'center'">楼盘均价</th>
        <th data-options="field:'open_date',align:'center',formatter:formatDate">开盘时间</th>
        <th data-options="field:'total_rooms',align:'center'">总套数</th>
        <th data-options="field:'reception_address',align:'center'">接待地址</th>
        <th data-options="field:'avg_price',align:'center'">楼盘均价</th>
        <th data-options="field:'tel',align:'center'">固定电话</th>
        <th data-options="field:'status',align:'left'">状态</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showBuildingsDetail('buildings.',10);">显示楼盘详情</a>
</div>

<div id="win" class="easyui-window" title="详情窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">

    <div class="col-lg-12" style="margin-top: 30px;">
        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="agency_id"/>
            <input type="hidden" name="status"/>

            <div class="form-group">
                <label class="col-sm-2 control-label">楼盘封面</label>
                <div class="col-sm-6">
                    <a id="logo-a" href="<%=path%>"  data-lightbox="image-group">
                        <img class="img-responsive" id="logo-b"  src="<%=path%>" alt="img-1" style="width: 60px;height: auto;"/>
                    </a>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>

            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-6">
                    <input id="intro" readonly type="text"  class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="intro" />
                </div>
            </div>

            <div class="form-group">
                <label for="created_time" class="col-sm-2 control-label">创建时间</label>
                <div class="col-sm-6">
                    <input id="created_time" readonly type="text" class="form-control easyui-validatebox "
                           data-options="required:true, novalidate:true"  name="created_time"/>
                </div>
            </div>

            <div class="form-group">
                <label for="open_date" class="col-sm-2 control-label">开盘时间</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox "
                           data-options="required:true, novalidate:true" name="open_date"
                           id="open_date"/>
                </div>
            </div>

            <div class="form-group">
                <label for="area" class="col-sm-2 control-label">区域</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="area"
                           id="area"/>
                </div>
            </div>

             <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="address"
                           id="address"/>
                </div>
            </div>

            <div class="form-group">
                <label for="house_type" class="col-sm-2 control-label">户型</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="house_type"
                           id="house_type"/>
                </div>
            </div>

            <div class="form-group">
                <label for="building_type" class="col-sm-2 control-label">建筑类型</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="building_type"
                           id="building_type"/>
                </div>
            </div>

             <div class="form-group">
                <label for="floor_area" class="col-sm-2 control-label">占地面积</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="floor_area"
                           id="floor_area"/>
                </div>
            </div>

             <div class="form-group">
                <label for="building_area" class="col-sm-2 control-label">建筑面积</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="building_area"
                           id="building_area"/>
                </div>
            </div>

            <div class="form-group">
                <label for="avg_price" class="col-sm-2 control-label">平均价格</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="avg_price"
                           id="avg_price"/>
                </div>
            </div>

            <div class="form-group">
                <label for="total_rooms" class="col-sm-2 control-label">总房间数</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="total_rooms"
                           id="total_rooms"/>
                </div>
            </div>

            <div class="form-group">
                <label for="car_station" class="col-sm-2 control-label">车位数</label>
                <div class="col-sm-6">
                    <input id="car_station" readonly type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="car_station"/>
                </div>
            </div>

            <div class="form-group">
                <label for="reception_address" class="col-sm-2 control-label">接待地址</label>
                <div class="col-sm-6">
                    <input id="reception_address" readonly type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="reception_address" />
                </div>
            </div>

            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">售楼电话</label>
                <div class="col-sm-6">
                    <input id="tel" readonly type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="tel" />
                </div>
            </div>

            <div class="form-group">
                <label for="company" class="col-sm-2 control-label">建筑公司</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="company"
                           id="company"/>
                </div>
            </div>

            <div class="form-group">
                <label for="property_company" class="col-sm-2 control-label">物业公司</label>
                <div class="col-sm-6">
                    <input id="property_company" readonly type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="property_company"/>
                </div>
            </div>

            <div class="form-group">
                <label for="property_fee" class="col-sm-2 control-label">物业费</label>
                <div class="col-sm-6">
                    <input id="property_fee"  readonly type="text" class="form-control easyui-validatebox "
                           data-options="required:true, novalidate:true" name="property_fee"/>
                </div>
            </div>

             <div class="form-group">
                <label for="longitude" class="col-sm-2 control-label">经度</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="longitude"
                           id="longitude"/>
                </div>
            </div>

             <div class="form-group">
                <label for="latitude" class="col-sm-2 control-label">纬度</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="latitude"
                           id="latitude"/>
                </div>
            </div>

            <div class="form-group">
                <label for="green_ratio" class="col-sm-2 control-label">绿化率</label>
                <div class="col-sm-6">
                    <input id="green_ratio" readonly type="text" class="form-control easyui-validatebox "
                           data-options="required:true, novalidate:true" name="green_ratio"  />
                </div>
            </div>
            <div class="form-group">
                <label for="plot_ratio" class="col-sm-2 control-label">容积率</label>
                <div class="col-sm-6">
                    <input id="plot_ratio" readonly type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true" name="plot_ratio" />
                </div>
            </div>

        </form>
    </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path%>/public/plugins/lightbox2/dist/js/lightbox.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path%>/public/js/liu/commonFormat.js"></script>
<script src="<%=path%>/public/js/liu/buildings.js"></script>

<script>
    $(function () {
        setPagination("list");
    })
</script>

</body>
</html>

