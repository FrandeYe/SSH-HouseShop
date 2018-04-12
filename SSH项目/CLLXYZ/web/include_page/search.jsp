<%@ taglib prefix="javascript" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/9/22
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>搜索</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/public/css/ye/index-css/sweet-alert.css"/>
</head>
<body class="container">

<%--导航栏--%>
<div>
    <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
</div>

    <!--search-->
    <div class="form-inline" style="margin-left: 500px;">
        <input value="${requestScope.name}" type="text" id="newSearchInput" class="form-control"/>
        <a class="btn btn-primary" onclick="getSearchData(1);">搜索</a>
    </div>

    <div>
        <div>
            <h4>共搜索到 <span id="searchCount"></span> 个有关“<span id="searchContent" style="color: red;">${requestScope.name}</span>”的内容</h4>
        </div>
    </div>

    <c:forEach begin="0" end="7" var="i">
        <div id="item${i}" class="col-xs-6 col-md-3 col-lg-3" style="margin-top: 30px;">
            <a id="logoHref${i}" href="javascript:void(0);">
                <img src="<%=path%>/public/images/xie/index.jpg" id="logoSrc${i}" style="width:78px;height:78px;border-radius:20%;"/></a>
            <div style="margin-left: 120px;margin-top: -80px;">
                <p>名称：<a id="name${i}" href="javascript:void(0);"></a></p>
                <p>类型：<span id="type${i}"></span></p>
            </div>
        </div>
    </c:forEach>

<!--分页按钮-->
    <div class="col-lg-offset-4" style="margin-top: 150px;">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a onclick="getSearchData(1);" href="#item0">首页（当前第<span id="currentPageSpan"></span>页）</a></li>
                <li><a onclick="lastPage();" href="#item0" id="SearchListPager">上一页</a></li>
                <li><a onclick="nextPage();" href="#item0" id="SearchNextPager">下一页</a></li>
                <li><a onclick="finallyPage();" href="#item0">尾页（总共<span id="totalPageSpan"></span>页）</a></li>
            </ul>
        </nav>
    </div>
    <%--版权--%>
    <div>
        <jsp:include page="/include_page/footer.jsp" flush="true"></jsp:include>
    </div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/js/ye/index-js/sweet-alert.js"></script>
<script type="text/javascript" src="<%=path %>/public/js/xie/search.js"></script>

<script>
    $(function () {
        getSearchData(1, '${requestScope.name}');
    });
</script>
</body>
</html>