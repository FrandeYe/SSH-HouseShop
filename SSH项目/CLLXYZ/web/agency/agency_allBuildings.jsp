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
    <title>经销商添加楼盘</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
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
        url:'<%=path %>/buildings/pagerBuildingsAgency?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true">楼盘编号</th>
        <th data-options="field:'name',align:'center'">名称</th>
        <th data-options="field:'address',align:'center'">地址</th>
        <th data-options="field:'floor_area',align:'center'">占地面积</th>
        <th data-options="field:'building_area',align:'center'">建筑面积</th>
        <th data-options="field:'house_type',align:'center'">房源类型</th>
        <th data-options="field:'building_type',align:'center'">建筑类型</th>
        <th data-options="field:'reception_address',align:'center'">接待地址</th>
        <th data-options="field:'tel',align:'center'">楼盘销售电话</th>
        <th data-options="field:'open_date',align:'center',formatter:formatDate">开盘时间</th>
        <th data-options="field:'created_time',align:'center',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'center',formatter:formatStatus">状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validBuildings(1);">激活楼盘</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validBuildings(0);">冻结楼盘</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWinBefore()">修改楼盘信息</a>
</div>

<div id="win" class="easyui-window" title="编辑窗口" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">

        <label for="name" class="col-sm-offset-1 col-sm-1 control-label">区域选择</label>

        <div style="margin-right:50px;">
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
                    </div>
                </form>
            </div>
        </div>

        <form class="form-horizontal" id="form">
            <input type="hidden" name="id"/>
            <input type="hidden" name="area" id="buildings_area_id"/>
            <input type="hidden" name="status"/>
            <input type="hidden" name="logo" id="buildings_logo_id"/>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="name"
                           id="name"/>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="address"
                           id="address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="company" class="col-sm-2 control-label">开发公司</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="company" name="company"/>
                </div>
            </div>
            <div class="form-group">
                <label for="reception_address" class="col-sm-2 control-label">接待地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="reception_address" name="reception_address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="property_company" class="col-sm-2 control-label">物业公司</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="property_company" name="property_company"/>
                </div>
            </div>
            <div class="form-group">
                <label for="equipments" class="col-sm-2 control-label">周边配套</label>
                <div class="col-sm-6">
                    <textarea name="buildings.equipments" id="equipments" cols="30" rows="10"
                              data-options="required:true, novalidate:true" class="form-control easyui-validatebox">
                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="intro" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-6">
                    <%--<input type="text" class="form-control easyui-validatebox"--%>
                           <%--data-options="required:true, novalidate:true"--%>
                           <%--id="intro" name="intro"/>--%>
                    <textarea name="buildings.intro" id="intro" cols="30" rows="10" class="form-control easyui-validatebox"
                        data-option="request:true,novalidate:true">
                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="house_type" class="col-sm-2 control-label">房源类型</label>
                <div class="col-sm-6">
                    <select class="form-control easyui-validatebox"
                            id="house_type" name="house_type"
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
                    <select id="building_type" name="building_type"
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
                <label for="traffic" class="col-sm-2 control-label">交通状况</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="traffic" name="traffic"/>
                </div>
            </div>
            <div class="form-group">
                <label for="floor_area" class="col-sm-2 control-label">占地面积</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="floor_area" name="floor_area"/>
                </div>
            </div>
            <div class="form-group">
                <label for="building_area" class="col-sm-2 control-label">建筑面积</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="building_area" name="building_area"/>
                </div>
            </div>
            <div class="form-group">
                <label for="longitude" class="col-sm-2 control-label">经度</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="longitude" name="longitude"/>
                </div>
            </div>
            <div class="form-group">
                <label for="latitude" class="col-sm-2 control-label">纬度</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="latitude" name="latitude"/>
                </div>
            </div>
            <div class="form-group">
                <label for="avg_price" class="col-sm-2 control-label">楼盘均价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="avg_price" name="avg_price"/>
                </div>
            </div>
            <div class="form-group">
                <label for="property_fee" class="col-sm-2 control-label">物业费</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="property_fee" name="property_fee"/>
                </div>
            </div>
            <div class="form-group">
                <label for="total_rooms" class="col-sm-2 control-label">总套数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="total_rooms" name="total_rooms"/>
                </div>
            </div>

            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">销售楼盘电话</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="tel" name="tel"/>
                </div>
            </div>
            <div class="form-group">
                <label for="green_ratio" class="col-sm-2 control-label">绿化率</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="green_ratio" name="green_ratio"/>
                </div>
            </div>
            <div class="form-group">
                <label for="plot_ratio" class="col-sm-2 control-label">容积率</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="plot_ratio" name="plot_ratio"/>
                </div>
            </div>

            <div class="form-group">
                <label for="car_station" class="col-sm-2 control-label">车位费</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="car_station" name="car_station"/>
                </div>
            </div>
            <div class="form-group ">
                <label for="open_date" class="col-sm-2 control-label ">开盘日期</label>
                <div class="col-sm-6">
                    <input type="text" class="easyui-datebox form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           id="open_date" name="open_date"/>
                </div>
            </div>
            <div class="form-group">
                <label for="buildingsImg" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">原始图片</label>
                <div class="col-sm-6">
                    <img class="img-responsive" id="buildingsImg" src="<%=path %>/public/images/upload/default_buildings_logo.jpg" />
                </div>
            </div>
            <div class="form-group">
                <label for="buildings_logo" class="col-sm-2 control-label">修改图片</label>
                <div class="col-sm-6" style="height: 290px;">
                    <input type="file" onchange="setBuildingsLogoFileName();" multiple class="form-control file-preview" id="buildings_logo" name="buildingsLogo"
                           data-overwrite-initial="false" data-max-file-count="1" style="height: 200px;width:auto;">
                </div>
            </div>
            <div style="height: auto;width: 300px;margin-top:130px;margin-right: auto;margin-left: auto;">
                <a style="">
                    <a  href="javascript:;" class="btn btn-primary btn-mg" onclick="updateBuildings()">确认</a>
                </a>
                <a style="position:absolute;top:280px;left:650px;">
                    <a href="javascript:;" onclick="closeWin('win')"  class="btn btn-default btn-mg">取消</a>
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
<!--区域的js-->
<script src="<%=path%>/public/js/ye/index-js/areaSelect.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.data.js"></script>
<script src="<%=path%>/public/js/ye/index-js/distpicker.js"></script>

<!--自己的js-->
<script src="<%=path %>/public/js/xie/agency_buildings.js"></script>
<script src="<%=path %>/public/js/lai/load_form_data.js"></script>


<script>
    $(function () {
        setPagination("list");
    })
    $("#buildings_logo").fileinput({
        language: 'zh',
        uploadUrl: '/buildings/updateBuildingsLogo', // you must set a valid URL here else you will get an error
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
