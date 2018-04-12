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
    <link rel="stylesheet" href="../../public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <%--自定义css--%>
    <link rel="stylesheet" href="../../public/css/ye/page_css/all_agency.css"/>
</head>
<body class="container" style="height: auto;">
<%-- 导航条 --%>
<div>
    <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
</div>
<div class="container">
    <%--所有经销商分页--%>
    <div id="agency_block" class="row">
        <div class="col-md-12">
            <h4><span class="label label-default">房产经销商</span></h4>
        </div>
        <div class="col-md-12" style="background-color: #f3f1f1;width:98%">
            <div class="col-md-8" style="height: 730px;width: 830px;margin-left:25px;">
                <div id="img_block" class="row" style="margin-left:-5%;">
                    <div id="block" class="col-md-4" style="background-color: white;">
                        <a target="_top" id="logoHref0" href="#">
                            <img id="logoSrc0" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name0" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel0">12345678933</b>
                        </p>
                    </div>

                    <div id="block1" class="col-md-4" style="background-color: white;">
                        <a id="logoHref1" href="#">
                            <img id="logoSrc1" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name1" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel1">12345678933</b>
                        </p>
                    </div>

                    <div id="block2" class="col-md-4" style="background-color: white;">
                        <a id="logoHref2" href="#">
                            <img id="logoSrc2" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name2" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel2">12345678933</b>
                        </p>
                    </div>

                    <div id="block3" class="col-md-4" style="background-color: white;">
                        <a id="logoHref3" href="#">
                            <img id="logoSrc3" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name3" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel3">12345678933</b>
                        </p>
                    </div>

                    <div id="block4" class="col-md-4" style="background-color: white;">
                        <a id="logoHref4" href="#">
                            <img id="logoSrc4" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name4" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel4">12345678933</b>
                        </p>
                    </div>

                    <div id="block5" class="col-md-4" style="background-color: white;">
                        <a id="logoHref5" href="#">
                            <img id="logoSrc5" title="经销商" class="img-responsive"
                                 src="/public/images/upload/logo01.jpg"/>
                        </a>
                        <br/>
                        <b>
                            经销商：<a id="name5" href="#">新大陆集团</a>
                        </b>
                        <p>
                            电话：<b id="tel5">12345678933</b>
                        </p>
                    </div>
                </div>

                <%--分页开始--%>
                <div class="col-lg-offset-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a onclick="AllAgencyData(1);" href="javascript:void(0);">首页（当前第<span
                                    id="agencyCurrentPage">1</span>页）</a></li>
                            <li id="lastLi"><a onclick="lastAgencyPage();" href="javascript:void(0);">上一页</a></li>
                            <li id="nextLi"><a onclick="nextAgencyPage();" href="javascript:void(0);">下一页</a></li>
                            <li><a onclick="finalAgencyPage();" href="javascript:void(0);">尾页（总共<span
                                    id="agencyTotalPage">1</span>页）</a></li>
                        </ul>
                    </nav>
                </div>
                <%--分页结束--%>

            </div>
            <%--右部栏--%>
            <div class="col-md-4" style="width: 200px;margin-left: 50px;margin-top:80px;background-color: #f3f1f1">
                <a id="adsHref4" href="javascript:void(0);">
                    <img id="adsSrc4" style="height:350px;width:80px;" class="img-responsive"
                         src="/public/images/upload/act02.jpg"/>
                </a>
            </div>
        </div>
    </div>
    <%--版权信息--%>
    <div>
        <jsp:include page="/include_page/footer.jsp" flush="true"></jsp:include>
    </div>
        <%--浮动条--%>
        <div id="float_bar">
            <jsp:include page="/include_page/float_bar.jsp" flush="true"></jsp:include>
        </div>

</div>
<script src="<%=path%>/public/plugins/jquery.min.js"></script>
<script src="<%=path%>/public/plugins/bootstrap/js/bootstrap.js"></script>
<%--自定义js--%>
<script src="<%=path%>/public/js/ye/index-js/index_agency.js"></script>
<script type="text/javascript">
    $(function () {
        AllAgencyData(1);
        getAds(1);
    });
</script>
</body>
</html>
