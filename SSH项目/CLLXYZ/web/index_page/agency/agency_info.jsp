<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/17
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path%>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/css/ye/index-css/sweet-alert.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/main.css">
    <link rel="stylesheet" href="<%=path%>/public/css/liu/index_agency.css">
</head>
<body class="container">

<div id="model-box" class="modal fade col-lg-10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="height: auto;margin-left: auto;margin-right: auto;">
    <div class="modal-dialog" style="width: 800px;">
        <div class="modal-content" style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    预约信息
                </h4>
            </div>

            <div class="modal-body">
                <form id="form">
                    <div style="">
                        <input type="hidden" id="emp_id" name="appointment.employee.id" value="">
                        <input type="hidden" id="agency_id" name="appointment.agency.id" value="${requestScope.id}">
                        <input type="hidden" id="user_id" name="appointment.user.id"
                               value="${sessionScope.user.id}">
                        <input type="hidden" id="house_id" name="appointment.house.id" value="">
                        <div style="float: left;margin-left: 200px;height:40px;text-align: center;margin-top:5px;">
                            <label style="font-size: 18px;">房屋户型</label>
                        </div>
                        <div style="float: left;margin-left: 10px;">
                            <select class="form-control" id="select">
                            </select>
                        </div>
                        <p style="clear: both"></p>
                    </div>
                    <div>
                        <div style="float: left;margin-left: 200px;height:40px;text-align: center;margin-top:5px;">
                            <label style="font-size: 18px;">看房时间</label>
                        </div>
                        <div style="float: left;margin-left: 10px;">
                            <input class="form-control  easyui-datebox " style="width: 118px;" name="appointment.app_arrive_time"/>
                        </div>
                        <p style="clear: both"></p>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回
                </button>
                <button type="button" class="btn btn-primary" onclick="saveAppointment()">
                    确定
                </button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="row-fluid">
            <div class="col-lg-12 col-md-12  col-sm-12">
                <jsp:include page="/include_page/top.jsp"></jsp:include>
            </div>
        </div>
    </div>
    <div id="agency">
        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: 70px;">
            <div class="row-fluid">
                <div class="col-lg-6 col-md-6 col-sm-4"
                     style="height: 400px; text-align: center;">
                    <br/>
                    <div style="text-align: center;height: 350px;background-color: #f1f1ff;">
                        <br/>
                        <img id="agency-src" src="" style=" width: 400px;height:300px;vertical-align: middle;">
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-4" style="height: 400px;padding: 10px;">
                    <div name="des" style="background-color: #f1f1ff;height: 350px;margin-top: 10px;">

                        <div name="one" style="height: 50px;">
                            <div id="name" style="float: left;margin-top: 10px;margin-left: 30px; width: 180px;">
                                <label style="width: 60px;text-align: center;">公司名称</label>
                                <span id="agency-name" style="height: 80px;"></span>
                            </div>
                            <div id="email" style="float: left;margin-top: 10px;margin-left: 20px;">
                                <label style="width: 60px;text-align: center;">Email</label>
                                <span id="agency-email" style="height: 80px;"></span>
                            </div>
                            <p style="clear: both"></p>
                        </div>

                        <div name="two" style="height: 50px;">
                            <div id="leader" style="float: left;margin-top: 10px;margin-left: 30px;width:180px;">
                                <label style="width: 60px;text-align: center;">管 理 者</label>
                                <span id="agency-leader" style="height: 80px;"></span>
                            </div>
                            <div id="phone" style="float: left;margin-top: 10px;margin-left: 20px;">
                                <label style="width: 60px;text-align: center;">电话</label>
                                <span id="agency-phone" style="height: 80px;"></span>
                            </div>
                            <p style="clear: both"></p>
                        </div>

                        <div name="three" style="height: 50px;">
                            <div id="tel" style="float: left;margin-top: 10px;margin-left: 30px;width:180px;">
                                <label style="width: 60px;text-align: center;">固定电话</label>
                                <span id="agency-tel" style="height: 80px;"></span>
                            </div>
                            <div id="address" style="float: left;margin-top: 10px;margin-left: 20px;">
                                <label style="width: 60px;text-align: center;">地址</label>
                                <span id="agency-address"></span>
                            </div>
                        </div>

                        <div name="four">
                            <div id="intro">
                                <div class="col-lg-12" style="height: 180px;">
                                    <div style="text-align: center;width: auto;height: auto;margin-right: 0;margin-left: 0;">
                                        <h4>公司简介</h4>
                                    </div>
                                    <span id="agency-intro"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <p style="clear: both;"></p>
        </div>
    </div>
