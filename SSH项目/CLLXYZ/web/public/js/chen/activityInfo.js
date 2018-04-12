/**
 * Created by ccf on 2017/9/18.
 */
function getActivityInfo(id) {
    $.post(contextPath + "/activity/activityInfo?id=" + id,
        function (data) {
            var activity = data.activity;
            for (var a in activity) {
                if(a=="start_time"||a=="end_time"){
                    activity[a] = formatDate(activity[a]);
                }
                $("#" + a).text(activity[a]);
                if (a == "logo") {
                    $("#logoSrc").attr("src", activity[a]);
                }
            }
        },"JSON");
}
