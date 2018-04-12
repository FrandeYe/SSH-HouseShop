<%--
  Date: 2017/9/15
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/chen/main.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>
<body class="container" style="height: auto;">
<div>
    <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
</div>
<!--主页主体：开始-->

<div class="pageMainWrap">
    <div class="col-xs-6 col-sm-8 col-lg-8">
        <div class="in">
            <div class="secondBgColor">
                <div class="viewHead">
                    <!--文章摘要-->
                    <h2 id="abstracts"></h2>
                    <p><em>文章创建时间：<span id="created_time"></span></em></p>

                </div>
                <div class="viewBody">
                    <!--文章内容-->
                    <h5>
                        <span id="content"></span>
                    </h5>
                    <!--文章标题-->
                    <h4><p align="center"><strong id="title"></strong></p></h4>
                    <!--文章图片-->
                    <span><img id="logoSrc" src=""></span>
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
                    <a href="#"><img src="<%=path%>/public/css/chen/main.jpg" title="图" alt="图"></a>
                </div>

                <div class="adv">
                    <h6> 广告2</h6>
                    <a href="#"><img src="<%=path%>/public/css/chen/main.jpg" title="图" alt="图"></a>
                </div>

                <div class="adv">
                    <h6> 广告3</h6>
                    <a href="#"><img src="<%=path%>/public/css/chen/main.jpg" title="图" alt="图"></a>
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
    <script src="<%=path %>/public/js/lai/index_articles.js"></script>
    <script>
        $(function () {
            getArticleInfo('${requestScope.id}');
        });
    </script>
</body>
</html>

