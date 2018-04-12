
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/css/fileinput.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap-fileupload/themes/explorer/theme.css"/>
</head>
<body>

<!--显示分页的表格-->
<table id="list" class="easyui-datagrid"
       data-options="
        onClickRow:ClickRow,
        singleSelect:true,
        collapsible:true,
        rownumbers:true,
        pagination:true,
        pageSize:20,
        toolbar:'#tb',
        url:'<%=path %>/customer/pagerCustomerEmployee?id=${sessionScope.employee.id}',
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id', checkbox:true"></th>
        <th data-options="field:'name'">客户名</th>
        <th data-options="field:'gender',align:'right',formatter:formatGender">性别</th>
        <th data-options="field:'birthday',align:'right',formatter:formatBirthday">出生日期</th>
        <th data-options="field:'identity_id',align:'right'">身份证号</th>
        <th data-options="field:'email',align:'right'">邮箱</th>
        <th data-options="field:'phone',align:'right'">电话</th>
        <th data-options="field:'address',align:'right'">地址</th>
        <th data-options="field:'customer_type',align:'right'">客户类型</th>
        <th data-options="field:'contract',align:'right'">购房合同</th>
        <th data-options="field:'archives',align:'right'">zip档案</th>
        <th data-options="field:'created_time',align:'right',formatter:formatDate">创建时间</th>
        <th data-options="field:'status',align:'right',formatter:formatStatus">是否可用</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="showEditWin('customer.',9);">修改客户信息</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateStatusCus('1');">激活客户</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateStatusCus('0');">冻结客户</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="uploadFile('contract');">上传电子版购房合同</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="uploadFile('archives');">上传zip电子档案</a>
    <a  href="javascript:void(0);" id="downloadA">
        <input id="downloadBtn" type="button" disabled class="btn btn-success btn-xs" value="下载电子版购房合同" onclick="dowoloadFile();"/>
    </a>

</div>
<!--修改客户信息：开始-->
<div id="win" class="easyui-window" title="修改客户信息" style="width:800px;height:400px"
     data-options="closed:true,modal:true">
    <div class="col-lg-12">
        <form class="form-horizontal" style="margin-left: 15%" id="form">
            <div class="form-group">
                <!--隐藏id-->
                <input type="hidden" name="id" id="id"/>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">客户姓名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="ZE"
                           id="name" name="name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <input type="radio" name="gender" id="gender" value="M"/>男
                    <input type="radio" name="gender" id="gender" value="F"/>女
                </div>
            </div>
            <div class="form-group">
                <label for="identity_id" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox"
                           data-options="required:true, novalidate:true"
                           validType="idCode"
                           id="identity_id" name="identity_id" placeholder="请输入身份证号:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                <div class="col-sm-6">
                    <input type="text" style="width:100%" class="form-control easyui-datebox easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           id="birthday" name="birthday"/>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="email"
                           id="email" name="email" placeholder="请输入邮箱:"/>
                </div>
            </div>

            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="length[1,30]"
                           id="address" name="address" placeholder="请输入地址:"/>
                </div>
            </div>
            <div class="form-group">
                <label for="customer_type" class="col-sm-2 control-label">客户类型</label>
                <div class="col-sm-6">
                    <select id="customer_type" name="customer_type" class="form-control easyui-validatebox data-options= required:true, novalidate:true">
                        <option value="预约客户" selected>预约客户</option>
                        <option value="意向客户">意向客户</option>
                        <option value="预定客户">预定客户</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="together" class="col-sm-2 control-label">共同购房人</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control easyui-validatebox  "
                           data-options="required:true, novalidate:true"
                           validType="group"
                           id="together" name="together"/>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input style="width:100%" type="text" class="form-control easyui-validatebox  easyui-numberbox"
                           data-options="required:true, novalidate:true"
                           id="phone" name="phone" placeholder="请输入手机号:"/>
                </div>
            </div>
            <div class="form-group">
                <a style="position:absolute;left:240px;" class="btn btn-primary btn-lg"
                   onclick="updateCusInfo();">确认</a>
                <a style="position:absolute;left:440px;" class="btn btn-warning btn-lg"
                   onclick="closeWin('win')">关闭</a>
            </div>
        </form>

    </div>
</div>
<!--修改客户信息：结束-->
<!--上传文件：开始-->
<div id="uploadFile" class="easyui-window" title="上传文件"
     data-options="modal:true,closed:true,iconCls:'icon-save'"
     style="width:550px;height:470px;padding:10px;">
    <div class="col-sm-12">
        <form class="form-horizontal" id="uploadForm" >
            <div class="form-group">
                <div class="col-sm-6">
                    <input type="hidden" class="form-control" id="customer_id" name="id"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <input type="hidden" class="form-control" value="" name="fileType" id="fileType"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6" style="height: 300px;width: 340px">
                    <input type="file" multiple class="form-control file-preview" id="upload" name="upload"
                           data-overwrite-initial="false" data-max-file-count="1" style="height: 200px;width:100%;">
                </div><p/><p/><p/></p>
                <button type="button" class="btn btn-success" onclick="saveName();">完成</button><p/><p/></p><p/>
                <button type="button" class="btn btn-primary" onclick="closeWin('uploadFile');">取消</button>
            </div>
        </form>
    </div>
</div>
<!--上传文件：结束-->
</body>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>
<%--<script src="<%=path%>/public/plugins/bootstrap-fileupload/themes/fa/theme.js"></script>--%>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/fileinput.js"></script>
<script src="<%=path%>/public/plugins/bootstrap-fileupload/js/locales/zh.js"></script>
<script src="<%=path%>/public/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--自定义的js-->
<script src="<%=path%>/public/js/ye/employee-js/appointment.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_customer.js"></script>
<script src="<%=path%>/public/js/ye/employee-js/emp_common.js"></script>
<script src="<%=path%>/public/js/ye/valid/commonValid.js"></script>
<script src="<%=path %>/public/js/lai/load_form_data.js"></script>
<script src="<%=path %>/public/js/chen/customer.js"></script>
<script>
    $(function () {
        setPagination("list");
        formatCustomerStatus();
    })

</script>
<script>

    $("#upload").fileinput({
        language: 'zh',
        uploadUrl: '/customer/uploadFileCustomer', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png','txt', 'gif','pdf','doc','zip'],   //文件格式
        overwriteInitial: false,  // 覆盖初始的选中文件
        maxFileSize: 1150801652,   //单个文件大小的最大值
        maxFilesNum: 1, //
        //allowedFileTypes: ['image', 'video', 'flash'],
//        slugCallback: function (filename) {
//            // return filename.replace('(', '_').replace(']', '_');  // 更改默认的名字
//            //$('#upload').fileinput('reset');
//        }
    });
</script>
</html>
