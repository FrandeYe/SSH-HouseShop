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
    <title>经销商增加楼盘</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            height: 400px;
            width: 40%;
        }

        #r-result {
            width: 100%;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=9Dr47aE6WwXEg7zEuoEyzjW17YafuBOG"></script>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-7">
        <!---区域选择-->
        <label for="name" class="col-sm-offset-1 col-sm-1 control-label">区域</label>

        <div >
            <div class="docs-methods">
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
                            <a onclick="setAddress()" class="btn btn-primary">添加到地址</a>
                            <%--<button class="btn btn-primary" id="reset" type="button">重置</button>--%>
                            <%--<button class="btn btn-warning" id="reset-deep" type="button">清空</button>--%>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <form class="form-horizontal" id="addForm">
            <input type="hidden" id="id_input" name="buildings.agency.id" value="${sessionScope.agency.id}"/>
            <input type="hidden" name="buildings.area" id="buildings_area"/>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">楼盘名称</label>
                <div class="col-sm-6">
                        <input type="text" class="form-control easyui-validatebox"
                               data-options="required:true, novalidate:true, validType:'ZE'"
                           id="name" name="buildings.name" placeholder="请输入楼盘名称:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cityName" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'ZE'"
                           id="cityName" name="buildings.address" placeholder="请输入地址:"/>
                    <a href="javascript:void(0);" class="btn btn-primary" onclick="theLocation('cityName');">确认(单击地图获取经纬度)</a>
                </div>
            </div>
            <div class="form-group">
                <label for="longitude" class="col-sm-2 control-label">经度</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="longitude" name="buildings.longitude" placeholder="请输入经度:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="latitude" class="col-sm-2 control-label">纬度</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="latitude" name="buildings.latitude" placeholder="请输入纬度:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="house_type" class="col-sm-2 control-label">房源类型</label>
                <div class="col-sm-6">
                    <select class="form-control easyui-validatebox"
                            id="house_type" name="buildings.house_type"
                            data-options="required:true, novalidate:true">
                        <option>高档住宅</option>
                        <option>普通住宅</option>
                        <option>公寓式住宅</option>
                        <option>别墅</option>
                        <option>商品房</option>
                        <option>存量房</option>
                        <option>集资房</option>
                        <option>微利房</option>
                        <option>平价房</option>
                        <option>公寓式住宅</option>
                        <option>复式住宅</option>
                        <option>跃层式住宅</option>
                        <option> 廉租住房</option>
                        <option>解困房</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="building_type" class="col-sm-2 control-label">建筑类型</label>
                <div class="col-sm-6">
                    <select id="building_type" name="buildings.building_type"
                            class="form-control easyui-validatebox  easyui-textberbox"
                            data-options="required:true, novalidate:true">
                        <option>办公建筑</option>
                        <option>教育建筑</option>
                        <option>农村住宅</option>
                        <option>居住建筑城镇住宅</option>
                        <option>纺织工业建筑</option>
                        <option>机械工业建筑</option>
                        <option>化工工业建筑</option>
                        <option>商业建筑</option>
                        <option>邮电通信建筑</option>
                        <option>板塔</option>
                        <option>纪念建筑</option>
                        <option>其它建筑</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="company" class="col-sm-2 control-label">开发公司</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                           data-options="required:true, novalidate:true"
                           id="company" name="buildings.company" placeholder="请输入开发公司:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="reception_address" class="col-sm-2 control-label">接待地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                           data-options="required:true, novalidate:true"
                           id="reception_address" name="buildings.reception_address" placeholder="请输入接待地址:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="property_company" class="col-sm-2 control-label">物业公司</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  easyui-textberbox"
                           data-options="required:true, novalidate:true"
                           id="property_company" name="buildings.property_company" placeholder="请输入物业公司:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="traffic" class="col-sm-2 control-label">交通状况</label>
                <div class="col-sm-6">
                        <input type="text" class="form-control easyui-validatebox"
                               data-options="required:true, novalidate:true, validType:'ZE'"
                           id="traffic" name="buildings.traffic" placeholder="请输入交通状况:"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">周边配套</label>
                <div class="col-sm-6">
                    <textarea cols="60" rows="10" data-options="required:true, novalidate:true"
                              class="form-control easyui-validatebox  easyui-textberbox" placeholder="请输入周边配套:"
                              id="equipments" name="buildings.equipments"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-6">
                        <textarea cols="60" rows="10" data-options="required:true, novalidate:true"
                                  class="form-control easyui-validatebox" placeholder="请输入楼盘简介:"
                                  id="intro" name="buildings.intro"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="floor_area" class="col-sm-2 control-label">占地面积</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="floor_area" name="buildings.floor_area" placeholder="请输入占地面积:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="building_area" class="col-sm-2 control-label">建筑面积</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="building_area" name="buildings.building_area" placeholder="请输入建筑面积:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="avg_price" class="col-sm-2 control-label">楼盘均价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="avg_price" name="buildings.avg_price" placeholder="请输入楼盘均价:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_rooms" class="col-sm-2 control-label">总套数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'integer'"
                           id="total_rooms" name="buildings.total_rooms" placeholder="请输入总套数:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">楼盘售楼电话</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'tel'"
                           id="tel" name="buildings.tel" placeholder="请输入楼盘售楼电话:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="green_ratio" class="col-sm-2 control-label">绿化率</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="green_ratio" name="buildings.green_ratio" placeholder="请输入绿化率:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="plot_ratio" class="col-sm-2 control-label">容积率</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="plot_ratio" name="buildings.plot_ratio" placeholder="请输入容积率:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="property_fee" class="col-sm-2 control-label">物业费</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'number'"
                           id="property_fee" name="buildings.property_fee" placeholder="请输入物业费:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="car_station" class="col-sm-2 control-label">车位数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true, validType:'integer'"
                           id="car_station" name="buildings.car_station" placeholder="请输入车位数:"/>
                </div>
            </div>
            <div class="form-group ">
                <label for="open_date" class="col-sm-2 control-label ">开盘日期</label>
                <div class="col-sm-4">
                    <input class="easyui-datebox form-control easyui-validatebox " style="width:200px"
                           data-options="required:true, novalidate:true"
                           id="open_date" name="buildings.open_date"/>
                </div>
            </div>
            <div class="form-group">
                <a class="col-sm-offset-3  btn btn-primary"
                   onclick="addBuildings();">确认</a>
                <button type="reset" class="col-sm-offset-1 btn btn-default">取消</button>
            </div>
        </form>

    </div>
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

</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>


<!--自定义的js-->
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%= path %>/public/js/xie/agency_buildings.js"></script>

<!--区域选择-->
<script src="<%=path%>/public/js/ye/index-js/areaSelect.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.data.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.js"></script>

<script src="<%=path%>/public/plugins/map/baiduMap_bildings.js"></script>
</body>
</html>
