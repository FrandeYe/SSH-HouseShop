<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 15:59
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
<body>
<%--导航栏--%>
</div>
<h5>所属楼盘：</h5><h3 id="buildingsName">赣州技师学院</h3>
<div class="container">

    <div class="row">
        <div class="col-lg-9">
            <div class="row examples">
                <div id="item0" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc0" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive ">
                </div>
                <div id="item1" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc1" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive ">
                </div>
                <div id="item2" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc2" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive">
                </div>
                <div id="item3" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc3" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive">
                </div>
            </div>

            <div class="row examples">
                <div id="item4" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc4" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive ">
                </div>
                <div id="item5" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc5" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive ">
                </div>
                <div id="item6" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc6" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive">
                </div>
                <div id="item7" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc7" src="<%=path%>/public/images/zhang/9799015.jpg" alt="..." class="img-responsive">
                </div>
            </div>

            <div class="row" style="margin-top: 15px;">
                <div id="item8" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc8" src="<%=path%>/public/images/zhang/1881ac2b7e35e835bee856d142df6c81.jpg" alt="..."
                         class="img-responsive">
                </div>
                <div id="item9" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc9" src="<%=path%>/public/images/zhang/1881ac2b7e35e835bee856d142df6c81.jpg" alt="..."
                         class="img-responsive">
                </div>
                <div id="item10" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc10" src="<%=path%>/public/images/zhang/1881ac2b7e35e835bee856d142df6c81.jpg" alt="..."
                         class="img-responsive">
                </div>
                <div id="item11" class="example col-xs-6 col-md-3 col-lg-3">
                    <img id="logoSrc11" src="<%=path%>/public/images/zhang/1881ac2b7e35e835bee856d142df6c81.jpg" alt="..."
                         class="img-responsive">
                </div>
            </div>

        </div>
    </div>

    <%--分页开始--%>
    <div class="col-lg-offset-3">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a onclick="firstBuildingsImgPage();" href="#item0">首页（当前第<span id="currentPage">1</span>页）</a></li>
                <li id="lastLi"><a onclick="lastBuildingsImgPage();" href="#item0">上一页</a></li>
                <li id="nextLi"><a onclick="nextBuildingsImgPage();" href="#item0">下一页</a></li>
                <li><a onclick="finallyBuildingsImgPage();" href="#item0">尾页（总共<span id="totalPage">2</span>页）</a>
                </li>
            </ul>
        </nav>
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

