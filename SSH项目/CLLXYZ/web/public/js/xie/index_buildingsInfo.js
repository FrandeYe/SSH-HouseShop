
function submitMessage(userId) {
    var messageContent = $("#messageContent").val();
    $.post(contextPath + "/message/save?userId=" + userId + "&buildingsId=" + buildingsId + "&content=" + messageContent + "&agencyId=" + agencyId,
        function (data) {
            // sweetAlert({
            //     title: data.controllerResult.message,
            //     type: "success"
            // });
            // $("#msgContent").val("");
            // $("#messageCount").text(parseInt($("#commentCount").text()) + 1);
            // getMessage(buildingsId);
            window.location.reload();
        }, "json");
}

function getMessage(buildingsId) {
    $.get(contextPath + "/message/pagerMessageBuildings?id=" + buildingsId,
        function (data) {
            var rows = data.rows;
            var showCount = 10;
            var length = showCount;
            if (rows.length <= showCount) {
                length = rows.length;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#messageDiv" + (9 - i)).hide();
                }
                for(var i=(showCount-hideCount-1); i>0;i--){
                    $("#messageDiv" + i).show();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#messageDiv" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = rows[i];
                for (var key in jsonObj) {
                    if (key == "user") {
                        $("#msgUserName" + i).text(jsonObj[key].name);
                    } else if (key == "content") {
                        $("#msgContent" + i).text(jsonObj[key]);
                    } else if (key == "leave_time") {
                        $("#leave_time" + i).text(formatDate(jsonObj[key]));
                    } else if (key == "reply_time") {
                        $("#reply_time" + i).text(formatDate(jsonObj[key]));
                    } else if (key == "agency") {
                        $("#msgAgencyName" + i).text(jsonObj[key].name);
                    } else if (key == "reply") {
                        if (jsonObj[key] == null) {
                            jsonObj[key] = "【暂无回复内容】";
                        }
                        $("#reply" + i).text(jsonObj[key]);
                    }
                }
            }
        },"json");
}

var allCommentCount = 0;
function loadAllComment() {
    $("#loadCommentBtn").text("已加载所有评论");
    $("#loadCommentBtn").attr("disabled",true);
    var addCount = allCommentCount - 10;
    for (var i = 0; i < allCommentCount; i++) {
        $("#commentLi" + i).show();
    }
    var commentUl = $("#commentUl");
    for (var i = 1; i <= addCount; i++) {
        var number = i + 10;
        commentUl.append('<li id="commentLi' + number + '">\n' +
            '                    <strong id="userName' + number + '"></strong>：<span id="commentContent' + number + '"></span>\n' +
            '                    <span id="commentTime' + number + '" class="list-time"></span>\n' +
            '                </li>');
    }
}

function getComment(id, pageSize) {
    var url = contextPath + "/comment/pagerCommentBuildings?id=" + id;
    if (pageSize != undefined) {
        url += "&pageSize=" + pageSize;
    }
    $.get(url,
        function (data) {
            var rows = data.rows;
            var showCount = 10;
            var length = showCount;
            allCommentCount = rows.length;
            if (allCommentCount <= showCount) {
                length = allCommentCount;
                var hideCount = showCount - length;
                for (var i = 0; i < hideCount; i++) {
                    $("#commentLi" + (9 - i)).hide();
                }
                for(var i=(showCount-hideCount-1); i>0;i--){
                    $("#commentLi" + i).show();
                }
            } else {
                for (var i = 0; i < length; i++) {
                    $("#commentLi" + i).show();
                }
            }
            for (var i = 0; i < length; i++) {
                var jsonObj = rows[i];
                for (var key in jsonObj) {
                    if (key == "user") {
                        $("#userName" + i).text(jsonObj[key].name);
                    } else if (key == "content") {
                        $("#commentContent" + i).text(jsonObj[key]);
                    } else if (key == "comment_time") {
                        $("#commentTime" + i).text(formatDate(jsonObj[key]));
                    }
                }
            }
        },"json");
}

