var currentPage = 1;
var pageCount = 0;

//首页
function getSearchData(page, name) {
    $("#currentPageSpan").text(page);
    if (name == undefined) {
        name = $("#newSearchInput").val();
    }
    var showCount = 8; //每页显示多少个
    $.post("/globalSearch/globalSearchNavigate?page=" + page + "&name=" + name,
        function (data) {
            var rows = data.globalSearchVOList;
            if (data.controllerResult.result == "fail") {
                sweetAlert({
                    title: "搜索失败！",
                    text: data.controllerResult.message,
                    type: "warning"
                });
            } else {
                $("#searchCount").text(data.idCount);
                $("#searchContent").text(name);
                currentPage = data.page;
                pageCount = data.total;
                $("#totalPageSpan").text(pageCount);
                var length = showCount;
                if (rows.length <= showCount) {
                    length = rows.length;
                    var hideCount = showCount - length;
                    for (var i = 0; i < hideCount; i++) {
                        $("#item" + (7 - i)).hide();
                    }
                    for(var i=(showCount-hideCount-1); i>0;i--){
                        $("#item" + i).show();
                    }
                } else {
                    for (var i = 0; i < length; i++) {
                        $("#item" + i).show();
                    }
                }
                for (var i = 0; i < length; i++) {
                    var jsonObj = rows[i];
                    for (var key in jsonObj) {
                        $("#" + key + i).text(jsonObj[key]);
                        if (key == "logo") {
                            $("#logoSrc" + i).attr("src", jsonObj[key]);
                        } else if (key == "href") {
                            $("#logoHref" + i).attr("href", jsonObj[key]);
                            $("#name" + i).attr("href", jsonObj[key]);
                        }
                    }
                }
            }
        },"json");


}

//上一页
function lastPage() {
    var page = currentPage - 1;
    if(page < 1) {
        page = 1;
    }
    getSearchData(page);
}

//下一页
function nextPage() {
    var page = currentPage + 1;
    if( page > pageCount) {
        page = pageCount;
    }
    getSearchData(page);
}

//尾页
function finallyPage() {
    getSearchData(pageCount);
}