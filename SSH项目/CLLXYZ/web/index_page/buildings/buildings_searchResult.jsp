<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/9/14
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>房产网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <style>
        .buildings {
            list-style-type: none;
            margin:0;
            padding:0;
        }

        .buildings li span {
            font-size:14px;
        }

        .title {
            font-weight:bold;
        }

        .price {
            color:orange;
        }
    </style>
</head>
<body>

<div class="container">
    <%--导航栏--%>
    <div>
        <jsp:include page="../../include_page/top.jsp" flush="true"></jsp:include>
    </div>
    <div class="row" id="row0">
        <!-- 一行占9列-->
        <div class="col-lg-9 col-sm-9 col-xs-9" style="background-color:#f1f1ff">
            <!-- 左边大图-->
            <div id="left0" style="float: left">
                <div>
                    <div><a id="logoHref0" href="#"><img id="logoSrc0" src="<%=path%>/public/images/house/63621c.png"
                              style="width:287px;height: 187px;margin-top: 10px;margin-bottom: 10px;"></a></div>
                </div>
            </div>

            <!-- 右边文字-->
            <div id="center0" style="float: left">
                <div id="fontRight0" style="margin-top: 15px; margin-left: 10px;">
                    <h5><a id="name0" target="_blank" href="#"></a>&nbsp;&nbsp;<b id="area0"></b></h5>
                </div>
                <dl style="margin-top: 15px; margin-left: 10px;">
                    <dd><em>位置：</em><span id="address0"></span></dd>
                    <dd style="margin-top: 15px;"><em>户型：</em>
                        <span id="houseName0"></span>
                    </dd>
                    <dd style="margin-top: 15px;"><em>电话：</em><span id="tel0"></span></dd>
                    <dt style="margin-top: 15px;"><em></em>
                        <span>
                            <a id="pictureHref0" target="_blank" href="#">相册图（<span id="pictureCount0">30</span>）</a>
                        </span>
                    </dt>
                </dl>

                <p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName0" title=""></a></p>

            </div>

            <div id="right0" style="float: left;margin-left: 50px;margin-top: 15px;">
                <span id="saleStatus0"></span> &nbsp;&nbsp;

                <ul style="margin-top: 6px; margin-left: 10px;">
                    <li>开盘价：<b style="color: #e04a10" id="beginPrice0"></b>元/㎡</li>
                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10" id="meanPrice0">7000</b>元/㎡</li>
                    <li style="margin-top: 15px;"><a id="mapHref0" target="_blank" href="#">查看电子地图</a></li>
                    <li style="margin-top: 15px;">浏览数：<span id="viewCount0"></span>，评论数：<span id="commentCount0"></span></li>
                    <li style="margin-top: 15px;">点赞数：<span id="likeCount0"></span></li>
                </ul>
            </div>
        </div>
        <!-- 一行占3列 -->
        <div class="col-lg-3 col-sm-3 col-xs-3" style="background-color: #f1f1ff;left: 20px;">
            <ul id="sideMenu" style="list-style-type: none">
                <li id="current">
                    <h4>热门楼盘</h4>
                    <!--新开楼盘：开始-->
                    <div id="sideNewHouse sideBox">
                        <ul class="buildings">
                            <li><a href="#"><span class="title"></span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;<span class="price">5000</span></a></li>

                            <li><a href="#"><span class="title">江南乐居</span>&nbsp;&nbsp;&nbsp;<span>乐东县城</span>&nbsp;&nbsp;&nbsp;<span class="price">7500</span></a></li>

                            <li><a href="#"><span class="title">龙栖湾盛和公馆</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;<span class="price">10000</span></a></li>

                            <li><a href="#"><span class="title">隆鑫诺亚方舟</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">8000</span></a></li>

                            <li><a href="#"><span class="title">龙栖湾波波</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">7000</span></a></li>

                            <li><a href="#"><span class="title">君海湾龙腾金街</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">6000</span></a></li>

                            <li><a href="#"><span class="title">美好龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">5000</span></a></li>

                            <li><a href="#"><span class="title">国信龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">7600</span></a></li>

                            <li><a href="#"><span class="title">龙溪雅居</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">7800</span></a></li>

                            <li><a href="#"><span class="title">中和龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span class="price">7900</span></a></li>
                        </ul>
                    </div>
                    <!--新开楼盘：结束-->
                </li>
            </ul>
        </div>
    </div>

    <div class="row" id="row1" >
        <div class="col-lg-9 col-sm-9 col-xs-9" style="background-color:#f1f1ff">
            <!-- 左边大图-->
            <div id="left1" style="float: left">
                <div>
                    <div><a id="logoHref1" href="#"><img id="logoSrc1" src="<%=path%>/public/images/house/63621c.png"
                                                         style="width:287px;height: 187px;margin-top: 10px;margin-bottom: 10px;"></a></div>
                </div>
            </div>

            <!-- 右边文字-->
            <div id="center1" style="float: left">
                <div id="fontRight1" style="margin-top: 15px; margin-left: 10px;">
                    <h5><a id="name1" target="_blank" href="#"></a><b id="area1">&nbsp;&nbsp;</b></h5>
                </div>
                <dl style="margin-top: 15px; margin-left: 10px;">
                    <dd><em>位置：</em><span id="address1"></span></dd>
                    <dd style="margin-top: 15px;"><em>户型：</em>
                        <span id="houseName1">
                                    一房、二房
                        </span>
                    </dd>
                    <dd style="margin-top: 15px;"><em>电话：</em><span id="tel1"></span></dd>
                    <dt style="margin-top: 15px;"><em></em>
                        <span>
                            <a id="pictureHref1" target="_blank" href="#">相册图（<span id="pictureCount1">30</span>）</a>
                        </span>
                    </dt>
                </dl>

                <p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName1" title=""></a></p>

            </div>

            <div id="right1" style="float: left;margin-left: 50px;margin-top: 15px;">
                <span id="saleStatus1"></span> &nbsp;&nbsp;

                <ul style="margin-top: 6px; margin-left: 10px;">
                    <li>开盘价：<b style="color: #e04a10" id="beginPrice1"></b>元/㎡</li>
                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10" id="meanPrice1">7000</b>元/㎡</li>
                    <li style="margin-top: 15px;"><a id="mapHref1" target="_blank" href="#">查看电子地图</a></li>
                    <li style="margin-top: 15px;">浏览数：<span id="viewCount1"></span>，评论数：<span id="commentCount1"></span></li>
                    <li style="margin-top: 15px;">点赞数：<span id="likeCount1"></span></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row" id="row2" style="margin-top:15px;">
        <div class="col-lg-9 col-sm-9 col-xs-9" style="background-color:#f1f1ff">
            <!-- 左边大图-->
            <div id="left2" style="float: left">
                <div>
                    <div><a id="logoHref2" href="#"><img id="logoSrc2" src="<%=path%>/public/images/house/63621c.png"
                                                         style="width:287px;height: 187px;margin-top: 10px;margin-bottom: 10px;"></a></div>
                </div>
            </div>

            <!-- 右边文字-->
            <div id="center2" style="float: left">
                <div id="fontRight2" style="margin-top: 15px; margin-left: 10px;">
                    <h5><a id="name2" target="_blank" href="#"></a><b id="area2">&nbsp;&nbsp;</b></h5>
                </div>
                <dl style="margin-top: 15px; margin-left: 10px;">
                    <dd><em>位置：</em><span id="address2"></span></dd>
                    <dd style="margin-top: 15px;"><em>户型：</em>
                        <span id="houseName2">
                                    一房、二房
                        </span>
                    </dd>
                    <dd style="margin-top: 15px;"><em>电话：</em><span id="tel2"></span></dd>
                    <dt style="margin-top: 15px;"><em></em>
                        <span>
                            <a id="pictureHref2" target="_blank" href="#">相册图（<span id="pictureCount2">30</span>）</a>
                        </span>
                    </dt>
                </dl>

                <p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName2" title=""></a></p>

            </div>

            <div id="right2" style="float: left;margin-left: 50px;margin-top: 15px;">
                <span id="saleStatus2"></span> &nbsp;&nbsp;

                <ul style="margin-top: 6px; margin-left: 10px;">
                    <li>开盘价：<b style="color: #e04a10" id="beginPrice2"></b>元/㎡</li>
                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10" id="meanPrice2">7000</b>元/㎡</li>
                    <li style="margin-top: 15px;"><a id="mapHref2" target="_blank" href="#">查看电子地图</a></li>
                    <li style="margin-top: 15px;">浏览数：<span id="viewCount2"></span>，评论数：<span id="commentCount2"></span></li>
                    <li style="margin-top: 15px;">点赞数：<span id="likeCount2"></span></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row" id="row3" style="margin-top:15px;">
        <div class="col-lg-9 col-sm-9 col-xs-9" style="background-color:#f1f1ff">
            <!-- 左边大图-->
            <div id="left3" style="float: left">
                <div>
                    <div><a id="logoHref3" href="#"><img id="logoSrc3" src="<%=path%>/public/images/house/63621c.png"
                                                         style="width:287px;height: 187px;margin-top: 10px;margin-bottom: 10px;"></a></div>
                </div>
            </div>

            <!-- 右边文字-->
            <div id="center3" style="float: left">
                <div id="fontRight3" style="margin-top: 15px; margin-left: 10px;">
                    <h5><a id="name3" target="_blank" href="#"></a><b id="area3">&nbsp;&nbsp;</b></h5>
                </div>
                <dl style="margin-top: 15px; margin-left: 10px;">
                    <dd><em>位置：</em><span id="address3"></span></dd>
                    <dd style="margin-top: 15px;"><em>户型：</em>
                        <span id="houseName3">
                                    一房、二房
                        </span>
                    </dd>
                    <dd style="margin-top: 15px;"><em>电话：</em><span id="tel3"></span></dd>
                    <dt style="margin-top: 15px;"><em></em>
                        <span>
                            <a id="pictureHref3" target="_blank" href="#">相册图（<span id="pictureCount3">30</span>）</a>
                        </span>
                    </dt>
                </dl>

                <p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName3" title=""></a></p>

            </div>

            <div id="right3" style="float: left;margin-left: 50px;margin-top: 15px;">
                <span id="saleStatus3"></span> &nbsp;&nbsp;

                <ul style="margin-top: 6px; margin-left: 10px;">
                    <li>开盘价：<b style="color: #e04a10" id="beginPrice3"></b>元/㎡</li>
                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10" id="meanPrice3">7000</b>元/㎡</li>
                    <li style="margin-top: 15px;"><a id="mapHref3" target="_blank" href="#">查看电子地图</a></li>
                    <li style="margin-top: 15px;">浏览数：<span id="viewCount3"></span>，评论数：<span id="commentCount3"></span></li>
                    <li style="margin-top: 15px;">点赞数：<span id="likeCount3"></span></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row" id="row4" style="margin-top:15px;">
        <div class="col-lg-9 col-sm-9 col-xs-9" style="background-color:#f1f1ff">
            <!-- 左边大图-->
            <div id="left4" style="float: left">
                <div>
                    <div><a id="logoHref4" href="#"><img id="logoSrc4" src="<%=path%>/public/images/house/63621c.png"
                                                         style="width:287px;height: 187px;margin-top: 10px;margin-bottom: 10px;"></a></div>
                </div>
            </div>

            <!-- 右边文字-->
            <div id="center4" style="float: left">
                <div id="fontRight4" style="margin-top: 15px; margin-left: 10px;">
                    <h5><a id="name4" target="_blank" href="#"></a><b id="area4">&nbsp;&nbsp;</b></h5>
                </div>
                <dl style="margin-top: 15px; margin-left: 10px;">
                    <dd><em>位置：</em><span id="address4"></span></dd>
                    <dd style="margin-top: 15px;"><em>户型：</em>
                        <span id="houseName4">
                                    一房、二房
                        </span>
                    </dd>
                    <dd style="margin-top: 15px;"><em>电话：</em><span id="tel4"></span></dd>
                    <dt style="margin-top: 15px;"><em></em>
                        <span>
                            <a id="pictureHref4" target="_blank" href="#">相册图（<span id="pictureCount4">30</span>）</a>
                        </span>
                    </dt>
                </dl>

                <p style="margin-left: 10px;">所属经销商：<a href="#" id="agencyName4" title=""></a></p>

            </div>

            <div id="right4" style="float: left;margin-left: 50px;margin-top: 15px;">
                <span id="saleStatus4"></span> &nbsp;&nbsp;

                <ul style="margin-top: 6px; margin-left: 10px;">
                    <li>开盘价：<b style="color: #e04a10" id="beginPrice4"></b>元/㎡</li>
                    <li style="margin-top: 15px;">均价：<b style="color: #e04a10" id="meanPrice4">7000</b>元/㎡</li>
                    <li style="margin-top: 15px;"><a id="mapHref4" target="_blank" href="#">查看电子地图</a></li>
                    <li style="margin-top: 15px;">浏览数：<span id="viewCount4"></span>，评论数：<span id="commentCount4"></span></li>
                    <li style="margin-top: 15px;">点赞数：<span id="likeCount4"></span></li>
                </ul>
            </div>
        </div>
    </div>
    <%--分页开始--%>
    <div class="col-lg-offset-3">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a onclick="getSearchBuildings(1);" href="#row0">首页（当前第<span id="buildingsCurrentPage">1</span>页）</a></li>
                <li id="lastLi"><a onclick="lastBuildingsSearchPage();" href="#row0">上一页</a></li>
                <li id="nextLi"><a onclick="nextBuildingsSearchPage();" href="#row0">下一页</a></li>
                <li><a onclick="finallyBuildingsSearchPage();" href="#row0">尾页（总共<span id="buildingsTotalPage">2</span>页）</a></li>
            </ul>
        </nav>
    </div>
    <%--分页结束--%>

    <%--版权--%>
    <div>
        <jsp:include page="../../include_page/footer.jsp" flush="true"></jsp:include>
    </div>

</div>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<script src="<%=path %>/public/js/lai/index_buildings.js"></script>

<script>
    $(function () {
        getSearchBuildings(1);
    });
</script>
</body>
</html>
