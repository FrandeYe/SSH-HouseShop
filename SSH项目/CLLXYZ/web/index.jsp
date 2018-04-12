<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/23
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
</head>
<body>
</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        window.location.href="/index/showHome";
    });
</script>
</html>
