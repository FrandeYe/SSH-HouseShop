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
<div class="container">

    <div>
        <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
    </div>
    <!--主页主体：开始-->

    <div class="pageMainWrap">
        <div class="in">
            <div class="secondBgColor">
                <div class="viewHead">
                    <!--文章摘要-->
                    <h2>南渡江畔养生福地 南国威尼斯城邀您临水而居</h2>
                    <p><em>文章创建时间：2017-09-06</em></p>

                </div>
                <div class="viewBody">
                    <!--文章内容-->
                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;临水而居，择水而憩，是一种诗意的生活，而孕育一方水土的南渡江更加适宜养生,也成为人们追逐的所在。
                        南国威尼斯城位于海口市琼山区云龙镇，依南渡江而建，大师典藏作品，项目整体采用全欧式建筑风格，具有浓郁的异国浪漫氛围。
                    </h5>
                    <!--文章标题-->
                    <h4><p align="center"><strong>南国威尼斯城</strong></p></h4>
                    <!--文章图片-->
                    <span><img src="<%=path%>/public/css/chen/main.jpg" title="南国威尼斯城项目整体鸟瞰图"
                               alt="南国威尼斯城项目整体鸟瞰图"></span>
                </div>

            </div>
        </div>

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
    <p style="clear: both;"></p>
    <div>
        <jsp:include page="/include_page/footer.jsp" flush="true"></jsp:include>
    </div>
</div>
</body>
</html>

