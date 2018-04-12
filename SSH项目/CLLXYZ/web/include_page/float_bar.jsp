<%--
  Created by IntelliJ IDEA.
  User: NormalAdministrator
  Date: 2017/9/23
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/right_float/waiter.css">
    <link rel="stylesheet" href="<%=path%>/public/css/ye/right_float/iconfont.css">
    <link rel="stylesheet" href="<%=path%>/public/css/ye/credit_css/credit.css">
</head>
<body>
<div class="wuyou-waiter">
    <ul class="waiter-ul">
        <li class="wuyou-code">
            <a class="iconfont icon-code" data-toggle="modal" data-target="#creditModal" href="#" style="margin-left:-40px;"></a>
            <div class="waiter-title" style="margin-left:-25px;">贷款计算器</div>
        </li>
        <li class="wuyou-home">
            <a class="iconfont icon-shouye" href="<%=path%>/index/showHome" style="margin-left:-40px;"></a>
            <div class="waiter-title" style="margin-left:-25px;">回到首页</div>
        </li>
        <li class="wuyou-top">
            <a class="iconfont icon-Upward" href="#" style="margin-left:-40px;"></a>
            <div class="waiter-title" style="margin-left:-25px;">回到顶部</div>
        </li>
    </ul>
</div>

<div class="modal fade" id="creditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width:850px;height:850px;margin-left:-20%;">
            <div id="box">
                <h2>购房贷款计算器</h2>
                <div id="tabs">
                    <div id="content">
                        <div id="contact">
                            <form id="myform" action="#" style="display: block">
                                <div id="contact_left">
                                    <div id="dklx">
                                        <h5>请您填写1:</h5>
                                        贷款类别:
                                        <label><input type="radio" name="dktype" checked value="0"/>商业贷款</label>
                                        <label><input type="radio" name="dktype" value="1"/>公积金贷款</label>
                                        <label><input type="radio" name="dktype" value="2"/>组合型贷款</label>
                                    </div>
                                    <div id="jsfs">
                                        <h6>计算方式:</h6>
                                        <dl id="way">
                                            <dt><label class="count"><input type="radio" name="jsfs" value="0"
                                                                            checked/>根据面积、单价计算</label></dt>
                                            <dd style="display: block">
                                                <label>单价:</label><input type="text" name="price">元/平米<br>
                                                <label>面积:</label><input type="text" name="area">平方米<br>
                                                <label>按揭成数</label>
                                                <select class="form-control" name="ajcs">
                                                    <option value="70" selected>7成</option>
                                                    <option value="80">8成</option>
                                                    <option value="90">9成</option>
                                                </select>
                                            </dd>
                                            <dt><label><input type="radio" value="1" name="jsfs"/>根据贷款总额计算</label></dt>
                                            <dd>
                                                <label>贷款总额：<input type="text" name="dkze">元</label>
                                            </dd>
                                        </dl>
                                        <label>按揭年数</label>
                                        <select class="form-control" name="ajns">
                                            <option value="6" selected>半年（6期）</option>
                                            <option value="12" selected>1年（12期）</option>
                                            <option value="24" selected>2年（24期）</option>
                                            <option value="36" selected>3年（36期）</option>
                                            <option value="48" selected>4年（48期）</option>
                                            <option value="60" selected>5年（60期）</option>
                                            <option value="72" selected>6年（72期）</option>
                                            <option value="84" selected>7年（84期）</option>
                                            <option value="96" selected>8年（96期）</option>
                                            <option value="108" selected>9年（108期）</option>
                                            <option value="120" selected>10年（120期）</option>
                                            <option value="240">20年（240期）</option>
                                            <option value="360">30年（360期）</option>
                                        </select><br>
                                    </div>
                                    <div id="dkll">
                                        <label>贷款利率</label>
                                        <select name="dkll">
                                            <option value="0">12年6月8日基准利率</option>
                                            <option value="1">12年7月6日基准利率</option>
                                            <option value="2">14年11月22日基准利率</option>
                                            <option value="3" selected>15年03月01日基准利率</option>
                                        </select><br>
                                        <input class="percent" name="dkll" type="text" value="6.80"/>%
                                    </div>
                                    <div id="method">
                                        还款方式:
                                        <label><input type="radio" name="bb" checked/>等额本息</label>
                                        <label><input type="radio" name="bb"/>等额本金<br></label>
                                    </div>
                                    <input type="button" name="startCalc" class="start" value="开始计算"/>
                                    <input type="reset" class="again" value="重新填写"/>
                                </div>
                                <div id="contact_right">
                                    <h5>查看结果:</h5>
                                    <label>房款总额:</label><input type="text" name="fousex" readonly/>元<br>
                                    <label>贷款总额:</label><input type="text" name="loan" readonly/>元<br>
                                    <label>还款总额:</label><input type="text" name="refund" readonly/>元<br>
                                    <label>支付利息款:</label><input type="text" name="pay" readonly/>元<br>
                                    <label>首期付款:</label><input type="text" name="first" readonly/>元<br>
                                    <label>贷款月数:</label><input type="text" name="month" readonly/><br>
                                    <label>月均还款:</label><input type="text" name="average" readonly/>元<br>
                                    <p>*以上结果仅供参考</p>
                                </div>
                            </form>
                        </div>
                        <div class="box">公积金贷款></div>
                        <div class="box">提前还贷</div>
                        <div class="box">税费></div>
                        <div class="box">装修贷款</div>
                        <div class="box">购房能力评估</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="height:100px;;margin-top:80%;text-align:center;">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script src="<%=path%>/public/js/ye/credit_js/index.min.js"></script>
<script src="<%=path%>/public/plugins/jquery.min.js"></script>
</body>
</html>
