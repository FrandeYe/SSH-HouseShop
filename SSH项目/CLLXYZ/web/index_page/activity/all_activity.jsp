<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/9/8
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>显示活动</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/public.css">
    <link rel="stylesheet" href="<%=path%>/public/css/xie/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/css.css">
    <link rel="icon" href="<%=path %>/public/css/xie/public.css" type="text/css"/>

    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <%--<link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>--%>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>

</head>
<body>
<div class="container" style="height: auto;">


    <%--导航栏--%>
        <div>
            <jsp:include page="/include_page/top.jsp" flush="true"></jsp:include>
        </div>

    <div id="caseList" class="bg-gray">
        <div class="alllist w1200">
            <div class="activity clearfix mt20">

                <div class="right_cont fr" style="margin-right: 250px;">
                    <div class="activity_list">
                        <dl class="clearfix" id="item0">
                            <dt class="fl pr">
                                <a id="logoHref0" href="javascript:void(0);"
                                   target="_blank"><img id="logoSrc0"
                                                        src="<%=path%>/public/images/xie/activity/11.jpg"/></a>
                            </dt>
                            <dd class="fr pr">
                                <h2><a id="title0" href="" target="_blank">活动名称</a></h2>
                                <div class="xq">
                                    <p>开始时间：<span id="start_time0">2017-09-15</span></p>
                                    <p>结束时间：<span id="end_time0">2071-09-20</span></p>
                                    <p>活动地址：<span id="address0">江西赣州章贡区分水岭</span></p>
                                    <p>所属楼盘：<a href="javascript:void(0);" id="buildingsName0">地球村</a></p>
                                    <p>所属商家：<a href="javascript:void(0);" id="agencyName0">活跃经销商</a></p>
                                </div>
                            </dd>
                        </dl>
                        <dl class="clearfix" id="item1">
                            <dt class="fl pr">
                                <a id="logoHref1" href="javascript:void(0);"
                                   target="_blank"><img id="logoSrc1"
                                                        src="<%=path%>/public/images/xie/activity/11.jpg"/></a>
                            </dt>
                            <dd class="fr pr">
                                <h2><a id="title1" href="" target="_blank">活动名称</a></h2>
                                <div class="xq">
                                    <p>开始时间：<span id="start_time1">2017-09-15</span></p>
                                    <p>结束时间：<span id="end_time1">2071-09-20</span></p>
                                    <p>活动地址：<span id="address1">江西赣州章贡区分水岭</span></p>
                                    <p>所属楼盘：<a href="javascript:void(0);" id="buildingsName1">地球村</a></p>
                                    <p>所属商家：<a href="javascript:void(0);" id="agencyName1">活跃经销商</a></p>
                                </div>
                            </dd>
                        </dl>
                        <dl class="clearfix" id="item2">
                            <dt class="fl pr">
                                <a id="logoHref2" href="javascript:void(0);"
                                   target="_blank"><img id="logoSrc2"
                                                        src="<%=path%>/public/images/xie/activity/11.jpg"/></a>
                            </dt>
                            <dd class="fr pr">
                                <h2><a id="title2" href="" target="_blank">活动名称</a></h2>
                                <div class="xq">
                                    <p>开始时间：<span id="start_time2">2017-09-15</span></p>
                                    <p>结束时间：<span id="end_time2">2071-09-20</span></p>
                                    <p>活动地址：<span id="address2">江西赣州章贡区分水岭</span></p>
                                    <p>所属楼盘：<a href="javascript:void(0);" id="buildingsName2">地球村</a></p>
                                    <p>所属商家：<a href="javascript:void(0);" id="agencyName2">活跃经销商</a></p>
                                </div>
                            </dd>
                        </dl>
                        <dl class="clearfix" id="item3">
                            <dt class="fl pr">
                                <a id="logoHref3" href="javascript:void(0);"
                                   target="_blank"><img id="logoSrc3"
                                                        src="<%=path%>/public/images/xie/activity/11.jpg"/></a>
                            </dt>
                            <dd class="fr pr">
                                <h2><a id="title3" href="" target="_blank">活动名称</a></h2>
                                <div class="xq">
                                    <p>开始时间：<span id="start_time3">2017-09-15</span></p>
                                    <p>结束时间：<span id="end_time3">2071-09-20</span></p>
                                    <p>活动地址：<span id="address3">江西赣州章贡区分水岭</span></p>
                                    <p>所属楼盘：<a href="javascript:void(0);" id="buildingsName3">地球村</a></p>
                                    <p>所属商家：<a href="javascript:void(0);" id="agencyName3">活跃经销商</a></p>
                                </div>
                            </dd>
                        </dl>
                        <dl class="clearfix" id="item4">
                            <dt class="fl pr">
                                <a id="logoHref4" href="javascript:void(0);"
                                   target="_blank"><img id="logoSrc4"
                                                        src="<%=path%>/public/images/xie/activity/11.jpg"/></a>
                            </dt>
                            <dd class="fr pr">
                                <h2><a id="title4" href="" target="_blank">活动名称</a></h2>
                                <div class="xq">
                                    <p>开始时间：<span id="start_time4">2017-09-15</span></p>
                                    <p>结束时间：<span id="end_time4">2071-09-20</span></p>
                                    <p>活动地址：<span id="address4">江西赣州章贡区分水岭</span></p>
                                    <p>所属楼盘：<a href="javascript:void(0);" id="buildingsName4">地球村</a></p>
                                    <p>所属商家：<a href="javascript:void(0);" id="agencyName4">活跃经销商</a></p>
                                </div>
                            </dd>
                        </dl>
                    </div>

                    <div style="position: absolute;top: 100px;left: 1000px;">
                        <p>大家正在看</p>
                        <div>
                            <a><h4>绿洲海</h4></a>
                            <img src="<%=path %>/public/images/xie/index.jpg" class="img-responsive"/>
                        </div>
                    </div>


                    <div class="col-lg-offset-3">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a onclick="getData(1);" href="#item0">首页（当前第<span id="currentPage">1</span>页）</a>
                                </li>
                                <li><a onclick="lastPage();" href="#item0">上一页</a></li>
                                <li><a onclick="nextPage();" href="#item0">下一页</a></li>
                                <li><a onclick="finallyPage();" href="#item0">尾页（总共<span id="totalPage">2</span>页）</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    版权
    <div>
        <jsp:include page="../../include_page/footer.jsp" flush="true"></jsp:include>
    </div>

    <script src="<%=path%>/public/js/xie/agency_index/jquery.min.js"></script>
    <script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
    <script src="<%=path%>/public/js/lai/index_activity.js"></script>
    <script>
        $(function () {
            getData(1);
        });
    </script>
</div>
</body>
</html>
