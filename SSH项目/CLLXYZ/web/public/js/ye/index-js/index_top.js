var contextPath="";
var urlPath = window.location.pathname;
function over(id){
    document.getElementById(id).style.background="#0b76ac";
    $('a',"#"+id).attr("style","color:white");
    liColor();
}
function out(id){
    document.getElementById(id).style.background="#f8f8f8";
    $('a',"#"+id).attr("style","color:#777");
    liColor();
}

function liColor() {
    if ("/index/showHome"==urlPath){
        $("#L1").attr("style","background:#0b76ac");
        $("#la1").attr("style","color:white");
    }
    if ("/agency/showPagerAgencyIndex"==urlPath){
        $("#L5").attr("style","background:#0b76ac");
        $("#la5").attr("style","color:white");
    }
    if ("/buildings/showBuildings"==urlPath){
        $("#L2").attr("style","background:#0b76ac");
        $("#la2").attr("style","color:white");
    }
    if ("/activity/showActivities"==urlPath){
        $("#L3").attr("style","background:#0b76ac");
        $("#la3").attr("style","color:white");
    }
    if ("/article/showArticles"==urlPath){
        $("#L4").attr("style","background:#0b76ac");
        $("#la4").attr("style","color:white");
    }
}
function showGlobalSearch() {
    var name = $("#searchInput").val();
    window.open("/globalSearch/showSearchPage?name=" + name, "_self");
}
