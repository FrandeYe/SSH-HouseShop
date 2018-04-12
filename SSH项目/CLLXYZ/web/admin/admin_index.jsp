<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/30
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Admin</title>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/plugins/easyui/themes/icon.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/lai/main.css" rel="stylesheet" />
</head>
<body class="easyui-layout">

<div id="top" data-options="region:'north'">
    <div id="welcome">
        欢迎您：&nbsp;&nbsp;&nbsp;<span>${sessionScope.admin.name }</span>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0);" onclick="adminExit()">安全退出</a>
    </div>
</div>
<div id="footer" data-options="region:'south',split:true">
</div>
<div id="menu" data-options="region:'west',split:true" title="主菜单">
    <%--手风琴--%>
    <div class="easyui-accordion">
        <%--系统管理--%>
        <div title="系统管理" data-options="iconCls:'icon-search'">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_pwdUpdate.jsp">修改密码</a></li>
            </ul>
        </div>
        <%--经销商管理--%>
        <div title="经销商管理" data-options="iconCls:'icon-ok'">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_agency.jsp">所有经销商</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_agency_unchecked.jsp">未审核经销商</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_agency_checked.jsp">已审核经销商</a></li>
            </ul>
        </div>
            <div title="查看楼盘" data-options="iconCls:'icon-ok'">
                <ul>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_buildings.jsp">所有楼盘</a></li>
                </ul>
            </div>

        <%--用户管理--%>
        <div title="用户管理" data-options="iconCls:'icon-help'">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_user.jsp">所有用户</a></li>
            </ul>
        </div>
        <%--活动管理--%>
            <div title="活动管理" data-options="iconCls:'icon-help'">
                <ul>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_activity.jsp">所有活动</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_platformActivity.jsp">平台活动</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_activity_add.jsp">添加活动</a></li>
                </ul>
            </div>
        <%--文章管理--%>
            <div title="文章管理" data-options="iconCls:'icon-help'">
                <ul>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_articleType_add.jsp">添加类型</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_articleType.jsp">所有类型</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_article.jsp">所有文章</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_article_add.jsp">添加文章</a></li>
                </ul>
            </div>
        <%--广告管理--%>
            <div title="广告管理" data-options="iconCls:'icon-help'">
                <ul>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_ads.jsp">所有广告</a></li>
                    <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/admin/admin_ads_add.jsp">添加广告</a></li>
                </ul>
            </div>
    </div>
</div>
<div id="tabs" class="easyui-tabs" data-options="region:'center'">
    <div title="主页">
        <h1 style="margin-left: 400px;margin-top: 20px;">欢迎您使用</h1>
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

<div id="operations">
    <div>任务优先级</div>
    <div class="menu-sep"></div>
    <div>调到最高优先级</div>
    <div>调到最低优秀级</div>
</div>

<div id="taskDetail" class="easyui-dialog normal-dlg" title="任务详情" data-options="closed:true,
        buttons: [{
					text:'执行任务',
					iconCls:'icon-ok',
					handler:function(){
						showAlert('执行任务');
						$('#taskDetail').dialog('close');
					}
				},{
					text:'关闭',
					handler:function(){
						$('#taskDetail').dialog('close');
					}
				}]">
    这是任务的详情！！！
</div>

<div id="editDetailWin" class="easyui-window normal-win" data-options="title:'编辑任务',closed:true,modal:true">
    编辑任务详情的form表单
</div>

</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/lai/home.js"></script>
<script src="<%=path %>/public/js/zhang/admin.js"></script>
</html>
