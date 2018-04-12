<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/8/15
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

<html>
<head>
    <title>基础折线图</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css" type="text/css"/>
</head>
<body>
    <label for="yearsSelect">选择年份</label>
    <select id="yearsSelect" onchange="setChartsData()">
        <option value="2017">2017年</option>
        <option value="2016">2016年</option>
        <option value="2015">2015年</option>
        <option value="2014">2014年</option>
        <option value="2013">2013年</option>
        <option value="2012">2012年</option>
    </select>
    <label for="buildingsSelect">选择楼盘</label>
    <select id="buildingsSelect">
    </select>
    <button class="btn btn-primary btn-sm" onclick="setChartsData()">确定</button>
<div id="line"></div>

</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts-zh_CN.js"></script>
<script>
    $(function () {
        var id="${sessionScope.agency.id}";
        $.post("<%=path %>/buildings/pagerBuildingsAgencyVO?id=" + id,
            function (data) {
                if (data) {
                    for(var i = 0,len = data.nameIdVOList.length;i<len;i++){
                        $("#buildingsSelect").append('<option value="' + data.nameIdVOList[i].id + '"> ' + data.nameIdVOList[i].name + '</option>');
                    }
                }
            }, "json"
        );

    });
</script>

<script>
    function setChartsData() {
        var year =$("#yearsSelect").val();
        var id = $("#buildingsSelect").val();
        $.post("<%=path %>/employee/employeeSaleHouse?id=" + id + "&year=" + year,
            function (data) {
                if (data) {
                    employeeSaleHouse("line", data.series,data.title);
                }
            }, "json"
        );



    }

    function employeeSaleHouse(id, data,title) {
        new Highcharts.Chart(id, {
            // 图表的标题
            title: {
                text: title,
                x: -20
            },
            // 子标题
            subtitle: {
                text: '数据来源: www.house.com',
                x: -20
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
            },
            yAxis: {
                title: {
                    text: '销售金额(元)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '元'
            },
            // 图例
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            // 数据
            series: data
        });
    }
</script>

<script>


</script>
</html>
