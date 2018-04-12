<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>员工后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/lai/main.css" rel="stylesheet" />
</head>
<body class="easyui-layout">

<div id="top" data-options="region:'north'">
    <div id="logo">
        <c:if test="${not empty sessionScope.employee.headicon}">
            <img style="height:78px;height:78px;border-radius:20%;" src="${sessionScope.employee.headicon}" />
        </c:if>
        <c:if test="${empty sessionScope.employee.headicon}">
            <img style="height:78px;height:78px;border-radius:20%;" src="<%=path %>/public/images/ye/emp_img/emp_default.jpg"/>
        </c:if>
    </div>
    <div id="top_title" style="float:left;width:280px;text-align:center;margin-left:25%;margin-top:20px;">
        <h1>员工后台管理系统</h1>
    </div>
    <div id="welcome">
        <a href="<%=path%>/index/showHome" style="color: #2f9ce7"><strong>平台首页</strong></a>
        欢迎您：<a href="javascript:void(0);" style="color: #f962ca">${sessionScope.employee.name}</a>,&nbsp;
        <a href="javascript:void(0);" onclick="employeeExit();">安全退出</a>
    </div>
</div>
<div id="footer" data-options="region:'south',split:true">

</div>
<div id="menu" data-options="region:'west',split:true" title="主菜单">
    <div class="easyui-accordion">
        <div title="信息管理" data-options="selected:true">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_information.jsp">基本信息</a></li>
            </ul>
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_pwd.jsp">修改密码</a></li>
            </ul>
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_uploadHeadIcon.jsp">修改头像</a></li>
            </ul>
        </div>
        <div title="绩效与预约" data-options="">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_missions.jsp">查看绩效</a></li>
            </ul>
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_appointments.jsp">查看预约</a></li>
            </ul>
        </div>
        <div title="客户管理" data-options="">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_saveCustomer.jsp">添加客户</a></li>
            </ul>
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_customers.jsp">我的客户</a></li>
            </ul>
        </div>

        <div title="销售管理" data-options="">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_saveSale.jsp">添加记录</a></li>
            </ul>
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_sales.jsp">销售记录</a></li>
            </ul>
        </div>
        <div title="统计" data-options="">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/employee/emp_rooms.jsp">房屋状态表</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="tabs" class="easyui-tabs" data-options="region:'center'">
    <div title="主页">
        <label for="yearsSelect">选择年份</label>
        <select id="yearsSelect" onchange="setChartsData()">
            <option value="2017" selected>2017年</option>
            <option value="2016">2016年</option>
            <option value="2015">2015年</option>
            <option value="2014">2014年</option>
            <option value="2013">2013年</option>
            <option value="2012">2012年</option>
        </select>
        <input id="buildings_id"type="hidden" value="${sessionScope.employee.buildings.id}"/>
        <button class="btn btn-primary btn-sm" onclick="setChartsData()">确定</button>
        <div id="line"></div>
    </div>
</div>

<!-- 选项卡的右键菜单  -->
<div id="mm" class="easyui-menu">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div><!--分割线 -->
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭全部</div>
</div>


</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/employee.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
<script src="<%=path %>/public/js/lai/home.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts-zh_CN.js"></script>
<script>
    $(function () {
        var year =$("#yearsSelect").val();
        var id = $("#buildings_id").val();
        $.post("<%=path %>/employee/employeeSaleHouse?id=" + id + "&year=" + year,
            function (data) {
                if (data) {
                    employeeSaleHouse("line", data.series,data.title);
                }
            }, "json"
        );
    });
</script>

<script>
    function setChartsData() {
        var year =$("#yearsSelect").val();
        var id = $("#buildings_id").val();
        $.post("<%=path %>/employee/employeeSaleHouse?id=" + id + "&year=" + year,
            function (data) {
                if (data) {
                    employeeSaleHouse("line", data.series,data.title);
                }
            }, "json"
        );
    }

    function employeeSaleHouse(id, data,title) {
        new Highcharts.Chart(id, {
            // 图表的标题
            title: {
                text: title,
                x: -20
            },
            // 子标题
            subtitle: {
                text: '数据来源: www.house.com',
                x: -20
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
            },
            yAxis: {
                title: {
                    text: '销售金额(元)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '元'
            },
            // 图例
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            // 数据
            series: data
        });
    }
</script>

<script>


</script>
</html>
