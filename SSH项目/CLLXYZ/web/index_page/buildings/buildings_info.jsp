<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/9/8
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>楼盘详情</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css"/>

    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/captcha.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/page.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/index-9e0419319f91c558c881.css">
    <%--<link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/Aifang_Web_Loupan_View_ArticleView.css">--%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/detail.css">

    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/main.css">
    <link rel="stylesheet" href="<%=path %>/public/css/ye/index-css/sweet-alert.css"/>
</head>
<body class="container" style="height: auto;">

<div>
    <jsp:include page="../../include_page/top.jsp" flush="true"></jsp:include>
</div>

<!--导航条-->
<div class="pageHeadNavWrap">
    <div class="pin-wrapper" style="height: 42px;">
        <div class="wrap sideFix" style="wilih: 1200px;">
            <div class="pageHeadNav">
                <ul id="buildings_ul" style="list-style: none">
                    <li class="active">
                        <a href="javascript:void(0);">楼盘详情</a>
                    </li>

                    <li><a href="javascript:void(0);" target="_self" data-toggle="modal"
                           data-target="#myModal">户型图(<span id="houseCount"></span>)</a></li>
                    <li><a id="buildingsImg" href="javascript:void(0);" target="_blank">楼盘图片（<span
                            id="imgCount">66</span>）</a></li>
                    <li><a id="buildingsMap" href="javascript:void(0);" target="_blank">楼盘地图</a></li>
                    <img style="height: 40px; width: 40px" id="likeImg"
                         onclick="changeLikeStatus('${sessionScope.user.id}');"
                         src="<%=path %>/public/images/xie/noLike.jpg" title="如果喜欢就点个赞吧！"/>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <strong>户型图</strong>
            </div>
            <div id="housePicture" class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="pageMainWrap">
    <div class="wrap">
        <div class="pageMainHead clearfix">
            <!--幻灯：开始-->
            <div id="pagePic_tab" class="pagePic_tab clearfix">

                <div class="box_tab">
                    <ul style="position: relative; wilih: 520px; height: 338px;">
                        <li style="position: absolute; wilih: 520px; left: 0px; top: 0px;"><a
                                href="javascript:void(0);">
                            <img id="logoSrc" src="<%=path%>/public/images/upload/default_buildings_logo.jpg"
                                 wilih="520" height="380"></a></li>
                    </ul>
                </div>
            </div>
            <div class="pageParameter">
                <div class="col-md-6">
                    楼盘名称：<span id="name"></span>
                </div>
                <div class="col-md-6">
                    所属商家：<a id="agencyName" href="javascript:void(0);"></a></span>
                </div>
                <div class="col-md-6">
                    所属区域：<span id="area"></span>
                </div>
                <div class="col-md-6">
                    地址：<span id="address"></span>
                </div>
                <div class="col-md-6">
                    占地面积：<span id="floor_area"></span>
                </div>
                <div class="col-md-6">
                    建筑面积：<span id="building_area"></span>
                </div>
                <div class="col-md-6">
                    房源类型：<span id="house_type"></span>
                </div>
                <div class="col-md-6">
                    建筑类型：<span id="building_type"></span>
                </div>
                <div class="col-md-6">
                    经度：<span id="longitude"></span>,纬度：<span id="latitude"></span>
                </div>
                <div class="col-md-6">
                    楼盘均价：<span id="avg_price"></span>
                </div>
                <div class="col-md-6">
                    开发公司：<span id="company"></span>
                </div>
                <div class="col-md-6">
                    开盘时间：<span id="saleStatus"></span>
                </div>
                <div class="col-md-6">
                    总套数：<span id="total_rooms"></span>
                </div>
                <div class="col-md-6">
                    接待地址：<span id="reception_address"></span>
                </div>
                <div class="col-md-6">
                    楼盘售楼电话：<span id="tel"></span>
                </div>
                <div class="col-md-6">
                    绿化率：<span id="green_ratio"></span>
                </div>
                <div class="col-md-6">
                    容积率：<span id="plot_ratio"></span>
                </div>
                <div class="col-md-6">
                    物业公司：<span id="property_company"></span>
                </div>
                <div class="col-md-6">
                    物业费：<span id="property_fee"></span>
                </div>
                <div class="col-md-6">
                    车位数：<span id="car_station"></span>
                </div>
                <div class="col-md-6">
                    交通状况：<span id="traffic"></span>
                </div>
                <div class="col-md-6">
                    周边配套：<span id="equipments"></span>
                </div>
                <div class="col-md-6">
                    已有户型：<span id="houseName"></span>
                </div>
                <div class="col-md-6">
                    访客量：<span id="viewCount"></span>
                </div>
                <div class="col-md-6">
                    点赞数：<span id="likeCount"></span>
                </div>
                <div class="col-md-6">
                    简介：<span id="intro"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--评论导航条-->
