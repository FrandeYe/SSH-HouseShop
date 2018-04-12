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
    <title>楼盘活动详情页面</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/captcha.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/page.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/public/css/xie/main.css">
</head>
<body>

<!--主页头：开始-->
<%--<div class="pageHeadWrap">--%>
    <%--<div class="wrap xxx">--%>
       <%-- <div class="left">
            <!--项目名：开始-->
            <div class="phLeft">
                <img src="<%=path %>/public/images/5.jpg" title="龙沐湾太阳城"></div>
            <div class="phRight">
                <h2><small>龙沐湾太阳城</small><em>开盘价：<b>5000</b>元/㎡</em><em>均价：<b>7000</b>元/㎡</em><em><a class="在售" href="javascript:void(0)">在售</a> </em><cite><a><ins class="icon-44"></ins>历史价格</a></cite></h2>
                <span><ins class="icon-24"></ins>乐东县西线高速龙沐湾旅游区入口</span>
                <span></span>
                <ul class="phTool">
                    <li><a href="javascript:void(0)" id="informBtn"><ins class="icon-37"></ins>降价通知</a></li>
                    <li><a href="javascript:void(0)" id="signupBtn"><ins class="icon-30"></ins>报名看房</a></li>
                    <li><a href="http://www.hainanfz.com/house/1689/ditu/"><ins class="icon-7"></ins>查看地图</a></li>
                </ul>
            </div>
        </div>--%>
        <%--<div class="right">--%>
            <%--<!--统计：开始-->--%>
            <%--<div class="phStat">--%>
                <%--<dl>--%>
                    <%--<dt><ins class="icon-27"></ins>人气：<b>0</b></dt>--%>
                    <%--<dd><a href="http://www.hainanfz.com/user/n1.html?id=1689"><ins class="icon-41"></ins>收藏：<b>2</b></a></dd>--%>
                    <%--<dd><a href="javascript:void(0)"><ins class="icon-10"></ins>中意：<b>43</b></a></dd>--%>
                    <%--<dd><a href="http://www.hainanfz.com/house/1689/discusslist/"><ins class="icon-4"></ins>评论：<b>13</b></a></dd>--%>
                <%--</dl>--%>
            <%--</div>--%>
            <%--<!--统计：结束-->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<!--导航条-->
<div class="pageHeadNavWrap">
    <div class="pin-wrapper" style="height: 42px;"><div class="wrap sideFix" style="width: 1200px;">
        <div class="pageHeadNav">
            <ul>
                <li class="active"><a href="http://www.hainanfz.com/house/1689/" target="_self">楼盘首页</a></li>
                <li><a href="http://www.hainanfz.com/house/1689/canshu/" target="_self">参数详情</a></li>

                <li><a href="http://www.hainanfz.com/house/1689/huxing/" target="_self">户型图</a></li>

                <li><a href="http://www.hainanfz.com/house/1689/xiangce/" target="_self">相册</a></li>

                <li><a href="http://www.hainanfz.com/house/1689/dongtai/" target="_self">楼盘资讯</a></li>
                <li><a href="http://www.hainanfz.com/house/1689/discusslist/" target="_self"><ins class="icon-5"></ins>评论咨询</a></li>
                <li><a href="http://www.hainanfz.com/house/1689/youhui/" target="_self">历史优惠动态</a></li>
            </ul>
        </div>
    </div></div>
</div>

