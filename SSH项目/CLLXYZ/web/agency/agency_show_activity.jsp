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

</head>
<body>
<div id="caseList" class="bg-gray">
    <div class="alllist w1200">
        <div class="activity clearfix mt20">
            <div class="le_nav fl">
                <div class="link_list">
                    <div class="link_list">
                        <a href="" class="name2 db">楼盘活动<span class="fr">&gt;</span></a>
                        <a href="<%=path %>/buildings/buildingsActivity" class="name db current">推荐活动<span class="fr">&gt;</span></a>
                        <a href="<%=path %>/supply/supplyActivity" class="name3 db">买房送车活动活动<span class="fr">&gt;</span></a>
                    </div>

                </div>
            </div>

            <div class="right_cont fr">
                <div class="city_name clearfix"></div>
                <!--推荐活动-->
                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/11.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        活动结束：<span>${activitys.end_time }</span>
                                    </p>
                                    <p>
                                        活动地址：<span>${activitys.address }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>




                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/12.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>


                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/13.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>


                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/14.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>

                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                <div class="activity_list">
                    <dl class="clearfix">
                        <dt class="fl pr">
                            <a href="http://www.dyrs.com.cn/activity/201704/17259"
                               target="_blank"><img src="<%=path%>/public/images/xie/activity/15.jpg" /></a>
                            <div class="count pass">
                                <i class="ico"></i><span class="countBox"
                                                         data-end="2017-04-08 18:00">活动结束!</span>
                            </div>
                        </dt>
                        <dd class="fr pr">
                            <h2>
                                <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                            </h2>
                            <div class="txt">${activitys.des}</div>
                            <div class="xq">
                                <p>
                                    活动开始：<span>${activitys.created_time }</span>
                                </p>
                                <p>
                                    咨询热线：<span class="red">公司固定电话</span>
                                </p>
                            </div>
                            <div class="link pa">
                                <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                      class="more">查看活动详情</a>
                            </div>
                        </dd>
                    </dl>
                </div>
                </c:forEach>




                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/16.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>


                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/17.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>


                <c:forEach items="${requestScope.companyactivity }" var="activitys">
                    <div class="activity_list">
                        <dl class="clearfix">
                            <dt class="fl pr">
                                <a href="http://www.dyrs.com.cn/activity/201704/17259"
                                   target="_blank"><img src="<%=path%>/public/images/xie/activity/18.jpg" /></a>
                                <div class="count pass">
                                    <i class="ico"></i><span class="countBox"
                                                             data-end="2017-04-08 18:00">活动结束!</span>
                                </div>
                            </dt>
                            <dd class="fr pr">
                                <h2>
                                    <a href="<%=path %>/${activitys.image }"target="_blank">活动名称</a>
                                </h2>
                                <div class="txt">${activitys.des}</div>
                                <div class="xq">
                                    <p>
                                        活动开始：<span>${activitys.created_time }</span>
                                    </p>
                                    <p>
                                        咨询热线：<span class="red">公司固定电话</span>
                                    </p>
                                </div>
                                <div class="link pa">
                                    <a	href="<%=path%>/f_company/company_activity_details.jsp"
                                          class="more">查看活动详情</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </c:forEach>

                <div class="paging">
                    <a href="<%=path %>/company/companyActivity?pageNo=1">首页</a>
                    <a href="<%=path %>/company/companyActivity?pageNo=${currPage - 1 }">上一页</a>
                    <a href="<%=path %>/company/companyActivity?pageNo=${currPage + 1 }">下一页</a>
                    <a href="<%=path %>/company/companyActivity?pageNo=${requestScope.totalPage }">尾页</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/public/js/xie/agency_index/jquery.min.js"></script>
<script src="<%=path%>public/js/xie/agency_index/jquery-1.9.1.min.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/public.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/sea.js" id="seajsnode"></script>
<script src="<%=path%>/public/js/xie/agency_index/header.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/appoint.js"></script>
<script src="<%=path%>/public/js/xie/agency_index/ad_common.js"></script>

</body>
</html>
