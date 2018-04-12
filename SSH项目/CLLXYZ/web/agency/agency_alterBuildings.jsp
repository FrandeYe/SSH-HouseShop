 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/9/1
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>查看单个楼盘详情</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>

    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
</head>
<body>
<div class="col-lg-12">

    <label for="name" class="col-sm-offset-1 col-sm-1 control-label">区域选择</label>

    <div  style="margin-right:50px;">
        <div class="docs-methods" name="区域选择">
            <form class="form-inline">
                <div id="distpicker">
                    <div class="form-group">
                        <label class="sr-only" for="province">Province</label>
                        <select class="form-control" id="province"></select>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="city">City</label>
                        <select class="form-control" id="city"></select>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="district">District</label>
                        <select class="form-control" id="district"></select>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" id="reset" type="button">重置</button>
                        <button class="btn btn-warning" id="reset-deep" type="button">清空</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <form class="form-horizontal" id="addForm">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="buildings.name"
                       id="name" value=${requestScope.buildings.name} />
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true" name="buildings.address"
                       id="address" value ="${requestScope.buildings.address}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="company" class="col-sm-2 control-label">开发公司</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="company" name="buildings.company" value ="${requestScope.buildings.company}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="reception_address" class="col-sm-2 control-label">接待地址</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="reception_address" name="buildings.reception_address" value ="${requestScope.buildings.reception_address}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="property_company" class="col-sm-2 control-label">物业公司</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="property_company" name="buildings.property_company" value ="${requestScope.buildings.property_company}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="equipments" class="col-sm-2 control-label">周边配套</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="equipments" name="buildings.equipments" value ="${requestScope.buildings.equipments}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="intro" name="buildings.intro" value ="${requestScope.buildings.intro}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="house_type" class="col-sm-2 control-label">房源类型</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="house_type" name="buildings.house_type" value ="${requestScope.buildings.house_type}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="building_type" class="col-sm-2 control-label">建筑类型</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="building_type" name="buildings.building_type" value ="${requestScope.buildings.building_type}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="traffic" class="col-sm-2 control-label">交通状况</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                       data-options="required:true, novalidate:true"
                       id="traffic" name="buildings.traffic" value ="${requestScope.buildings.traffic}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="floor_area" class="col-sm-2 control-label">占地面积</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="floor_area" name="buildings.floor_area" value ="${requestScope.buildings.floor_area}" />
            </div>
        </div>
        <div class="form-group">
            <label for="building_area" class="col-sm-2 control-label">建筑面积</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="building_area" name="buildings.building_area" value ="${requestScope.buildings.building_area}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="longitude" class="col-sm-2 control-label">经度</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="longitude" name="buildings.longitude" value ="${requestScope.buildings.longitude}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="latitude" class="col-sm-2 control-label">纬度</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="latitude" name="buildings.latitude" value ="${requestScope.buildings.latitude}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="avg_price" class="col-sm-2 control-label">楼盘均价</label>
            <div class="col-sm-6">
                <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                       data-options="required:true, novalidate:true"
                       id="avg_price" name="buildings.avg_price" value ="${requestScope.buildings.avg_price}"/>
            </div>
        </div>
        <div class="form-group">
        <label for="total_rooms" class="col-sm-2 control-label">总套数</label>
        <div class="col-sm-6">
            <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                   data-options="required:true, novalidate:true"
                   id="total_rooms" name="buildings.total_rooms" value ="${requestScope.buildings.total_rooms}"/>
        </div>
    </div>

        <div class="form-group">
        <label for="tel" class="col-sm-2 control-label">销售楼盘电话</label>
        <div class="col-sm-6">
            <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                   data-options="required:true, novalidate:true"
                   id="tel" name="buildings.tel" value ="${requestScope.buildings.tel}"/>
        </div>
    </div>
        <div class="form-group">
        <label for="green_ratio" class="col-sm-2 control-label">绿化率</label>
        <div class="col-sm-6">
            <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                   data-options="required:true, novalidate:true"
                   id="green_ratio" name="buildings.green_ratio" value ="${requestScope.buildings.green_ratio}"/>
        </div>
    </div>
        <div class="form-group">
        <label for="plot_ratio" class="col-sm-2 control-label">容积率</label>
        <div class="col-sm-6">
            <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                   data-options="required:true, novalidate:true"
                   id="plot_ratio" name="buildings.plot_ratio" value ="${requestScope.buildings.plot_ratio}"/>
        </div>
    </div>

        <div class="form-group">
        <label for="car_station" class="col-sm-2 control-label">车位费</label>
        <div class="col-sm-6">
            <input type="text" class="form-control easyui-validatebox  easyui-numberberbox"
                   data-options="required:true, novalidate:true"
                   id="car_station" name="buildings.car_station" value ="${requestScope.buildings.car_station}"/>
        </div>
        </div>

        <div class="form-group ">
            <label class="col-sm-2 control-label ">创建时间</label>
            <div class="col-sm-4">
                <input class="easyui-datetimebox form-control easyui-validatebox easyui-datetimeberbox" style="width:200px"
                       data-options="required:true, novalidate:true"
                       id="created_time" name="buildings.created_time" />
            </div>
        </div>
        <div class="form-group">
            <a class="col-sm-offset-3  btn btn-primary "
               onclick="updateBuildings();">确认</a>
            <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
        </div>
    </form>

</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--区域的js-->
<script src="<%=path%>/public/js/ye/index-js/areaSelect.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.data.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.js"></script>
<!--文件上传-->
<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_buildings.js"></script>

</body>
</html>