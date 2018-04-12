<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>经销商后台管理</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/lai/main.css" rel="stylesheet" />
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
</head>
<body class="easyui-layout">

<div id="top" data-options="region:'north'">
    <div id="logo">
        <img style="height:78px;border-radius:20%;"
             src="<%=path %>${sessionScope.agency.logo}" />
    </div>
    <div id="welcome">
        <a href="<%=path%>/index/showHome"><strong>返回首页</strong></a>
        欢迎您：<a href="javascript:void(0);" style="color: #f962ca">${sessionScope.agency.name}</a>,&nbsp;
        <a href="javascript:void(0);" onclick="verify();">安全退出</a>
    </div>
</div>
<div id="footer" data-options="region:'south'">

</div>
<div id="menu" data-options="region:'west'" title="主菜单">
    <div class="easyui-accordion">
        <div title="信息管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_baseMessage.jsp">基本信息</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_savePwd.jsp">密码修改</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveLogo.jsp">商标修改</a></li>
            </ul>
        </div>
        <div title="楼盘管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allBuildings.jsp">所有楼盘</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveBuildings.jsp">增加楼盘</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_buildingsImg.jsp">楼盘图片</a></li>
            </ul>
        </div>
        <div title="员工管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allEmps.jsp">所有员工</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveEmps.jsp">添加员工</a></li>
            </ul>
        </div>
        <div title="绩效管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allMission.jsp">所有绩效</a></li>
            </ul>
        </div>
        <div title="活动管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allActivity.jsp">所有活动</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveActivity.jsp">添加活动</a></li>
            </ul>
        </div>
        <div title="楼栋管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allBuilding.jsp">所有楼栋</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveBuilding.jsp">添加楼栋</a></li>
            </ul>
        </div>
        <div title="户型管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_allHouse.jsp">所有户型</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveHouse.jsp">添加户型</a></li>
            </ul>
        </div>
		<div title="预约管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_all_appointment.jsp">所有预约</a></li>
            </ul>
        </div>
        <div title="评价留言">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_all_message.jsp">所有留言</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_all_comments.jsp">所有评价</a></li>
            </ul>
        </div>
        <div title="客户管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_all_customer.jsp">所有客户</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_saveCustomer.jsp">添加客户</a></li>
            </ul>
        </div>
        <div title="销售管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_roomCondition.jsp">销售情况</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_roomNumber.jsp">生成房号</a></li>
            </ul>
        </div>
        <div title="统计图表" >
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_buildingsMoneyCondition.jsp">楼盘销售统计</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/agency/agency_employeeMoneyCondition.jsp">员工销售统计</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="tabs" class="easyui-tabs" data-options="region:'center'">
    <div title="主页">
        <%--欢迎使用！--%>
        <img src="<%=path %>/public/images/xie/jd.jpg" />
            <div style="margin-left: 300px;">
                <h1 style="color: red">欢迎登录！</h1>
            </div>
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
<script src="<%=path %>/public/js/lai/home.js"></script>
</html>
