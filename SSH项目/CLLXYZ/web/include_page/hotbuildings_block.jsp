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
<%--热门楼盘展示3+2--%>
<div class="row">
    <div id="hot-buildings" style="background-color: rgba(220,220,220,0.4);height: 750px;margin-top:30px;"
         class="col-lg-12 col-md-12  col-sm-4 "
         style="margin-top: 30px;">
        <div class="row" onmouseover="this.style.background='#669933'"
             onmouseout="this.style.background='#66CC33'"
             style="width: 100px;background-color:#66CC33;text-align:center;margin-left:-10px;">
            <a href="<%=path%>/buildings/showBuildings" style="color: white;"><h4>热门楼盘</h4></a>
        </div>
        <div class="container" style="float: left;margin-left: -20px;">
            <div class="row">
                <div class="col-md-9" style="width:850px;margin-top: 15px;">
                    <%---楼盘4--%>
                    <div class="col-md-3"
                         style="width:260px;height:175px;background-color: white;margin-left:-5px;">
                        <div class="grid" style="margin-left: 10px;">
                            <figure class="effect-apollo">
                                <img id="bdsSrc4" src="<%=path%>/public/images/ye/buildings-img/buildings03.jpg"
                                     style=""/>
                                <figcaption>
                                    <h2 id="bdsName4"><span>上海至尊海龙湾大楼盘</span></h2>
                                    <p style="color: #80ff60">点击查看</p>
                                    <a id="bdsHref4" href="#">查看详情</a>
                                </figcaption>
                            </figure>
                        </div>

                    </div>
                    <%---楼盘5--%>
                    <div class="col-md-3"
                         style="width:260px;height:175px;background-color: white;margin-left:15px;">
                        <div class="grid" style="margin-left: 10px;">
                            <figure class="effect-apollo">
                                <img id="bdsSrc5" src="<%=path%>/public/images/ye/buildings-img/buildings03.jpg"
                                     style=""/>
                                <figcaption>
                                    <h2 id="bdsName5"><span>上海至尊海龙湾大楼盘</span></h2>
                                    <p style="color: #80ff60">点击查看</p>
                                    <a id="bdsHref5" href="#">查看详情</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <%---楼盘6--%>
                    <div class="col-md-3"
                         style="width:260px;height:175px;background-color: white;margin-left:15px;">
                        <div class="grid" style="margin-left: 10px;">
                            <figure class="effect-apollo">
                                <img id="bdsSrc6" src="<%=path%>/public/images/ye/buildings-img/buildings03.jpg"
                                     style=""/>
                                <figcaption>
                                    <h2 id="bdsName6"><span>上海至尊海龙湾大楼盘</span></h2>
                                    <p style="color: #80ff60">点击查看</p>
                                    <a id="bdsHref6" href="#">查看详情</a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
                <%--广告3--%>
                <div class="col-md-3" style="width:300px;height: 200px;">
                    <a id="adsHref3" href="javascript:void(0);">
                        <img id="adsSrc3" style="height:200px;" class="img-responsive"
                             src="/public/images/upload/act02.jpg"/>
                    </a>
                </div>
                <%--两个楼盘详情--%>
                <div class="row" style="margin-top: 20px;">
                    <%--bd7--%>
                    <div class="col-md-9" style="width:1200px;">
                        <div class="col-md-4" style="background-color: white;margin-left:25px;margin-top: 15px;">
                            <a id="bdsHref7" href="#">
                                <img id="bdsSrc7" src="<%=path%>/public/images/ye/buildings-img/buildings03.jpg"
                                     style="width: 310px;height: 200px;"/>
                            </a>
                        </div>
                        <div class="col-md-5"
                             style="background-color: white;height:200px;width:50%;margin-top: 15px;">
                            <!-- 右边文字-->
                            <div id="center7" style="float: left">
                                <div id="fontRight7" style="margin-top: 15px; margin-left: 10px;">
                                    <h5><a id="bdsName7" target="_blank" href="#">龙沐湾太阳城</a><b id="area7">&nbsp;&nbsp;[乐东
                                        - 九所新区]</b></h5>
                                </div>
                                <dl style="margin-top: 15px; margin-left: 10px;">
                                    <dd><em>位置：</em><span id="address7">乐东县西线高速龙沐湾旅游区入口</span></dd>
                                    <dd style="margin-top: 15px;"><em>户型：</em>
                                        <span id="houseName7">
                                                一房、二房
                                    </span>
                                    </dd>
                                    <dd style="margin-top: 15px;"><em>电话：</em><span
                                            id="tel7">400-900-1113转3118</span></dd>
                                    <dt style="margin-top: 15px;"><em></em>
                                        <span>
                                        <a id="pictureHref7" target="_blank" href="#">相册图（<span
                                                id="pictureCount7">30</span>）</a>
                                    </span>
                                    </dt>
                                </dl>

                                <%--<p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName7" title="">活跃经销商</a></p>--%>

                            </div>

                            <div id="right7" style="float: left;margin-left: 50px;margin-top: 15px;">
                                <span id="saleStatus7">销售中</span> &nbsp;&nbsp;

                                <ul style="margin-top: 6px; margin-left: 10px;">
                                    <li>开盘价：<b style="color: #e04a10" id="beginPrice7">5000</b>元/㎡</li>
                                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10"
                                                                        id="bdsPrice7">7000</b>元/㎡
                                    </li>
                                    <li style="margin-top: 15px;"><a id="mapHref7" target="_blank"
                                                                     href="#">查看电子地图</a></li>
                                    <li style="margin-top: 15px;">浏览数：<span id="viewCount7">99</span>，评论数：<span
                                            id="commentCount7">66</span></li>
                                    <li style="margin-top: 15px;">点赞数：<span id="likeCount7">999</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%--bd8--%>
                    <div class="col-md-9" style="width:1200px;">
                        <div class="col-md-4" style="background-color: white;margin-left:25px;margin-top: 25px">
                            <a id="bdsHref8" href="#">
                                <img id="bdsSrc8" src="<%=path%>/public/images/ye/buildings-img/buildings03.jpg"
                                     style="width: 310px;height: 200px;"/>
                            </a>
                        </div>
                        <div class="col-md-5"
                             style="background-color: white;height:200px;width:50%;margin-top: 25px">
                            <div id="center8" style="float: left">
                                <div id="fontRight8" style="margin-top: 15px; margin-left: 10px;">
                                    <h5><a id="bdsName8" target="_blank" href="#">龙沐湾太阳城</a><b id="area8">&nbsp;&nbsp;[乐东
                                        - 九所新区]</b></h5>
                                </div>
                                <dl style="margin-top: 15px; margin-left: 10px;">
                                    <dd><em>位置：</em><span id="address8">乐东县西线高速龙沐湾旅游区入口</span></dd>
                                    <dd style="margin-top: 15px;"><em>户型：</em>
                                        <span id="houseName8">
                                    一房、二房
                        </span>
                                    </dd>
                                    <dd style="margin-top: 15px;"><em>电话：</em><span
                                            id="tel8">400-900-1113转3118</span></dd>
                                    <dt style="margin-top: 15px;"><em></em>
                                        <span>
                            <a id="pictureHref8" target="_blank" href="#">相册图（<span id="pictureCount8">30</span>）</a>
                        </span>
                                    </dt>
                                </dl>

                                <%--<p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName8" title="">活跃经销商</a>--%>
                                </p>

                            </div>

                            <div id="right8" style="float: left;margin-left: 50px;margin-top: 15px;">
                                <span id="saleStatus8">销售中</span> &nbsp;&nbsp;

                                <ul style="margin-top: 6px; margin-left: 10px;">
                                    <li>开盘价：<b style="color: #e04a10" id="beginPrice8">5000</b>元/㎡</li>
                                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10"
                                                                        id="bdsPrice8">7000</b>元/㎡
                                    </li>
                                    <li style="margin-top: 15px;"><a id="mapHref8" target="_blank"
                                                                     href="#">查看电子地图</a></li>
                                    <li style="margin-top: 15px;">浏览数：<span id="viewCount8">99</span>，评论数：<span
                                            id="commentCount8">66</span></li>
                                    <li style="margin-top: 15px;">点赞数：<span id="likeCount8">999</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%--广告4--%>
                    <div class="col-md-3" style="width:150px;height: 200px;margin-left:88%;margin-top:-30%;">
                        <a id="adsHref4" href="javascript:void(0);">
                            <img id="adsSrc4" style="height:350px;width:80px;" class="img-responsive"
                                 src="/public/images/upload/act02.jpg"/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
