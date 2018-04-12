<%--
  Date: 2017/9/15
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>活动详情</title>

    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css"/>
</head>
<body class="container" style="height: auto;">
<div class="container">


    <div>
        <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
    </div>
    <!--主页主体：开始-->
    <div class="pageMainWrap">
        <div class="col-lg-offset-1 col-xs-6 col-sm-8 col-lg-8">
            <div class="in">
                <div class="secondBgColor">
                    <div class="viewHead">
                        <!--活动标题-->
                        <h2><span id="title"></span></h2>
                        <p><em>开始时间：<span id="start_time"></span></em></p>
                        <p><em>结束时间:<span id="end_time"></span></em></p>
                        <p><em>地址：<span id="address"></span></em></p>
                    </div>
                    <div class="viewBody">
                        <!--活动内容-->
                        <h5>活动内容：<span id="content"></span></h5>
                        <span><img class="img-responsive" id="logoSrc" title="活动图" alt="活动图"/></span>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-xs-3 col-sm-3 col-lg-3">
            <div class="in">
                <div class="advs">
                    <div class="adv">
                        <p align="center"><h4>相关信息</h4></p>
                        <h6>广告1</h6>
                        <a href="#"><img class="img-responsive" src="<%=path%>/public/css/chen/main.jpg" title="图"
                                         alt="图"></a>
                    </div>

                    <div class="adv">
                        <h6> 广告2</h6>
                        <a href="#"><img class="img-responsive" src="<%=path%>/public/css/chen/main.jpg" title="图"
                                         alt="图"></a>
                    </div>

                    <div class="adv">
                        <h6> 广告3</h6>
                        <a href="#"><img class="img-responsive" src="<%=path%>/public/css/chen/main.jpg" title="图"
                                         alt="图"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p style="clear: both;"></p>
    <div>
        <jsp:include page="/include_page/footer.jsp" flush="true"></jsp:include>
    </div>

    <script src="<%=path %>/public/plugins/jquery.min.js"></script>
    <script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
    <script src="<%=path %>/public/js/chen/activityInfo.js"></script>
    <script>
        $(function () {
            getActivityInfo('${requestScope.id}');
        });
    </script>
</div>
</body>
</html>

