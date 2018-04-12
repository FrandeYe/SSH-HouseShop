var buildingsPageCount = 0;
var buildingsCurrentPage = 1;
var area = "";
/**
 * 筛选楼盘
 */
function getAreaSelectBuildings(page,areaSelect) {
    if (page <= 1) {
        page = 1;
        $("#lastLi").hide();
        $("#nextLi").show();
    }
    area = areaSelect;
    $("#buildingsCurrentPage").text(page);
    var showCount = 5;
    $.post("/buildings/queryByAreaSelect?page=" + page+"&areaSelect="+areaSelect,
        function (data) {
            var jsonList = data.buildingsIndexVOList;
            if(jsonList.length<=0){
                swal({
                    title: "该地区暂无数据！",
                    text: "请稍后访问",
                    type: "warning",
                    timer:10
                });
                return;
            }
            buildingsCurrentPage = data.page;
            buildingsPageCount = data.total;
            $("#buildingsTotalPage").text(buildingsPageCount);
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#row" + (4 - i)).hide();
                }
                for(var i=(showCount-hideCount-1); i>0;i--){
                    $("#row" + i).show();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#row" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                for (var objKey in jsonObj) {
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "logo") {
                        $("#logoSrc" + i).attr("src", jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#logoHref" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                        $("#pictureHref" + i).attr("href", contextPath + "/buildingsImg/showBuildingsImg?id=" + jsonObj[objKey]);
                        $("#name" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                    }
                    if (objKey == "longitudeLatitude") {
                        $("#mapHref" + i).attr("href", contextPath + "/buildings/showMap?" + jsonObj[objKey]);
                    }
                    if (objKey == "agencyId") {
                        $("#agencyName" + i).attr("href", contextPath + "/agency/agencyInfoIndex?id=" + jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );
}

/**
 * 楼盘分页
 * @param page
 */
function getAllBuildingsData(page) {
    var page = buildingsCurrentPage - 1;
    if (page <= 1) {
        page = 1;
        $("#lastLi").hide();
        $("#nextLi").show();
    }
    $("#buildingsCurrentPage").text(page);
    var showCount = 5;
    $.post("/buildings/pagerBuildingsIndexVO?page=" + page,
        function (data) {
            var jsonList = data.buildingsIndexVOList;
            buildingsCurrentPage = data.page;
            buildingsPageCount = data.total;
            $("#buildingsTotalPage").text(buildingsPageCount);
            console.log("buildingsCurrentPage:" + buildingsCurrentPage);
            console.log("buildingsPageCount:" + buildingsPageCount);
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#row" + (4 - i)).hide();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#row" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                for (var objKey in jsonObj) {
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "logo") {
                        $("#logoSrc" + i).attr("src",jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#logoHref" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                        $("#pictureHref" + i).attr("href", contextPath + "/buildingsImg/showBuildingsImg?id=" + jsonObj[objKey]);
                        $("#name" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                    }
                    if (objKey == "longitudeLatitude") {
                        $("#mapHref" + i).attr("href", contextPath + "/buildings/showMap?" + jsonObj[objKey]);
                    }
                    if (objKey == "agencyId") {
                        $("#agencyName" + i).attr("href", contextPath + "/agency/agencyInfoIndex?id=" + jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );

}

/**
 * 查看所有楼盘的分页按钮
 */
function indexBuildings() {
    if (null==area){
        getAllBuildingsData(1);
    }else {
        getAreaSelectBuildings(1,area);
    }
}

function lastBuildingsPage() {
    var page = buildingsCurrentPage - 1;
    if (page <= 1) {
        page = 1;
        $("#lastLi").hide();
        $("#nextLi").show();
    }
    if (null==area){
        getAllBuildingsData(page);
    }else {
        getAreaSelectBuildings(page,area);
    }
}

function nextBuildingsPage() {
    var page = buildingsCurrentPage + 1;
    if (page >= buildingsPageCount) {
        page = buildingsPageCount;
        $("#nextLi").hide();
        $("#lastLi").show();
    }
    if (null==area){
        getAllBuildingsData(page);
    }else {
        getAreaSelectBuildings(page,area);
    }
}

function finallyBuildingsPage() {
    if (null==area){
        getAllBuildingsData(buildingsPageCount);
    }else {
        getAreaSelectBuildings(buildingsPageCount,area);
    }
}

function areaList() {
    var areaList ={
        0: '章贡区',
        1: '南康区',
        2: '赣县',
        3: '信丰县',
        4: '大余县',
        5: '上犹县',
        6: '崇义县',
        7:'安远县',
        8: '龙南县',
        9: '定南县',
        10: '全南县',
        11: '宁都县',
        12: '于都县',
        13: '兴国县',
        14: '会昌县',
        15: '寻乌县',
        16: '石城县',
        17: '瑞金市'
    }
    for(var a=0;a<18;a++){
        $("#a"+a).text(areaList[a]);
        $("#a"+a).attr("onclick","getAreaSelectBuildings(1,$(this).text());");
    }

}