<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/23
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>房产网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/index-img.css">
    <%--以下为图片效果样式--%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-img-style/normalize.css"/>
    <%--<link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-img-style/demo.css"/>--%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-img-style/set2.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-img-style/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/ye/index-css/main.css"/>


</head>
<body>
<div class="container">
    <%-- 导航条 --%>
    <div id="top_block">
        <jsp:include page="include_page/top.jsp" flush="true"></jsp:include>
    </div>

    <div id="bigAds_block">
        <%--轮播图--%>
        <jsp:include page="include_page/bigAds_block.jsp" flush="true"></jsp:include>
    </div>

    <div id="areabuildings_block">
        <%--地区楼盘筛选模块--%>
        <jsp:include page="include_page/areabuildings_block.jsp" flush="true"></jsp:include>
    </div>

    <div id="activities_block">
        <%--活动，文章推荐模块--%>
        <jsp:include page="include_page/activity_block.jsp" flush="true"></jsp:include>
    </div>

    <div id="buildings_block">
        <%--热门楼盘板块--%>
        <jsp:include page="include_page/hotbuildings_block.jsp" flush="true"></jsp:include>
    </div>

    <%--版权信息--%>
    <div id="copyright_block">
        <jsp:include page="include_page/footer.jsp" flush="true"></jsp:include>
    </div>

        <%--浮动条--%>
    <div id="float_bar">
        <jsp:include page="include_page/float_bar.jsp" flush="true"></jsp:include>
    </div>

    <script src="<%=path%>/public/plugins/jquery.min.js"></script>
    <script src="<%=path%>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
    <script src="<%=path%>/public/js/ye/index-js/areaSelect.js"></script>
    <script src="<%=path%>/public/js/ye/index-js/distpicker.data.js"></script>
    <script src="<%=path%>/public/js/ye/index-js/distpicker.js"></script>
    <%--自定义js--%>
    <script src="<%=path%>/public/js/zhang/index.js"></script>
    <script src="<%=path %>/public/js/zhang/employee.js"></script>
    <script src="<%=path %>/public/js/zhang/admin.js"></script>
    <script src="<%=path %>/public/js/ye/index-js/index_home.js"></script>
    <script type="text/javascript">
        $(function () {
            getAds(1);
            getBuildingsData(1);
            getArticleTitle(1);
            getActivityTitle(1);
        })
    </script>
</body>
</html>
