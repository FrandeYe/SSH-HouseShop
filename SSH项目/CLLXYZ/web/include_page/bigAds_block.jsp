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
</head>
<body>
<%--轮播图广告--%>
<div class="row ">
    <div class="col-lg-12 col-md-12  col-sm-4">
        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" style="margin-right: auto;margin-left: auto">
                <div id="ads0" class="item active">
                    <a id="adsHref0" href="#">
                        <img id="adsSrc0" src="/public/images/ye/index_ads/Ad01.jpg" title="无广告"
                             style="width: 1170px;height:500px"/>
                    </a>
                </div>
                <div id="ads1" class="item">
                    <a id="adsHref1" href="#">
                        <img id="adsSrc1" src="/public/images/ye/index_ads/Ad01.jpg" title="无广告"
                             style="width: 1170px;height:500px"/>
                    </a>
                </div>
                <div id="ads2" class="item">
                    <a id="adsHref2" href="#">
                        <img id="adsSrc2" src="/public/images/ye/index_ads/Ad01.jpg" title="无广告"
                             style="width: 1170px;height:500px"/>
                    </a>
                </div>
            </div>

            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel"
               data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel"
               data-slide="next">&rsaquo;</a>
        </div>
    </div>
</div>
</body>
</html>
