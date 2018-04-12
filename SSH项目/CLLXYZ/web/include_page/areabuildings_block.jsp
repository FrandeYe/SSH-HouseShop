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
<%-- 楼盘的筛选 --%>
<div class="row" style="margin-top: 50px;">
    <div class="col-md-12" style="height:410px;margin-top: 20px;background-color: rgba(220,220,220,0.4)">
        <%-- 区域筛选 --%>
        <div class="row">
            <div class="col-md-8">
                <div name="selectArea">
                    <div class="docs-methods">
                        <form class="form-inline">
                            <div id="distpicker">
                                <div class="col-md-6" style="width:500px;">
                                    <div class="form-group">
                                        <label class="sr-only" for="province">Province</label>
                                        <select disabled class="form-control" id="province"></select>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="city">City</label>
                                        <select disabled class="form-control" id="city"></select>
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="district">District</label>
                                        <select class="form-control" id="district" onchange="getAreaBuildings();"></select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group" style="margin-left:-5%;">
                                        <button class="btn btn-primary" type="button" onclick="getAreaBuildings();">筛选该区域的楼盘</button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div style="float:left;margin-left:30%;width:100px;text-align:center;background-color:#66CCFF;">
                    <a style="color: white"><h4>楼盘推荐</h4></a>
                </div>
                <div onmouseover="this.style.background='#FF6666'" onmouseout="this.style.background='#FF3333'"
                     style="float:left;margin-left:5%;width:100px;text-align:center;background-color:#FF3333;">
                    <a href="<%=path%>/buildings/showBuildings" style="color: white"><h4>更多楼盘</h4></a>
                </div>
            </div>
        </div>

        <%--热门楼盘--%>
        <div id="buildings-img" class="container"
             style=";height:300px;float: left;margin-left: -20px;margin-top: 20px;">

            <div class="row" style="margin-left:-1px;margin-top: -10px;">
                <%--bd0--%>
                <div id="buildings0" class="col-md-3"
                     style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                    <div class="grid" style="margin-left:-35px;">
                        <figure class="effect-selena">
                            <img id="bdsSrc0" title="楼盘" style="margin-top: 15px"
                                 src="/public/images/upload/buildings01.jpg" class="img-rounded img-responsive"/>
                            <figcaption>
                                <h2><span>热销中</span></h2>
                                <p><a style="font-size: 16px;color: #ffca14;">地址：</a><a id="address0" style="font-size: 18px;color: yellow"></a></p>
                                <a id="bdsHref0" href="#"></a>
                            </figcaption>
                            <h4><a id="bdsName0" href="#">楼盘01</a></h4>
                            <h6>平均价格：<strong><a id="bdsPrice0" style="color: red">5000</a></strong>元/㎡ 面积：<strong><a
                                    id="bdsArea0" style="color: red">10000</a></strong>㎡</h6>
                        </figure>
                    </div>
                </div>
                <%--bd1--%>
                <div id="buildings1" class="col-md-3"
                     style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                    <div class="grid" style="margin-left:-35px;">
                        <figure class="effect-selena">
                            <img id="bdsSrc1" title="楼盘" style="margin-top: 15px"
                                 src="/public/images/upload/buildings01.jpg" class="img-rounded img-responsive"/>
                            <figcaption>
                                <h2><span>热销中</span></h2>
                                <p><a style="font-size: 16px;color: #ffca14;">地址：</a><a id="address1" style="font-size: 18px;color: yellow"></a></p>
                                <a id="bdsHref1" href="#"></a>
                            </figcaption>
                            <h4><a id="bdsName1" href="#">楼盘01</a></h4>
                            <h6>平均价格：<strong><a id="bdsPrice1" style="color: red">5000</a></strong>元/㎡ 面积：<strong><a
                                    id="bdsArea1" style="color: red">10000</a></strong>㎡</h6>
                        </figure>
                    </div>
                </div>
                <%--bd2--%>
                <div id="buildings2" class="col-md-3"
                     style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                    <div class="grid" style="margin-left:-35px;">
                        <figure class="effect-selena">
                            <img id="bdsSrc2" title="楼盘" style="margin-top: 15px"
                                 src="/public/images/upload/buildings01.jpg" class="img-rounded img-responsive"/>
                            <figcaption>
                                <h2><span>热销中</span></h2>
                                <p><a style="font-size: 16px;color: #ffca14;">地址：</a><a id="address2" style="font-size: 18px;color: yellow"></a></p>
                                <a id="bdsHref2" href="#"></a>
                            </figcaption>
                            <h4><a id="bdsName2" href="#">楼盘01</a></h4>
                            <h6>平均价格：<strong><a id="bdsPrice2" style="color: red">5000</a></strong>元/㎡ 面积：<strong><a
                                    id="bdsArea2" style="color: red">10000</a></strong>㎡</h6>
                        </figure>
                    </div>
                </div>
                <%--bd3--%>
                <div id="buildings3" class="col-md-3"
                     style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                    <div class="grid" style="margin-left:-35px;">
                        <figure class="effect-selena">
                            <img id="bdsSrc3" title="楼盘" style="margin-top: 15px"
                                 src="/public/images/upload/buildings01.jpg" class="img-rounded img-responsive"/>
                            <figcaption>
                                <h2><span>热销中</span></h2>
                                <p><a style="font-size: 16px;color: #ffca14;">地址：</a><a id="address3" style="font-size: 18px;color: yellow"></a></p>
                                <a id="bdsHref3" href="#"></a>
                            </figcaption>
                            <h4><a id="bdsName3" href="#">楼盘01</a></h4>
                            <h6>平均价格：<strong><a id="bdsPrice3" style="color: red">5000</a></strong>元/㎡ 面积：<strong><a
                                    id="bdsArea3" style="color: red">10000</a></strong>㎡</h6>
                        </figure>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
</body>
</html>
