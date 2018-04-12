var pageCount = 0;
var currentPage = 1;
var buildingsId = "";

function getAllBuildingsImgData(id, page) {
    buildingsId = id;
    $("#currentPage").text(page);
    var showCount = 12;
    $.post("/buildingsImg/pagerBuildingsImgIndex?page=" + page + "&id=" + id,
        function (data) {
            var jsonList = data.rows;
            $("#buildingsName").text(jsonList[0].buildings.name);
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
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "img_path") {
                        $("#logoSrc" + i).attr("src",jsonObj[objKey]);
                    }
                    if (objKey == "img_des") {
                        $("#logoSrc" + i).attr("alt", jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );
}
function firstBuildingsImgPage() {
    getAllBuildingsImgData(buildingsId, 1);
}

function lastBuildingsImgPage() {
    var page = currentPage - 1;
    if (page < 1) {
        page = 1;
    }
    getAllBuildingsImgData(buildingsId,page);
}

function nextBuildingsImgPage() {
    var page = currentPage + 1;
    if (page > pageCount) {
        page = pageCount;
    }
    getAllBuildingsImgData(buildingsId,page);
}

function finallyBuildingsImgPage() {
    getAllBuildingsImgData(buildingsId,pageCount);
}