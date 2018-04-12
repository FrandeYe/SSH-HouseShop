<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/9/18
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>楼盘相册</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path %>/public/css/zhang/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="<%=path %>/public/css/zhang/zoomify.css"/>
    <style>
        .buildings {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .buildings li span {
            font-size: 14px;
        }

        .title {
            font-weight: bold;
        }

        .price {
            color: orange;
        }
    </style>
</head>
<body class="container">
<%--导航栏--%>
<div>
    <jsp:include page="../../include_page/top.jsp" flush="true"></jsp:include>
</div>
    <div style="margin-left: 20px;">
        <h3 >所属楼盘：</h3>
    </div>
    <div style="margin-left: 30px;">
        <h4 id="buildingsName">赣州技师学院</h4>
    </div>

<div class="container">

    <div class="row">
        <div class="col-lg-9">
            <div class="row examples">
                <div id="item0" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc0" src=""  class="img-responsive ">
                </div>
                <div id="item1" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc1" src=""  class="img-responsive ">
                </div>
                <div id="item2" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc2" src=""  class="img-responsive">
                </div>
                <div id="item3" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc3" src=""  class="img-responsive">
                </div>
            </div>

            <div class="row examples" style="margin-top: 15px;">
                <div id="item4" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc4" src=""  class="img-responsive ">
                </div>
                <div id="item5" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc5" src=""  class="img-responsive ">
                </div>
                <div id="item6" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc6" src=""  class="img-responsive">
                </div>
                <div id="item7" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc7" src=""  class="img-responsive">
                </div>
            </div>

            <div class="row" style="margin-top: 15px;">
                <div id="item8" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc8" src="" 
                         class="img-responsive">
                </div>
                <div id="item9" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc9" src="" 
                         class="img-responsive">
                </div>
                <div id="item10" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc10" src="" 
                         class="img-responsive">
                </div>
                <div id="item11" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc11" src="" 
                         class="img-responsive">
                </div>
            </div>

        </div>

        <div class="col-lg-3 col-sm-3 col-xs-3" style="background-color: #f1f1ff;left: 20px;">
            <ul id="sideMenu" style="list-style-type: none">
                <li id="current">
                    <h4>热门楼盘</h4>
                    <!--新开楼盘：开始-->
                    <div id="sideNewHouse sideBox">
                        <ul class="buildings">
                            <li><a href="#"><span class="title">龙沐湾太阳城</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;<span
                                    class="price">5000</span></a></li>

                            <li><a href="#"><span class="title">江南乐居</span>&nbsp;&nbsp;&nbsp;<span>乐东县城</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">7500</span></a></li>

                            <li><a href="#"><span class="title">龙栖湾盛和公馆</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;<span
                                    class="price">10000</span></a></li>

                            <li><a href="#"><span class="title">隆鑫诺亚方舟</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">8000</span></a></li>

                            <li><a href="#"><span class="title">龙栖湾波波</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">7000</span></a></li>

                            <li><a href="#"><span class="title">君海湾龙腾金街</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">6000</span></a></li>

                            <li><a href="#"><span class="title">美好龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">5000</span></a></li>

                            <li><a href="#"><span class="title">国信龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">7600</span></a></li>

                            <li><a href="#"><span class="title">龙溪雅居</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">7800</span></a></li>

                            <li><a href="#"><span class="title">中和龙沐湾</span>&nbsp;&nbsp;&nbsp;<span>九所新区</span>&nbsp;&nbsp;&nbsp;<span
                                    class="price">7900</span></a></li>
                        </ul>
                    </div>
                    <!--新开楼盘：结束-->
                </li>
            </ul>
        </div>
    </div>

    <%--分页开始--%>
    <div class="col-lg-offset-3">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a onclick="firstBuildingsImgPage();" href="#item0">首页（当前第<span id="currentPage">1</span>页）</a></li>
                <li id="lastLi"><a onclick="lastBuildingsImgPage();" href="#item0">上一页</a></li>
                <li id="nextLi"><a onclick="nextBuildingsImgPage();" href="#item0">下一页</a></li>
                <li><a onclick="finallyBuildingsImgPage();" href="#item0">尾页（总共<span id="totalPage">1</span>页）</a>
                </li>
            </ul>
        </nav>
    </div>
    <%--分页结束--%>

    <%--版权--%>
    <div>
        <jsp:include page="../../include_page/footer.jsp" flush="true"></jsp:include>
    </div>
</div>


<script type="text/javascript" src="<%=path %>/public/plugins/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/public/js/zhang/zoomify.js"></script>
<script type="text/javascript" src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script type="text/javascript" src="<%=path %>/public/js/lai/index_buildingsImg.js"></script>
<script type="text/javascript">
    $('.example img').zoomify();
    getAllBuildingsImgData('${requestScope.id}', 1);
</script>
</body>
</html>
