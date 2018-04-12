var agencyPageCount = 0;
var agencyCurrentPage = 1;
var contextPath = "";

/**
 * 广告
 * @param page
 * @constructor
 */
function getAds(page) {
    var showCount = 5;
    $.get("/ads/pagerAdsIndex?page=" + page,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hidCount = showCount - length;
                for (var i = 0; i < hidCount; i++) {
                    $("#adsSrc" + ((showCount - 1) - i)).hide;
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#adsSrc" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                var keys = [];      //重新组装，排序。让show_order在logo前获取到
                keys.push("id");
                keys.push("show_order");
                keys.push("ad_url");
                keys.push("logo");
                keys.push("title");
                //组装key结束

                var newJsonObj = {};        //组装新对象
                for(var newI = 0; newI<keys.length;newI++){
                    var key = keys[newI];
                    newJsonObj[key] = jsonObj[key];
                }

                var ads_order;  //定义变量接收广告的位置
                for (var objKey in newJsonObj) {
                    if (objKey == "show_order") {
                        ads_order = newJsonObj[objKey];
                    }
                    if (objKey == "logo") {
                        if (ads_order != undefined) {
                            $("#adsSrc" + ads_order).attr("src", contextPath + newJsonObj[objKey]);
                        }
                    }
                    if (objKey == "title") {
                        $("#adsSrc" + ads_order).attr("title", "广告："+newJsonObj[objKey]);
                    }
                    if (objKey == "ad_url") {
                        $("#adsHref" + ads_order).attr("href", contextPath + newJsonObj[objKey]);
                    }
                }
            }
        }, "json");
}
/**
 * 所有经销商分页
 * @param page
 * @constructor
 */
function AllAgencyData(page) {
    $("#agencyCurrentPage").text(page);
    var showCount = 6;
    $.post(
        "/agency/pagerAgencyIndex?page="+page,
        function (data) {
            var jsonList = data.rows;
            agencyPageCount = data.total;
            agencyCurrentPage = data.page;
            $("#agencyTotalPage").text(agencyPageCount);
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#block" + (5 - i)).hide();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#block" + i).show();
                }
            }
            for (var i=0;i< length;i++){
                var jsonObj = jsonList[i];
                for(var objKey in jsonObj){
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "logo") {
                        $("#logoSrc" + i).attr("src",contextPath+jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#logoHref" + i).attr("href",contextPath+"/employee/showAgencyDetailIndex?id=" + jsonObj[objKey]);
                        $("#name" + i).attr("href",contextPath+"/employee/showAgencyDetailIndex?id=" + jsonObj[objKey]);
                    }
                    if (objKey == "name"){
                        $("#logoSrc"+i).attr("title",jsonObj[objKey]);
                    }
                }
            }
        },
        "json"
    );
}

/**
 * 上一页
 */
function lastAgencyPage() {
    var page = agencyCurrentPage-1;
    if (page <= 1) {
        page = 1;
        $("#lastLi").hide();
        $("#nextLi").show();
    }
    AllAgencyData(page);
}
/**
 *下一页
 */
function nextAgencyPage() {
    var page = agencyCurrentPage+1;
    if (page >= agencyPageCount) {
        page = agencyPageCount;
        $("#lastLi").show();
        $("#nextLi").hide();
    }
    AllAgencyData(page);
}

/**
 * 最后一页
 */
function finalAgencyPage() {
    getAllAgencyData(agencyPageCount);
}

