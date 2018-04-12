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
<%--活动的区域--%>
<div class="row">
    <div id="building-activities" sty class="col-lg-12 col-md-12  col-sm-4 "
         style="background-color: rgba(220,220,220,0.4); margin-top: 30px;height:400px;">
        <div id="" class="container">
            <div class="row" style="margin-left: 15px;">
                <div class="col-md-8" style="background-color: white;margin-top: 15px;height: 360px;">
                    <div class="row">
                        <div class="col-md-6" onmouseover="this.style.background='#6eb9ff'"
                             onmouseout="this.style.background='#0099CC'"
                             style="height:35px;width:375px;margin-top:0px;background-color: #0099CC;text-align: center;">
                            <a style="color: white" href="<%=path%>/article/showArticles"><h4>文章推荐</h4></a>
                        </div>
                        <div class="col-md-6" onmouseover="this.style.background='#00CCCC'"
                             onmouseout="this.style.background='#00CC99'"
                             style="height:35px;width:375px;margin-top:0px;background-color: #00CC99;text-align: center;margin-left:9px;">
                            <a style="color: white" href="<%=path%>/article/showArticles"><h4>更多文章和资讯</h4></a>
                        </div>
                    </div>
                    <div class="row">
                        <ul id="ulArticle">
                            <li style="line-height:2"><a id="article0" style="font-size: 16px;" href="#">手把手教建行股份广告费你买房</a>
                            </li>
                            <li style="line-height:2"><a id="article1" style="font-size: 16px;" href="#">手把手激活国服封测教你买房</a>
                            </li>
                            <li style="line-height:2"><a id="article2" style="font-size: 16px;" href="#">手把你还不够v非常手教你买房</a>
                            </li>
                            <li style="line-height:2"><a id="article3" style="font-size: 16px;" href="#">手把手教你胡歌封帝买房</a>
                            </li>
                            <li style="line-height:2"><a id="article4" style="font-size: 16px;"
                                                         href="#">手把手教你买房</a></li>
                            <li style="line-height:2"><a id="article5" style="font-size: 16px;"
                                                         href="#">手把手教你买房</a></li>
                            <li style="line-height:2"><a id="article6" style="font-size: 16px;"
                                                         href="#">手把手教你买房</a></li>
                            <li style="line-height:2"><a id="article7" style="font-size: 16px;"
                                                         href="#">手把手教你买房</a></li>
                            <li style="line-height:2"><a id="article8" style="font-size: 16px;"
                                                         href="#">手把手教你买房</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="text-align:center;">
                            <a style="font-size:16px;color: #7cc0ff" href="<%=path%>/article/showArticles">---获取更多---</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"
                     style="background-color:white;height:360px;width:300px;margin-left:25px;margin-top: 15px;">
                    <div class="row" style="margin-top:35px;">
                        <div class="col-md-12" onmouseover="this.style.background='#FF6666'"
                             onmouseout="this.style.background='#FF0033'"
                             style="height:35px;width:300px;margin-top:-35px;background-color: #FF0033;text-align: center;">
                            <a style="color: white" href="<%=path%>/activity/showActivities"><h4>更多活动</h4></a>
                        </div>
                        <div class="col-md-12" style="height:150px;width:330px;margin-left:-15px;">
                            <a id="actHref0" href="#">
                                <img id="actSrc0" src="<%=path%>/public/images/ye/buildings-img/buildings01.jpg"
                                     style="width:300px;height:150px; " class="img-responsive"/>
                            </a>
                        </div>
                        <div class="col-md-12" style="height:150px;width:330px;margin-left:-15px;">
                            <a id="actHref1" href="#">
                                <img id="actSrc1" src="<%=path%>/public/images/ye/buildings-img/buildings01.jpg"
                                     style="width:300px;height:150px;margin-top: 25px; " class="img-responsive"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