<div id="detailNav" class="">
    <div class="detail-nav">
        <a href="javascript:void(0);" data-anchor="#prop-vip" onclick="showComment();" data-page="loupanxiangqing"
           class="">评论（<span id="commentCount"></span>）</a>

        <a href="javascript:void(0);" data-anchor="#prop-types"
           onclick="showMessage('${requestScope.id}', '${sessionScope.user.id}');" data-page="loupanxiangqing"
           data-fa="pclp039" class="">留言（<span id="messageCount"></span>）</a>

    </div>
</div>

<!--楼盘介绍-->
<div class="modal fade" id="myModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <strong><h6 class="modal-title" id="buildings">户型图</h6></strong>
            </div>
            <div class="modal-body">
                <img src="<%=path %>/public/images/xie/buildings_index.jpg"/>
                <img src="<%=path %>/public/images/xie/builsing_index2.jpg"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!--评论的div-->
<div class="louPanNews hasbd" id="commentDiv">
    <div class="form-group">
        <textarea id="commentContent" cols="60" rows="10" class="form-control" placeholder="在此输入您的评论:"></textarea>
        <a onclick="submitComment('${sessionScope.user.id}');" class="btn btn-primary btn-block">提交</a>
    </div>
    <ul id="commentUl" class="louPanNews-list">
        <c:forEach begin="0" end="9" var="i">
            <li id="commentLi${i}">
                <strong id="userName${i}"></strong>：<span id="commentContent${i}"></span>
                <span id="commentTime${i}" class="list-time"></span>
            </li>
        </c:forEach>
    </ul>
    <%--<button id="loadCommentBtn" onclick="loadAllComment();" class="btn btn-primary btn-block">点击加载全部评论</button>--%>
</div>

<!--留言的div，如果用户没有登入，是看不到留言的，也无法留言-->
<div class="louPanNews hasbd" id="loginMessage">
    <div class="form-group">
        <textarea id="messageContent" cols="60" rows="10" class="form-control" placeholder="在此输入您的留言:"></textarea>
        <a onclick="submitMessage('${sessionScope.user.id}');" class="btn btn-primary btn-block">提交</a>
    </div>
    <ul class="louPanNews-list">
        <c:forEach begin="0" end="9" var="i">
            <div id="messageDiv${i}">
                <span id="leave_time${i}" class="list-time"></span>
                <strong id="msgUserName${i}"></strong>：<span id="msgContent${i}"></span>
                <br/>
                <div style="margin-left: 80px;">
                    <strong id="msgAgencyName${i}"></strong><b>-回复：</b><span id="reply${i}"></span>
                    <span id="reply_time${i}" class="list-time"></span>
                </div>
            </div>
        </c:forEach>
    </ul>
</div>

<!-- 版权-->
<div class="container-fluid">

    <div style="text-align: center;margin-top: 5px;">
        <ul class="list-inline">
            <li><a>关于我们</a></li>
            <li><a>联系我们</a></li>
            <li><a>招贤纳士</a></li>
            <li><a>法律声明</a></li>
            <li><a>友情链接</a></li>
            <li><a>支付方式</a></li>
            <li><a>服务声明</a></li>
            <li><a>广告声明</a></li>
        </ul>
    </div>
    <hr style="margin-left:410px;height: 1px;background-color: black; width: 500px;">
    <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
        Copyright &copy; 2005-2017 版权所有，翻版必究！
    </div>
</div>
<%--浮动条--%>
<div id="float_bar">
    <jsp:include page="/include_page/float_bar.jsp" flush="true"></jsp:include>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/ye/index-js/sweet-alert.js"></script>

<script src="<%=path%>/public/js/xie/index_buildingsInfo.js"></script>

<script>
    $(function () {
        showComment();
        getBuildingsInfo('${requestScope.id}');
        getHouseImg('${requestScope.id}');
        getComment('${requestScope.id}', 10);
    });
</script>
</body>
</html>