<div class="pageMainWrap">
    <div class="wrap">
        <div class="pageMainHead clearfix">
            <!--幻灯：开始-->
            <div id="pagePic_tab" class="pagePic_tab clearfix">

                <div class="box_tab">
                    <ul style="position: relative; width: 520px; height: 338px;">

                        <li style="position: absolute; width: 520px; left: 0px; top: 0px; display: none;"><a href="http://www.hainanfz.com/house/1689/xiangce/13_1">
                            <img src="<%=path %>/public/images/xie/like1.jpg" alt="鸟瞰图" width="520" height="338"><em><ins class="icon-1"></ins>效果图</em></a></li>

                        <li style="position: absolute; width: 520px; left: 0px; top: 0px; display: none;"><a href="http://www.hainanfz.com/house/1689/xiangce/8_1">
                            <img src="<%=path%>/public/images/xie/2.jpg" alt="小区外景" width="520" height="338"><em><ins class="icon-1"></ins>实景图</em></a></li>

                        <li style="position: absolute; width: 520px; left: 0px; top: 0px;"><a href="http://www.hainanfz.com/house/1689/xiangce/19_1">
                            <img src="<%=path %>/public/images/xie/3.jpg" alt="小区周边配套：高铁尖峰站" width="520" height="338"><em><ins class="icon-1"></ins>配套图</em></a></li>

                        <li style="position: absolute; width: 520px; left: 0px; top: 0px; display: none;"><a href="http://www.hainanfz.com/house/1689/xiangce/20_1">
                            <img src="<%=path %>/public/images/xie/4.jpg" alt="区位图" width="520" height="338"><em><ins class="icon-1"></ins>区位图</em></a></li>

                    </ul>
                    <a class="prev" href="javascript:void(0)"><ins class="icon-29"></ins></a>
                    <a class="next" href="javascript:void(0)"><ins class="icon-28"></ins></a>
                </div>
                <div class="btn_tab">
                    <ul>

                        <li class=""><a href="javascript:void(0)">
                            <img src="<%=path %>/public/images/xie/like1.jpg" width="110" height="90"></a></li>

                        <li class=""><a href="javascript:void(0)">
                            <img src="<%=path %>/public/images/xie/2.jpg" width="110" height="90"></a></li>

                        <li class="on"><a href="javascript:void(0)">
                            <img src="<%=path %>/public/images/xie/3.jpg" width="110" height="90"></a></li>

                        <li><a href="javascript:void(0)">
                            <img src="<%=path %>/public/images/xie/4.jpg" width="110" height="90"></a></li>

                    </ul>
                </div>

            </div>
            <div class="pageParameter">
                <dl>
                    <dt>楼盘类型：</dt>
                    <dd>住宅、商铺</dd>
                </dl>
                <dl>
                    <dt>开盘时间：</dt>
                    <dd>2017年2月6日</dd>
                </dl>
                <dl>
                    <dt>交房时间：</dt>
                    <dd>2017年10月</dd>
                </dl>
                <dl>
                    <dt>物业管理：</dt>
                    <dd>1.5元/㎡·月</dd>
                </dl>
                <dl>
                    <dt>房屋类型：</dt>
                    <dd>一房、两房</dd>
                </dl>
                <dl>
                    <dt>装修情况：</dt>
                    <dd>毛坯、精装修</dd>
                </dl>
                <div class="pagePhone">
                    <span><ins class="icon-18"></ins>售楼处：<b>400-900-1113</b>转<b>1199</b></span>
                    <em>
                        <a href="http://zsswt.hainanfz.com/LR/Chatpre.aspx?id=MEW40079475&amp;lng=cn&amp;oname=%e6%a5%bc%e7%9b%98%e5%ae%a2%e6%9c%8d807">在线咨询</a>

                    </em>
                </div>

            </div>
        </div>
    </div>
</div>



<!--评论：开始-->
<%--<div class="pageComments">
<h3 class="mt"><cite><a href="http://www.hainanfz.com/house/1689/discusslist/" target="_self">查看全部(13)</a></cite>龙沐湾太阳城&nbsp;点评咨询<em><a class="btn green" onclick="javascript:$(&#39;.pageCommentsBox&#39;).show(100)">我要点评<ins class="icon-5"></ins>咨询</a></em></h3>

