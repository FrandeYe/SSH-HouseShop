<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/9/2
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户登录</title>
<link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css" type="text/css"/>

<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="<%=path%>/public/css/zhang/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=path%>/public/css/zhang/register.css" type="text/css"/>
<style>
    .error{
        color:red;
    }
</style>
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
                <h2>用户登录</h2>
            </div>

            <div style="margin-left:90px;margin-top:25px;">
                <form id="loginForm" class="form-horizontal" style="margin-top: 5px;">
                    <div id="login" class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="input_phone" name="phone"
                                   placeholder="请输入手机号">
                            <span id="phone_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="input_password" name="pwd"
                                   placeholder="请输入密码">
                            <span id="error_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <a href="javascript:void(0);" onclick="login();" class="btn btn-primary">登录</a>
                            <a href="javascript:void(0);" onclick="userReset();" class="btn btn-info">重置</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>

</div>
    <div style="text-align: center;margin-top: 100px;">
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
    <hr style="height: 1px;background-color: black; width: 500px;">
    <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
        Copyright &copy; 2005-2017 版权所有，翻版必究！
    </div>

<script src="<%=path%>/public/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/public/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=path %>/public/js/zhang/jquery.validate-1.13.1.js"></script>
<script src="<%=path%>/public/js/zhang/user.js" type="text/javascript"></script>
</body>
</html>





