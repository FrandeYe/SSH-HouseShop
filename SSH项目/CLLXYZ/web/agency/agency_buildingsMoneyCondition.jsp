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
    <link rel="stylesheet" href="<%=path%>/public/plugins/bootstrap/css/bootstrap.css" type="text/css"/>
</head>
<body>
<label for="yearsSelect">选择年份</label>
<select id="yearsSelect" onchange="setChartsData();">
    <option value="2017">2017年</option>
    <option value="2016">2016年</option>
    <option value="2015">2015年</option>
    <option value="2014">2014年</option>
    <option value="2013">2013年</option>
    <option value="2012">2012年</option>
</select>
<button class="btn btn-primary btn-sm" onclick="setChartsData()">确定</button>
<div id="lin"></div>
</body>
<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts.js"></script>
<script src="<%=path %>/public/plugins/highcharts/highcharts-zh_CN.js"></script>
<script>
    function setChartsData() {
        var year =$("#yearsSelect").val();
        $.get("<%=path %>/buildings/buildingsMoneyTotal?id=${sessionScope.agency.id}"+"&year="+year,
            function (data) {
                lineChart("#lin", data.series,data.title);
            }, "json"
        );
    };

    function lineChart(id, data,title) {
        $(id).highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text:title
            },
            subtitle: {
                text: '数据来源: www.ht.com'
            },
            xAxis: {
                categories: [
                    '一月',
                    '二月',
                    '三月',
                    '四月',
                    '五月',
                    '六月',
                    '七月',
                    '八月',
                    '九月',
                    '十月',
                    '十一月',
                    '十二月'
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: '销售额 (元)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: data
        });
    }

</script>
</html>
