<%--
  Created by IntelliJ IDEA.
  User: mh
  Date: 2017/9/21
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{height:500px;width:100%;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9Dr47aE6WwXEg7zEuoEyzjW17YafuBOG"></script>
    <title>楼盘地图</title>

    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <div class="form-group">
        <div style="margin-top: 15px" class="col-lg-2" id="allmap"></div>
        <div class="col-lg-offset-1 form-inline">
            <a class="btn btn-primary"
               onclick="add_scale_control();">增加比例控件</a>
            <a class="btn btn-default" onclick="delete_scale_control()">删除比例控件</a>
            <a class="btn btn-primary"
               onclick="add_type_control();">增加类型控件</a>
            <a class="btn btn-default" onclick="delete_type_control()">删除类型控件</a>
        </div>
    </div>
</body>
</html>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.331398,39.897445),13);
    map.enableScrollWheelZoom(true);
    // 用经纬度设置地图中心点
    function theLocation(longitude, latitude){
        if(longitude != undefined && latitude != undefined){
            map.clearOverlays();
            var new_point = new BMap.Point(longitude,latitude);
            var marker = new BMap.Marker(new_point);  // 创建标注
            map.addOverlay(marker);              // 将标注添加到地图中
            map.panTo(new_point);
        }
    }
    theLocation(${requestScope.longitude}, ${requestScope.latitude});
</script>
<script src="<%=path %>/public/plugins/map/baiduMap_plugins.js"></script>
