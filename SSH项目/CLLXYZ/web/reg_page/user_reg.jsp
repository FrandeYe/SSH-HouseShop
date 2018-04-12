<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册</title>
<link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css" type="text/css"/>

<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="<%=path%>/public/css/zhang/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=path%>/public/css/zhang/register.css" type="text/css"/>
<link rel="stylesheet" href="<%=path%>/public/css/zhang/sweetalert.css" type="text/css"/>

</head>
<body>
<div class="container"
     style="width: 100%; background: url('../public/images/zhang/regist_bg.jpg');">
    <%--浮动条--%>
    <div id="float_bar">
        <jsp:include page="/include_page/float_bar.jsp" flush="true"></jsp:include>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            <div style="text-align:center;">
                <h2>用户注册</h2>
            </div>

            <div style="margin-left:90px;margin-top:25px;">
                <form id="reg_form" class="form-horizontal" method="post" style="margin-top: 5px;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="input_phone" name="user.phone"
                                   placeholder="请输入手机号" onblur="checkPhone('<%=path%>/user/checkPhone')">
                            <span id="phone_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="input_password" name="user.pwd"
                                   placeholder="请输入密码" onblur="checkPwd()">
                            <span id="password_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="input_verify" name="repassword"
                                   placeholder="请输入确认密码" onblur="checkVerify()">
                            <span id="verify_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="input_email" name="user.email"
                                   placeholder="请输入邮箱" onblur="checkEmail('<%=path%>/user/checkEmail')">
                            <span id="email_span"></span>
                        </div>
                    </div>
                    <div class="form-group opt">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="user.gender" id="sex1" value="M" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="user.gender" id="sex2" value="F">女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="verifyCode">

                        </div>
                        <div class="col-sm-2">
                            <a id="btn" href="javascript:;" onclick="time(this);" class="btn btn-success">免费获取手机验证码</a>
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <a href="javascript:;" onclick="user_reg();" class="btn btn-primary">注册</a>
                            <input type="reset" class="btn btn-info" value="重置" name="reset">
                        </div>
                    </div>
                </form>
            </div>


        </div>

        <%--版权--%>
        <div>
            <hr style="height: 1px;background-color: black; width: 500px;">
            <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
                Copyright &copy; 2005-2017 版权所有，翻版必究！
            </div>
        </div>

<script src="<%=path%>/public/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/public/js/zhang/sweetalert.min.js" type="text/javascript"></script>
<script src="<%=path%>/public/js/zhang/register.js" type="text/javascript"></script>
<script src="<%=path%>/public/js/zhang/repeatVerifyCode.js" type="text/javascript"></script>
</body>
</html>




