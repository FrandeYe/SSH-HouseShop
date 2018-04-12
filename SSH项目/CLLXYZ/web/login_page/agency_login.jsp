<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/8/24
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <title>经销商登录</title>
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css" type="text/css"/>

    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="<%=path%>/public/css/zhang/style.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/zhang/register.css" type="text/css"/>
</head>
<body>

<div class="container"
     style="width: 100%; height: 460px; background: #FF2C4C url('../public/images/zhang/loginbg.jpg') no-repeat;">
    <div class="row">
        <div class="col-md-7">
        </div>

        <div class="col-md-5">
            <div
                    style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
                <div style="text-align: center;">
                    <h3>经销商登录</h3>
                </div>
                <div style="margin-left: 20px;margin-top: 25px;">
                    <form id="loginForm"class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="input_phone" name="agency.phone"
                                       placeholder="请输入手机号" onblur="checkPhone()">
                                <span id="phone_span"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="input_password" name="agency.pwd"
                                       placeholder="请输入密码" onblur="checkPwd()">
                                <span id="password_span"></span>
                            </div>
                        </div>
                                <div class="form-group">
                                    <a  href="javascript:void(0);" class="col-sm-offset-3  btn btn-primary btn-md"
                                       onclick="login()">登录</a>
                                    <a href="javascript:void(0);" class="btn btn-info" onclick="resetBtn()">重置</a>
                                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--版权--%>
<div>
    <jsp:include page="../include_page/footer.jsp" flush="true"></jsp:include>
</div>

<script src="<%=path%>/public/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/public/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=path%>/public/js/zhang/register.js" type="text/javascript"></script>
</body>
</html>

