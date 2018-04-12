/**
 * Created by Administrator on 2017/9/21.
 */

function agencyDetail(id) {
    $.post("/agency/showAgencyDetail?id="+id,
        function (data) {
            var jsonObj = data.agency;
            for(var objKey in jsonObj){      // 对象里的属性名
                if (objKey == "logo") {
                    $("#agency-src").attr("src",jsonObj[objKey]);
                }
                if (objKey=="name"){
                    $("#agency-name").text(jsonObj[objKey]);
                }
                if(objKey=="email"){
                    $("#agency-email").text(jsonObj[objKey]);
                }
                if(objKey=="leader"){
                    $("#agency-leader").text(jsonObj[objKey]);
                }
                if(objKey=="phone"){
                    $("#agency-phone").text(jsonObj[objKey]);
                }
                if(objKey=="tel"){
                    $("#agency-tel").text(jsonObj[objKey]);
                }
                if(objKey=="intro"){
                    $("#agency-intro").text(jsonObj[objKey]);
                }
                if(objKey=="address"){
                    $("#agency-address").text(jsonObj[objKey]);
                }
            }
        }, "json"
    );
}

function showEmployeeIndex(page,id) {
    var showCount = 4;
    $.post("/employee/showEmployees?page=" + page +"&id=" + id,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if (jsonList.length==0){
                $("#fourEmployees").hide();
            }else {
                if (jsonList.length<showCount){
                    length = jsonList.length;
                    var hiddenCount = showCount -length;
                    for (var i = 0; i < hiddenCount; i++) {
                        $("#employee" + (3 - i)).hide();
                    }
                } else {
                    for (var i = 0; i < length; i++) {
                        $("#employee" + i).show();
                    }
                }
                for (var i=0;i< length;i++){
                    var jsonObj = jsonList[i];
                    for(var objKey in jsonObj){
                        $("#" + objKey + i).text(jsonObj[objKey]);   // 先自己设置好页面的id序号,通过本 js 自动加载,对应id内的文本值
                        if (objKey == "headicon") {
                            $("#headicon" + i).attr("src",jsonObj[objKey]);
                        }
                        if (objKey=="id"){
                            $("#id"+i).val(jsonObj[objKey]);
                        }
                    }
                }
            }
        }
    )
}

function saveAppointment() {
    var select_id = $("#select option:selected").val()
    $("#house_id").val(select_id);
    $.post("/appointment/saveAppointment",
        $("#form").serialize(),
        function (data) {
            if (data.controllerResult.result == "success") {
                sweetAlert(data.controllerResult.message);
                window.location.reload()
            }else{
                showAlert(data.controllerResult.message);
            }
        },"json"
    );
}

function showActivityIndex(page,id) {
    var showCount = 4;
    $.post("/activity/pagerActivityIndex?page=" + page+"&id=" +id ,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if(jsonList.length==0){
                $("#fourActivities").hide();
            }else{
                if (jsonList.length<showCount){
                    length = jsonList.length;
                    var hiddenCount = showCount -length;
                    for (var i = 0; i < hiddenCount; i++) {
                        $("#activity" + (3 - i)).hide();
                    }
                } else {
                    for (var i = 0; i < length; i++) {
                        $("#activity" + i).show();
                    }
                }
                for (var i=0;i< length;i++){
                    var jsonObj = jsonList[i];
                    for(var objKey in jsonObj){
                        $("#activity" + objKey + i).text(jsonObj[objKey]);   // 先自己设置好页面的id序号,通过本 js 自动加载,对应id内的文本值
                        if (objKey == "logo") {
                            $("#activityImage" + i).attr("src",jsonObj[objKey]);
                        }
                        if (objKey=="id"){
                            $("#activityImageHref"+i).attr("href","/activity/showActivityInfo?id=" + jsonObj[objKey]);
                            $("#activitytitle"+i).attr("href","/activity/showActivityInfo?id=" + jsonObj[objKey])
                            $("#idActivity"+i).val(jsonObj[objKey]);
                        }
                    }
                }
            }
        }
    )
}

function showBuildingsIndex(page,id) {
    var showCount = 4;
    $.post("/buildings/showBuildingsIndex?page=" + page+"&id="+id,
        function (data) {
            var jsonList = data.rows;
            var length = showCount;
            if (jsonList.length==0){
                $("#fourFloor").hide();
            }else{
                if (jsonList.length<showCount){
                    length = jsonList.length; // 2
                    var hiddenCount = showCount -length; // 2
                    for (var i = 0; i < hiddenCount; i++) {
                        $("#floor" + (3 - i)).hide();
                    }
                } else {
                    for (var i = 0; i < length; i++) {
                        $("#floor" + i).show();
                    }
                }
                for (var i=0;i< length;i++){ // i=1
                    var jsonObj = jsonList[i];
                    for(var objKey in jsonObj){
                        $("#floor" + objKey + i).text(jsonObj[objKey]);   // 先自己设置好页面的id序号,通过本 js 自动加载,对应id内的文本值
                        if (objKey == "logo") {
                            $("#floorlogo" + i).attr("src",jsonObj[objKey]);
                        }
                        if (objKey=="id"){
                            // $("#floorlogoHref"+ i).attr("href","/buildings/showBuildingsInformation?id ="+  jsonObj[objKey]);
                            // $("#floorname"+ i).attr("href","/buildings/showBuildingsInformation?id ="+ jsonObj[objKey]);
                            $("#floorId"+i).val(jsonObj[objKey]);
                        }
                    }
                }
            }
        }
    )
}