//点击评论的时候隐藏留言
function showComment() {
    $("#commentDiv").show();
    $("#notLoginMessage").hide();
    $("#loginMessage").hide();
}

//点击留言的时候隐藏评论
function showMessage(buildingsId, userId) {
    $("#commentDiv").hide();
    if (userId == undefined || userId == "") {
        sweetAlert({
            title: "查看失败",
            text: "登录后才能查看留言",
            type: "warning"
        });
    } else {
        getMessage(buildingsId);
        $("#loginMessage").show();
    }
}

//当点击鼠标的时候，点赞的图片会变一张图片，也可以取消点赞
function changeLikeStatus(userId) {
    if (userId != undefined && userId != "") {
        var likeStr = $("#likeImg").attr("src");
        var noLike = contextPath + "/public/images/xie/noLike.jpg";
        var alreadyLike = contextPath + "/public/images/xie/alreadyLike.jpg";
        var likeCount = parseInt($("#likeCount").text());
        if(likeStr == noLike) {
            $("#likeImg").attr("src",alreadyLike);
            $("#likeCount").text(likeCount + 1);
        }
        if(likeStr == alreadyLike) {
            $("#likeImg").attr("src",noLike);
            $("#likeCount").text(likeCount - 1);
        }
        $.get(contextPath + "/like/changeLikeUser?userId=" + userId + "&buildingsId=" + buildingsId,
            function (data) {
                sweetAlert({
                    title: data.controllerResult.message,
                    text: "",
                    type: "success"
                });
            }, "json");
    } else {
        sweetAlert({
            title: "点赞失败",
            text: "登录后才能对楼盘进行点赞操作",
            type: "warning"
        });
    }
}

var buildingsId = "";
var agencyId = "";

function getBuildingsInfo(id) {
    $.post(contextPath + "/buildings/buildingsInfoIndex?id=" + id,
        function (data) {
            var buildings = data.buildingsIndexInfoVO;
            buildingsId = buildings["id"];
            for (var key in buildings) {
                $("#" + key).text(buildings[key]);
                if (key == "logo") {
                    $("#logoSrc").attr("src", contextPath + buildings[key]);
                } else if (key == "longitudeLatitude") {
                    $("#buildingsMap").attr("href", contextPath + "/buildings/showMap?" + buildings[key]);
                } else if (key == "agencyId") {
                    agencyId = buildings[key];
                    $("#agencyName").attr("href", contextPath + "/agency/showAgencyDetailIndex?id=" + buildings[key]);
                } else if (key == "id") {
                    $("#buildingsImg").attr("href", contextPath + "/buildingsImg/showBuildingsImg?id=" + buildings[key]);
                } else if (key == "booleanLike") {
                    if (buildings[key] == 1) {
                        $("#likeImg").attr("src", contextPath + "/public/images/xie/alreadyLike.jpg");
                    }
                }
            }
        },"JSON");
}

function getHouseImg(id) {
    $.get(contextPath + "/house/pagerHouseBuildings?id=" + id,
        function (data) {
            var housePicture = $("#housePicture");
            housePicture.empty();
            var houses = data.rows;
            $("#houseCount").text(houses.length);
            $.each(houses, function (index, house) {
                housePicture.append('<img title="' + house.name +'" class="img-responsive" src="' + house.logo +'"/>');
                housePicture.append('<br/>');
            })
        },"json");
}

function submitComment(userId) {
    if (userId != undefined && userId != "") {
        var content = $("#commentContent").val();
        $.post(contextPath + "/comment/save?userId=" + userId + "&buildingsId=" + buildingsId + "&content=" + content + "&agencyId=" + agencyId,
           function (data) {
               //
               // sweetAlert({
               //     title: data.controllerResult.message,
               //     type: "success"
               // });
               // $("#commentContent").val("");
               // $("#commentCount").text(parseInt($("#commentCount").text()) + 1);
               window.location.reload();
           },"json");
    } else {
        sweetAlert({
            title: "评论失败",
            text: "登录后才能对楼盘进行评论",
            type: "warning"
        });
    }
}
