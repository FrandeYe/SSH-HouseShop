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
    <title>Title</title>
    <link href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,
        collapsible:true,
        rownumbers:true,
        pagination:true,
        pageSize:20,
        toolbar:'#tb',
        url:'<%=path %>/mission/pagerMissionAgencyNoTime?id=${sessionScope.agency.id}',
        method:'get'">
    <thead>

    <tr>
        <th data-options="field:'',checkbox:true,align:'center'"></th>
        <th data-options="field:'employee',align:'center',formatter:formatName">员工姓名</th>
        <th data-options="field:'basicSalary',align:'center'">员工基本工资</th>
        <th data-options="field:'realSalary',align:'center'">员工实际工资</th>
        <th data-options="field:'quantity',align:'center'">该月任务量</th>
        <th data-options="field:'saleCount',align:'center'">已完成任务量</th>
        <th data-options="field:'monthes',align:'center'">月份</th>
        <th data-options="field:'bonus_percent',align:'center'">销售提成</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <label for="yearMonthSelect">选择月份</label>
    <select onchange="getNewData('${sessionScope.agency.id}');" id="yearMonthSelect" name="missionTime">
        <option>2017年1月</option>
        <option>2017年2月</option>
        <option>2017年3月</option>
        <option>2017年4月</option>
        <option>2017年5月</option>
        <option>2017年6月</option>
        <option>2017年7月</option>
        <option>2017年8月</option>
        <option>2017年9月</option>
        <option>2017年10月</option>
        <option>2017年11月</option>
        <option>2017年12月</option>
    </select>

    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showQuantityWin();">修改单个</a>

    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showQuantityPercentWin();">修改所有</a>
</div>

<!--编辑任务量与提成窗口-->
<div id="editWin" class="easyui-window" title="修改单个" data-options="closed:true" style="width:800px;height:200px;">
    <div class="col-lg-12">
        <form id="editForm" class="form-horizontal">
            <input type="hidden" name="mission.id"/>
            <div class="form-group">
                <label for="quantity" class="col-sm-2 control-label">任务量:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="mission.quantity"
                           id="quantity"/>
                </div>
            </div>
            <div class="form-group">
                <label for="bonus_percent" class="col-sm-2 control-label">提成:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="mission.bonus_percent"
                           id="bonus_percent"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-primary" onclick="updateQuantity()">确认</a>
                </div>
                <div class=" col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-default" onclick="closeWin('editWin')" >取消</a>
                </div>
            </div>
        </form>
    </div>
</div>

<!--编辑提成窗口-->
<div id="editPercentWin" class="easyui-window normal-win" title="修改所有" data-options="closed:true" style="width:800px;height:200px;">
    <div class="col-lg-12">
        <form id="percentForm" class="form-horizontal">
            <div class="form-group">
                <label for="quantity1" class="col-sm-2 control-label">任务量:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="mission.quantity"
                           id="quantity1"/>
                </div>
            </div>
            <div class="form-group">
                <label for="bonus_percent1" class="col-sm-2 control-label">提成:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true" name="mission.bonus_percent"
                           id="bonus_percent1"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-primary" onclick="updateBonusPercent()">确认</a>
                </div>
                <div class=" col-sm-2">
                    <a href="javascript:void(0)" class="btn btn-default" onclick="closeWin('editPercentWin')" >取消</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/lai/agency_mission.js"></script>

<script>
    $(function () {
        setSelectTime();
        setPagination("list");
        formatSaleCount();
    })
</script>
</html>
