var currentPage;
var pageCount;

function getData(page) {
    $("#currentPage").text(page);
    var showCount = 5;
    $.post("/activity/pagerActivityIndexMore?page=" + page,
        function (data) {
            var jsonList = data.rows;
            currentPage = data.page;
            pageCount = data.total;
            $("#totalPage").text(pageCount);
            var length = showCount;
            if (jsonList.length < showCount) {
                length = jsonList.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#item" + ((showCount - 1) - i)).hide();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#item" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = jsonList[i];
                for (var objKey in jsonObj) {
                    if (objKey == "start_time" || objKey == "end_time") {
                        jsonObj[objKey] = formatDate(jsonObj[objKey]);
                    }
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "buildings") {
                        if (jsonObj[objKey]) {
                            $("#buildingsName" + i).text(jsonObj[objKey].name);
                            $("#buildingsName" + i).attr("href", contextPath + "/buildings/showBuildingsInfo?id=" + jsonObj[objKey].id);
                        } else {
                            $("#buildingsName" + i).text("平台活动，无所属楼盘");
                            $("#buildingsName" + i).attr("href", "javascript:void(0);");
                        }
                    }
                    if (objKey == "agency") {
                        if (jsonObj[objKey]) {
                            $("#agencyName" + i).text(jsonObj[objKey].name);
                            $("#agencyName" + i).attr("href", contextPath + "/agency/showAgencyInfo?id=" + jsonObj[objKey].id);
                        } else {
                            $("#agencyName" + i).text("平台活动，无所属商家");
                            $("#agencyName" + i).attr("href", "javascript:void(0);");
                        }
                    }
                    if (objKey == "logo") {
                        $("#logoSrc" + i).attr("src", jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#logoHref" + i).attr("href", contextPath + "/activity/showActivityInfo?id=" + jsonObj[objKey]);
                        $("#title" + i).attr("href", contextPath + "/activity/showActivityInfo?id=" + jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );
}

function lastPage() {
    var page = currentPage - 1;
    if (page < 1) {
        page = 1;
    }
    getData(page);
}

function nextPage() {
    var page = currentPage + 1;
    if (page > pageCount) {
        page = pageCount;
    }
    getData(page);
}

function finallyPage() {
    getData(pageCount);
}