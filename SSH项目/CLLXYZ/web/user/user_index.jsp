<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/29
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link href="<%=path %>/public/css/lai/main.css" rel="stylesheet" />
</head>
<body class="easyui-layout">

<div id="top" data-options="region:'north'">
    <div style="float: left;margin-top: 8px;">
        <c:if test="${sessionScope.user.headicon != null && sessionScope.user.headicon != ''}">
            <img  class="img-circle" id="hide_img" src="<%=path %>/public/images/upload/${sessionScope.user.headicon }" width="60" height="60"/>
        </c:if>
    </div>

    <div id="welcome">
        <a href="<%=path%>/index/showHome"><strong>返回首页</strong></a>
        欢迎您：&nbsp;&nbsp;&nbsp;<span>${sessionScope.user.name }</span>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0);" onclick="userExit()">安全退出</a>
    </div>
</div>
<div id="footer" data-options="region:'south',split:true">

</div>
<div id="menu" data-options="region:'west',split:true"  title="主菜单" style="width: 245px; height:auto; display: block;">
    <div class="easyui-accordion">
        <div title="信息管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_basicInfo.jsp">基本信息</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_updatePwd.jsp">修改密码</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_updateIcon.jsp">修改头像</a></li>
            </ul>
        </div>
        <div title="足迹管理">
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_likes.jsp">所有点赞</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_comments.jsp">所有评价</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_messages.jsp">所有留言</a></li>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_histories.jsp">历史纪录</a></li>
            </ul>
        </div>
        <div title="预约管理" >
            <ul>
                <li><a href="javascript:void(0);" class="site-navi-tab" data-src="<%=path %>/user/user_appointments.jsp">所有预约</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="tabs" class="easyui-tabs" data-options="region:'center'">
    <div title="主页">
            <h2 class="col-md-offset-4">欢迎使用</h2>
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

</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/public/js/zhang/user.js" type="text/javascript"></script>
<script src="<%=path %>/public/js/lai/home.js"></script>
</html>