<!--评论框：开始-->
<div class="pageCommentsBox" style="display: none">
    <form id="tiwenfrom" method="post" action="http://www.hainanfz.com/HttpHandler/BaoMing.ashx">
        <dl>
            <dd><a href="javascript:void(0)">
                <img src="<%=path %>/public/images/xie/like1.jpg"><em>游客</em></a></dd>
            <dt>
                <input class="itext itext_s" name="Phone" defaultvalue="填写手机号码，第一时间得知最佳回复。（选填）" style="display: none" type="hidden" value="填写手机号码，第一时间得知最佳回复。（选填）">
                <textarea name="Message" cols="" rows="" class="itext" defaultvalue="填写您的问题" required="required"></textarea>
                <a href="javascript:void(0)" class="btn orangeGrad"><ins class="icon-21" ></ins>提交</a>
                <input type="hidden" value="PC龙沐湾太阳城评论主页" name="BtnName">
                <input type="hidden" value="龙沐湾太阳城评论主页" name="Title">
                <input type="hidden" value="http://www.hainanfz.com/house/1689/" name="Url">
                <input type="hidden" value="56" name="cid">
                <input type="hidden" value="1689" name="HouseID">
                <input type="hidden" value="2" name="Type">
                <input type="hidden" value="0" name="UsersID">
                <input type="hidden" value="游客" name="UsersID">
            </dt>
        </dl>
        <div style="margin-top: 10px; margin-left: 100px; display: none;" id="captcha_div2"><div class="ncpt_widget" id="NECaptcha_1504837003077" style="width: 300px; height: 31.875px;"><div class="ncpt_contents" style="display: none;"><div class="ncpt_pad" style="width: 300px; height: 93.75px; bottom: 9.375px; position: relative; display: none;"><iframe class="ncpt_win_iframe" style="width: 300px; height: 93.75px;" src="./龙沐湾太阳城官方网址_乐东房产网_旅居网_files/saved_resource.html"></iframe><div class="ncpt_pzzClick" style="left: 0px;"><img style="border-radius: 8px; width: 300px; height: auto;"></div></div><div class="ncpt_panel" style="width: 300px; height: 31.875px;"><div class="ncpt_hint_txt" style="left: 0px; width: 300px; height: 31.875px; line-height: 31.875px;"></div></div></div><div class="ncpt_contents" style="display: none;"><div class="ncpt_puzzle_bg" style="bottom: 41.25px; height: 93.75px;"><div class="ncpt_puzzle_fg" style="left: 6.625px;"><img style="width: 56.25px; height: auto;"></div><iframe class="ncpt_win_iframe" style="width: 300px; height: 93.75px;" src="./龙沐湾太阳城官方网址_乐东房产网_旅居网_files/saved_resource(1).html"></iframe><div class="ncpt_puzzle_bg" style="left: 0px; display: block; top: 0px;"><img style="width: 300px; border-radius: 8px;"></div></div><div class="ncpt_slide_bg" style="width: 300px; height: 31.875px; border-radius: 15.9375px;"><div class="ncpt_slide_fg" style="left: 1px;"><img src="./龙沐湾太阳城官方网址_乐东房产网_旅居网_files/slider.png" style="height: auto; width: 67.5px;"></div><div class="ncpt_hint_txt" style="line-height: 31.875px; opacity: 1;">&gt;&gt;&gt;请拖动滑块完成拼图&gt;&gt;&gt;</div></div></div><div class="ncpt_contents" style="display: none;"><div class="ncpt_pad" style="width: 300px; height: 93.75px; bottom: 41.25px; position: absolute;"><iframe class="ncpt_win_iframe" style="width: 300px; height: 93.75px;" src="./龙沐湾太阳城官方网址_乐东房产网_旅居网_files/saved_resource(2).html"></iframe><div class="ncpt_pzzClick" style="left: 0px;"><img style="width: 300px; height: auto;"></div></div><div class="ncpt_panel" style="width: 300px; height: 31.875px;"><div class="ncpt_hint_txt" style="left: 0px; width: 300px; height: 31.875px; line-height: 31.875px;"></div></div></div><div class="ncpt_hidden_input" style="display: none;"><input name="NECaptchaValidate" type="hidden" value=""></div></div></div>
    </form>
</div>--%>
<!--评论框：结束-->

    <%--<div class="cmitem">


        <dl class="cmitemQ">
            <dd><a><img src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                <span><a href="javascript:void(0)">来自：中国</a><em>2017-09-04</em></span>
                <p>按揭可以吗？首付几成？</p>
            </dt>
        </dl>

        <dl class="cmitemA">
            <dd><a href="javascript:void(0)">
                <img  src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                                        <span><a href="javascript:void(0)">任军国</a>
                                            <em>咨询电话：18808932270</em>
                                            <em>来自：旅居网置业顾问</em>
                                            <em>2017-09-05</em></span>
                <p>现在龙沐湾太阳城不接受按揭~欢迎来电详细咨询！</p>
            </dt>
        </dl>


        <dl class="cmitemQ">
            <dd><a href="javascript:void(0)">
                <img src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                <span><a href="javascript:void(0)">来自：北京市</a><em>2017-09-03</em></span>
                <p>B区是70年产权的吗？有燃气吗？</p>
            </dt>
        </dl>

        <dl class="cmitemA">
            <dd><a href="javascript:void(0)">
                <img  src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                                        <span><a href="javascript:void(0)">任军国</a>
                                            <em>咨询电话：18808932270</em>
                                            <em>来自：旅居网置业顾问</em>
                                            <em>2017-09-03</em></span>
                <p>不是，乐东没有天燃气的呢~</p>
            </dt>
        </dl>


        <dl class="cmitemQ">
            <dd><a href="javascript:void(0)">
                <img  src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                <span><a href="javascript:void(0)">来自：山西省晋中市</a><em>2017-08-28</em></span>
                <p>龙沐湾太阳城看房·团购·独家优惠[PC]</p>
            </dt>
        </dl>

        <dl class="cmitemA">
            <dd><a href="javascript:void(0)">
                <img src="<%=path %>/public/images/xie/00.jpg"></a></dd>
            <dt>
                                        <span><a href="javascript:void(0)">齐云</a>

                                            <em>来自：旅居网置业顾问</em>
                                            <em>2017-09-01</em></span>
                <p>欢迎来电咨询17330870319小齐</p>
            </dt>
        </dl>

    </div>
</div>--%>

<script src="<%=path%>/public/js/xie/agency_index/c.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/drag.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/hm.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/icon3.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/layer.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/mvl.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/simplemodal.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/slides.js"></script>

</body>
</html>
