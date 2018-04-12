function getArticleInfo(id) {
    $.post(contextPath + "/article/articleInfo?id=" + id,
        function (data) {
            var article = data.article;
            for (var a in article) {
                if (a == "created_time") {
                    article[a] = formatDate(article[a]);
                }
                $("#" + a).text(article[a]);
                if (a == "logo") {
                    $("#logoSrc").attr("src", contextPath + article[a]);
                }
            }
        },"JSON");
}

var articlePageCount = 0;
var articleCurrentPage = 1;

function getAllArticleData(page) {
    $("#articleCurrentPage").text(page);
    var showCount = 9;
    $.post("/article/pagerArticleIndex?page=" + page,
        function (data) {
            var jsonList = data.rows;
            articleCurrentPage = data.page;
            articlePageCount = data.total;
            console.log("articleCurrentPage:" + articleCurrentPage);
            console.log("articlePageCount:" + articlePageCount);
            $("#articleTotalPage").text(articlePageCount);
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
                    if (objKey == "created_time") {
                        jsonObj[objKey] = formatDate(jsonObj[objKey]);
                    }
                    $("#" + objKey + i).text(jsonObj[objKey]);
                    if (objKey == "logo") {
                        $("#logoSrc" + i).attr("src", contextPath + jsonObj[objKey]);
                    }
                    if (objKey == "id") {
                        $("#logoHref" + i).attr("href", contextPath + "/article/showArticleInfo?id=" + jsonObj[objKey]);
                    }
                }
            }
        }, "json"
    );
}

function lastArticlePage() {
    var page = articleCurrentPage - 1;
    if (page < 1) {
        page = 1;
    }
    getAllArticleData(page);
}

function nextArticlePage() {
    var page = articleCurrentPage + 1;
    if (page > articlePageCount) {
        page = articlePageCount;
    }
    getAllArticleData(page);
}

function finallyArticlePage() {
    getAllArticleData(articlePageCount);
}