</div>

<div id="middle" style="height: auto;width: auto;">
    <%-- 四个员工--%>
    <div id="fourEmployees">
        <div class="row" style="margin-top: 50px;height: 500px;">
            <div class="col-md-12" style="height: 500px;margin-top: 20px;background-color: rgba(220,220,220,0.4)">

                <div id="employees-img" class="container"
                     style=";height:300px;float: left;margin-left: -20px;margin-top: 20px;">

                    <div class="row" style="margin-left:-1px;margin-top: -10px;">
                        <div class="row-fluid">
                            <div class="col-lg-12 col-md-8 col-sm-6"
                                 style="height: auto;margin-bottom:30px;">
                                <div style="width: auto;margin-left: auto;margin-right:auto;margin-top: 20px;">
                                    <div style="margin-right: auto;margin-left: auto;text-align: center;">
                                        <span style=";font:bold 20px w;">前台接待</span>
                                    </div>
                                </div>
                            </div>

                            <div id="employee0" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <div style="width: auto;height: auto;">
                                    <a href="#">
                                        <img id="headicon0" title="头像" style="margin-top: 15px"
                                             src="/public/images/upload/buildings01.jpg"
                                             class="img-rounded img-responsive"/>
                                    </a>
                                </div>
                                <div style="width: auto;height: auto;float: left;">
                                    <input type="hidden" id="id0"/>
                                    <h5>员工名称：
                                        <strong>
                                            <a id="name0" style="">5000</a>
                                        </strong>
                                    </h5>
                                    <h5>联系方式：
                                        <strong>
                                            <a id="phone0" style="">5000</a>
                                        </strong>
                                    </h5>
                                </div>
                                <div style="float: left;margin-top: 10px;margin-left:10px;width:auto;height: 40px;text-align: center;">
                                    <a id="appointment0" type="button" class="btn btn-primary" data-toggle="modal"
                                       data-target="#model-box"
                                       onclick="house('${requestScope.id}', 'id0');"
                                    >预约</a>
                                </div>
                                <p style="clear: both;"></p>
                            </div>
                            <%--bd1--%>
                            <div id="employee1" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <div style="width: auto;height: auto;">
                                    <a href="#">
                                        <img id="headicon1" title="头像" style="margin-top: 15px"
                                             src="/public/images/upload/buildings01.jpg"
                                             class="img-rounded img-responsive"/>
                                    </a>
                                </div>
                                <div style="width: auto;height: auto;float: left;">
                                    <input type="hidden" id="id1"/>
                                    <h5>员工名称：
                                        <strong>
                                            <a id="name1" style="">5000</a>
                                        </strong>
                                    </h5>
                                    <h5>联系方式：
                                        <strong>
                                            <a id="phone1" style="">5000</a>
                                        </strong>
                                    </h5>
                                </div>
                                <div style="float: left;margin-top: 10px;margin-left:10px;width:auto;height: 40px;text-align: center;">
                                    <a id="appointment1" type="button" class="btn btn-primary" data-toggle="modal"
                                       data-target="#model-box"
                                       onclick="house('${requestScope.id}', 'id1');">预约</a>
                                </div>
                                <p style="clear: both;"></p>
                            </div>
                            <%--bd2--%>
                            <div id="employee2" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <div style="width: auto;height: auto;">
                                    <a href="#">
                                        <img id="headicon2" title="头像" style="margin-top: 15px"
                                             src="/public/images/upload/buildings01.jpg"
                                             class="img-rounded img-responsive"/>
                                    </a>
                                </div>
                                <div style="width: auto;height: auto;float: left;">
                                    <input type="hidden" id="id2"/>
                                    <h5>员工名称：
                                        <strong>
                                            <a id="name2" style="">5000</a>
                                        </strong>
                                    </h5>
                                    <h5>联系方式：
                                        <strong>
                                            <a id="phone2" style="">5000</a>
                                        </strong>
                                    </h5>
                                </div>
                                <div style="float: left;margin-top: 10px;margin-left:10px;width:auto;height: 40px;text-align: center;">
                                    <a id="appointment2" type="button" class="btn btn-primary" data-toggle="modal"
                                       data-target="#model-box"
                                       onclick="house('${requestScope.id}', 'id2');">预约</a>
                                </div>
                                <p style="clear: both;"></p>
                            </div>
                            <%--bd3--%>
                            <div id="employee3" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <div style="width: auto;height: auto;">
                                    <a href="#">
                                        <img id="headicon3" title="头像" style="margin-top: 15px"
                                             src="/public/images/upload/buildings01.jpg"
                                             class="img-rounded img-responsive"/>
                                    </a>
                                </div>
                                <div style="width: auto;height: auto;float: left;">
                                    <input type="hidden" id="id3"/>
                                    <h5>员工名称：
                                        <strong>
                                            <a id="name3" style="">5000</a>
                                        </strong>
                                    </h5>
                                    <h5>联系方式：
                                        <strong>
                                            <a id="phone3" style="">5000</a>
                                        </strong>
                                    </h5>
                                </div>
                                <div style="float: left;margin-top: 10px;margin-left:10px;width:auto;height: 40px;text-align: center;">
                                    <a id="appointment3" type="button" class="btn btn-primary" data-toggle="modal"
                                       data-target="#model-box"
                                       onclick="house('${requestScope.id}', 'id3');">预约</a>
                                </div>
                                <p style="clear: both;"></p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <%-- 四个活动--%>
    <div id="fourActivities">
        <div class="row" style="margin-top: 50px;height: 500px;">
            <div class="col-md-12" style="height: 500px;margin-top: 20px;background-color: rgba(220,220,220,0.4)">
                <div id="activity-img" class="container"
                     style=";height:300px;float: left;margin-left: -20px;margin-top: 20px;">

                    <div class="row" style="margin-left:-1px;margin-top: -10px;">
                        <div class="row-fluid">
                            <div class="col-lg-12 col-md-8 col-sm-6"
                                 style="height: auto;margin-bottom:30px;">
                                <div style="width: auto;margin-left: auto;margin-right:auto;margin-top: 20px;">
                                    <div style="margin-right: auto;margin-left: auto;text-align: center;">
                                        <span style=";font:bold 20px w;">精彩活动</span>
                                    </div>
                                </div>
                            </div>

                            <div id="activity0" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="activityImageHref0" href="#">
                                    <img id="activityImage0" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="idActivity0"/>
                                <h5>活动名称：
                                    <strong>
                                        <a id="activitytitle0" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>活动地点：
                                    <strong>
                                        <a id="activityaddress0" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd1--%>
                            <div id="activity1" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="activityImageHref1" href="#">
                                    <img id="activityImage1" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="idActivity1"/>
                                <h5>活动名称：
                                    <strong>
                                        <a id="activitytitle1" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>活动地点：
                                    <strong>
                                        <a id="activityaddress1" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd2--%>
                            <div id="activity2" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="activityImageHref2" href="#">
                                    <img id="activityImage2" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="idActivity2"/>
                                <h5>活动名称：
                                    <strong>
                                        <a id="activitytitle2" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>活动地点：
                                    <strong>
                                        <a id="activityaddress2" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd3--%>
                            <div id="activity3" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="activityImageHref3" href="#">
                                    <img id="activityImage3" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="idActivity3"/>
                                <h5>活动名称：
                                    <strong>
                                        <a id="activitytitle3" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>活动地点：
                                    <strong>
                                        <a id="activityaddress3" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <%--四个楼盘--%>
    <div id="fourFloor">
        <div class="row" style="margin-top: 50px;height: 500px;">
            <div class="col-md-12" style="height: 500px;margin-top: 20px;background-color: rgba(220,220,220,0.4)">

                <div id="" class="container"
                     style=";height:300px;float: left;margin-left: -20px;margin-top: 20px;">

                    <div class="row" style="margin-left:-1px;margin-top: -10px;">
                        <div class="row-fluid">
                            <div class="col-lg-12 col-md-8 col-sm-6"
                                 style="height: auto;margin-bottom:30px;">
                                <div style="width: auto;margin-left: auto;margin-right:auto;margin-top: 20px;">
                                    <div style="margin-right: auto;margin-left: auto;text-align: center;">
                                        <span style=";font:bold 20px w;">优质楼盘</span>
                                    </div>
                                </div>
                            </div>

                            <div id="floor0" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="floorlogoHref0" href="#">
                                    <img id="floorlogo0" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="floorId0">
                                <h5>楼盘名称：
                                    <strong>
                                        <a id="floorname0" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>楼盘地址：
                                    <strong>
                                        <a id="flooraddress0" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd1--%>
                            <div id="floor1" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="floorlogoHref1" href="#">
                                    <img id="floorlogo1" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="floorId1">
                                <h5>楼盘名称：
                                    <strong>
                                        <a id="floorname1" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>楼盘地址：
                                    <strong>
                                        <a id="flooraddress1" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd2--%>
                            <div id="floor2" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="floorlogoHref2" href="#">
                                    <img id="floorlogo2" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="floorId2">
                                <h5>楼盘名称：
                                    <strong>
                                        <a id="floorname2" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>楼盘地址：
                                    <strong>
                                        <a id="flooraddress2" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                            <%--bd3--%>
                            <div id="floor3" class="col-md-3"
                                 style="margin-top: 20px;margin-left:20px;background-color: white;width:260px;">
                                <a id="floorlogoHref3" href="#">
                                    <img id="floorlogo3" title="头像" style="margin-top: 15px"
                                         src="/public/images/upload/buildings01.jpg"
                                         class="img-rounded img-responsive"/>
                                </a>
                                <input type="hidden" id="floorId3">
                                <h5>楼盘名称：
                                    <strong>
                                        <a id="floorname3" style="">5000</a>
                                    </strong>
                                </h5>
                                <h5>楼盘地址：
                                    <strong>
                                        <a id="flooraddress3" style="">5000</a>
                                    </strong>
                                </h5>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 70px;">
        <div>
            <jsp:include page="/include_page/footer.jsp"></jsp:include>
        </div>
    </div>
        <%--浮动条--%>
        <div id="float_bar">
            <jsp:include page="/include_page/float_bar.jsp" flush="true"></jsp:include>
        </div>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path%>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<script src="<%=path %>/public/js/ye/index-js/sweet-alert.js"></script>

<script src="<%=path%>/public/js/liu/agency_detail_index.js"></script>

<script>
    function house(id, employee_id) {
        var user_id ="${sessionScope.user.id}"
        if(""!=user_id){
            var click_id = $("#" + employee_id).val();
            $("#emp_id").val(click_id);
            $.post("/house/agencyHouse?agency_id=" + id,
                function (data) {
                    for (var i = 0; i < data.rows.length; i++) {
                        $("#select").append("<option value=" + data.rows[i].id + ">" + data.rows[i].name + "</option>");
                    }
                }, "json"
            )
        }else{
            sweetAlert("请登录 !")
            window.location.reload()
        }
    }
</script>

<script>
    $(function () {
        agencyDetail("${requestScope.id}");
        showEmployeeIndex(1, "${requestScope.id}");
        showActivityIndex(1, "${requestScope.id}");
        showBuildingsIndex(1, "${requestScope.id}");
    })
</script>

</body>
</html>

