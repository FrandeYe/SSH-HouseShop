<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>资讯</title>
    <link rel="stylesheet" href="../../public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../public/plugins/bootstrap/css/bootstrap-theme.css">
    <style>
        .newsHeadList li em {
            float: right;
            width: 50px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
            color: #CCC;
        }
    </style>
</head>
<body>
<div class="container">
    <%--导航栏--%>
    <div>
        <jsp:include page="../../include_page/top.jsp" flush="true"></jsp:include>
    </div>

    <div id="content" class="container">
        <div class="row">
            <%--左侧部分--%>
            <%--<div class="col-lg-9" style="background-color:#f1f1ff">
                <h4><a href="#">龙沐湾太阳城B区特价房一口价仅5580元/平 现房仅推15套</a></h4>
                <span>乐东龙沐湾太阳城B区现推出15套特价房，户型面积为74.2-78.26平，一口价5580元/平，总价约41.4-43.6万/套，现房在售，简装交付。</span>
                <ul id="newHeadList" style="list-style-type: none">
                    <li>
                        <span style="float: right">8.31</span>
                        <h5 style=""><a>隆鑫诺亚方舟叠拼别墅总价低至300万/套 预计2018年年底交房</a></h5>
                        <span style="float: right">8.31</span>
                        <h5 style=""><a>君海湾龙腾金街公寓均价约13000元/平 主推二房、三房户型</a></h5>
                        <span style="float: right">8.31</span>
                        <h5 style=""><a>龙栖湾波波利海岸近海别墅特价 总价低至600万/套</a></h5>
                        <span style="float: right">8.31</span>
                        <h5 style=""><a>龙沐湾太阳城推产权式酒店公寓特价房 一口价仅7880元/平</a></h5>
                        <span style="float: right">8.31</span>
                        <h5 style=""><a>江南乐居特价房优惠单价低至6900元/平 仅推5套先到先得</a></h5>
                    </li>
                </ul>


            </div>--%>

            <%--工程进度--%>
            <div class="col-lg-9">
                <h3 style="color: #64B11E;">文章列表</h3>
            </div>

            <div class="col-lg-9 col-md-9" style="margin-top: 10px; background-color:#f1f1ff">
                <%--左边部分--%>
                <div id="item0" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref0" href="#"><img id="logoSrc0"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time0">2017.07.12</span></em></div>
                    <span id="abstracts0">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--中间部分--%>
                <div id="item1" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref1" href="#"><img id="logoSrc1"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time1">2017.07.12</span></em></div>
                    <span id="abstracts1">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--右边部分--%>
                <div id="item2" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref2" href="#"><img id="logoSrc2"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time2">2017.07.12</span></em></div>
                    <span id="abstracts2">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>
            </div>

            <div class="col-lg-9 col-md-9" style="margin-top: 10px; background-color:#f1f1ff">
                <%--左边部分--%>
                <div id="item3" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref3" href="#"><img id="logoSrc3"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time3">2017.07.12</span></em></div>
                    <span id="abstracts3">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--中间部分--%>
                <div id="item4" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref4" href="#"><img id="logoSrc4"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time4">2017.07.12</span></em></div>
                    <span id="abstracts4">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--右边部分--%>
                <div id="item5" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref5" href="#"><img id="logoSrc5"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time5">2017.07.12</span></em></div>
                    <span id="abstracts5">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>
            </div>

            <div class="col-lg-9 col-md-9" style="margin-top: 10px; background-color:#f1f1ff">
                <%--左边部分--%>
                <div id="item6" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref6" href="#"><img id="logoSrc6"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time6">2017.07.12</span></em></div>
                    <span id="abstracts6">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--中间部分--%>
                <div id="item7" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref7" href="#"><img id="logoSrc7"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time7">2017.07.12</span></em></div>
                    <span id="abstracts7">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>

                <%--右边部分--%>
                <div id="item8" class="col-lg-4 col-md-3 col-xs-12">
                    <dl>
                        <div style="margin-top: 15px;">
                            <dt>
                                <a id="logoHref8" href="#"><img id="logoSrc8"
                                                                src="<%=path%>/public/images/articles/94e9f00.jpg"
                                                                class="img-responsive"></a>
                            </dt>
                        </div>

                    </dl>
                    <div style="margin-top: 15px;"><em><span id="created_time8">2017.07.12</span></em></div>
                    <span id="abstracts8">乐东隆鑫诺亚方舟1、2号楼均已是现房；项目三叠拼别墅在做内部装修，部分叠拼别墅已经封顶，部分叠拼别墅在打地基。</span>
                </div>
            </div>

            <%--右侧部分--%>
            <div class="col-lg-3" style="">
                <div class="sideFix pinBg">
                    <!--二维码：开始-->
                    <div class="sideEwm" style="background-color:#f1f1ff;">
                        <dl>
                            <div style="margin-top: 15px;margin-left: 20px;"><span
                                    style="font-size: 22px;display: block;">手机or微信扫一扫</span>海南楼盘随身带
                            </div>
                            <dd>
                                <img src="#"></dd>
                        </dl>
                        <ul>
                            <li><strong>旅居网咨询热线
                                <ins class="icon-18"></ins>
                            </strong></li>
                            <li>
                                <label><b>400-900-1113</b><em>转</em><b>9188</b></label></li>

                        </ul>
                    </div>
                    <!--二维码：结束-->
                </div>
            </div>

            <%--分页开始--%>
            <div class="col-lg-offset-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a onclick="getAllArticleData(1);" href="#item0">首页（当前第<span
                                id="articleCurrentPage">1</span>页）</a></li>
                        <li><a onclick="lastArticlePage();" href="#item0">上一页</a></li>
                        <li><a onclick="nextArticlePage();" href="#item0">下一页</a></li>
                        <li><a onclick="finallyArticlePage();" href="#item0">尾页（总共<span id="articleTotalPage">2</span>页）</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <%--版权--%>
            <div>
                <jsp:include page="../../include_page/footer.jsp" flush="true"></jsp:include>
            </div>
        </div>
    </div>

    <script src="<%=path %>/public/plugins/jquery.min.js"></script>
    <script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

    <script src="<%=path %>/public/js/lai/index_articles.js"></script>

    <script>
        $(function () {
            getAllArticleData(1);
        });
    </script>
</div>
</body>
</html>
