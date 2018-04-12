contextPath = "";

/**
 * 首页区域筛选
 */
function getAreaBuildings() {
    var options=$("#district option:selected"); //获取选中的项
    // alert(options.val()); //拿到选中项的值
    // alert(options.text()); //拿到选中项的文本
    var area = options.text();
    var showCount = 4;
    $.post(
        contextPath+"/buildings/queryByArea?area="+area,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#row" + ((showCount - 1) - i)).hide();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#row" + i).show();
                }
            }
            for(var i=0;i<length;i++){
                var jsonObj = jsonList[i];
                for (var key in jsonObj){
                    $("#" + key + i).text(jsonObj[key]);
                    if (key == "name") {
                        $("#bdsName" + i).text(jsonObj[key]);
                    }
                    if (key == "logo") {
                        $("#bdsSrc" + i).attr("src", contextPath + jsonObj[key]);
                    }
                    if (key == "id") {
                        $("#bdsHref" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[key]);
                        $("#pictureHref" + i).attr("href", contextPath + "/buildingsImg/showBuildingsImg?id=" + jsonObj[key]);
                        $("#bdsName" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[key]);
                    }
                    if (key == "meanPrice") {
                        $("#bdsPrice" + i).text(jsonObj[key]);
                    }
                    if (key == "building_area") {
                        $("#bdsArea" + i).text(jsonObj[key]);
                    }
                }
            }
        },
        "json"
    );
}

/**
 * 首页广告
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
 * 首页楼盘
 */

function getBuildingsData(page) {
    var showCount = 10;
    $.post("/buildings/pagerBuildingsIndex?page=" + page,
        function (data) {
            var jsonList = data.buildingsIndexVOList;
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#row" + ((showCount - 1) - i)).hide();
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
                    if (objKey == "name") {
                        $("#bdsName" + i).text(jsonObj[objKey]);
                        $("#bdsName" + i).attr("title",jsonObj[objKey]);
                        $("#bdsSrc" + i).attr("title",jsonObj[objKey]);
                        $("#bdsHref" + i).attr("title",jsonObj[objKey]);
                    }
                    if (objKey == "logo") {
                        $("#bdsSrc" + i).attr("src", contextPath + jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#bdsHref" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                        $("#pictureHref" + i).attr("href", contextPath + "/buildingsImg/showBuildingsImg?id=" + jsonObj[objKey]);
                        $("#bdsName" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey]);
                    }
                    if (objKey == "meanPrice") {
                        $("#bdsPrice" + i).text(jsonObj[objKey]);
                    }
                    if (objKey == "building_area") {
                        $("#bdsArea" + i).text(jsonObj[objKey]);
                    }
                    if (objKey == "beginPrice") {
                        $("#beginPrice" + i).text(jsonObj[objKey]);
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
 *首页文章
 */
function getArticleTitle(page) {
    var showCount = 9;
    $.post("/article/pagerArticleIndex?page=" + page,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#article" + ((showCount - 1) - i)).hide();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#article" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                for (var objKey in jsonObj) {
                    if (objKey == "title") {
                        $("#article" + i).text(jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#article" + i).attr("href", contextPath + "/article/showArticleInfo?id=" + jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );
}

/**
 *首页活动
 */
function getActivityTitle(page) {
    var showCount = 2;
    $.post(
        "/activity/ActivityIndex?page=" + page,
        function (data) {
            var jsonList = data.rows;
            var length = jsonList.length;
            if (length < showCount) {
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#act" + ((showCount - 1) - i)).hide;
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#act" + i).show;
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                for (var objKey in jsonObj) {
                    if (objKey == "logo") {
                        $("#actSrc" + i).attr("src", contextPath + jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#actHref" + i).attr("href", contextPath + "/activity/showActivityInfo?id=" + jsonObj[objKey]);
                    }
                    if (objKey == "title"){
                        $("#actSrc"+i).attr("title","活动："+jsonObj[objKey]);
                    }
                }
            }
        }
    );
}