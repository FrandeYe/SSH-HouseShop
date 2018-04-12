<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/9/11
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-css/index_top.css"/>
</head>
<body>
<nav class="navbar navbar-default " role="navigation">
    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="<%=path%>/index/showHome">房产网</a>
        </div>

        <div id="nav" style="margin-left: 30px;">
            <ul class="nav navbar-nav top-bar" id="ul">
                <li id="L1" class="sel" onmouseover="over('L1')" onmouseout="out('L1')"><a id="la1" href="<%=path%>/index/showHome">首页</a></li>
                <li id="L5" onmouseover="over('L5')" onmouseout="out('L5')"><a id="la5" href="<%=path%>/agency/showPagerAgencyIndex">房产经销商</a></li>
                <li id="L2" onmouseover="over('L2')" onmouseout="out('L2')"><a id="la2" href="<%=path%>/buildings/showBuildings">所有楼盘</a></li>
                <li id="L3" onmouseover="over('L3')" onmouseout="out('L3')"><a id="la3" href="<%=path%>/activity/showActivities">楼盘活动</a></li>
                <li id="L4" onmouseover="over('L4')" onmouseout="out('L4')"><a id="la4" href="<%=path%>/article/showArticles">文章资讯</a></li>
                <c:choose>
                    <c:when test="${!empty sessionScope.user}">
                        <li class="dropdown" style="margin-left: 400px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.name}<b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/user/showUserIndex">个人中心</a></li>
                                <li>
                                    <a href="javascript:void(0);" onclick="userExit();">安全退出</a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:when test="${!empty sessionScope.employee}">
                        <li class="dropdown" style="margin-left: 400px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.employee.name}<b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/employee/showEmployeeIndex">个人中心</a></li>
                                <li>
                                    <a href="javascript:void(0);" onclick="employeeExit();">安全退出</a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:when test="${!empty sessionScope.agency}">
                        <li class="dropdown" style="margin-left: 400px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.agency.name}<b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/agency/showAgencyIndex">个人中心</a></li>
                                <li>
                                    <a href="javascript:void(0);" onclick="">安全退出</a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:when test="${!empty sessionScope.admin}">
                        <li class="dropdown" style="margin-left: 400px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.admin.name}<b
                                    class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/agency/showAdminIndex">个人中心</a></li>
                                <li>
                                    <a href="javascript:void(0);" onclick="adminExit();">安全退出</a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown" style="margin-left: 380px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">注册<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/agency/showAgencyRegister">经销商入驻</a></li>
                                <li><a href="<%=path%>/user/showUserRegister">用户注册</a></li>
                            </ul>
                        </li>
                        <li class="dropdown" style="margin-left: 40px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">登录<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/user/showUserLogin">用户登录</a></li>
                                <li><a href="<%=path%>/agency/showAgencyLogin">经销商登录</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <div id="search_bar">
                <div class="col-xs-3" style="margin-left:50%;margin-top:-40px;">
                    <div class="input-group">
                        <input id="searchInput" type="text" class="form-control" placeholder="搜索您想要的内容">
                        <span onclick="showGlobalSearch();" class="input-group-btn">
                            <a href="javascript:void(0);"  class="btn btn-default">立即搜索</a>
					    </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div>
        </div>
    </div>
</nav>
</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/js/ye/index-js/index_top.js"></script>
<script type="text/javascript">
    $(function () {
        liColor();
    })
</script>
</html>
