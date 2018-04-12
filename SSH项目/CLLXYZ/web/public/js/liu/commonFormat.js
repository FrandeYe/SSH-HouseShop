/**
 * Created by Administrator on 2017/9/9.
 */
    function formatObject(object) {
        if(object==null){
            return "无";
        }else{
            return object.name;
        }
}
function formatGander(value) {
    if(value=="m"){
        return"男";
    }
    if(value=="f"){
        return "女";
    }
}
function formatImage(value,row,index) {
    if(row.headicon){
        return "<img style='width:auto;height:50px;' border='1 red'  src='"+row.headicon+"'/>";
    }
}
function formatLogo(value,row,index) {
    if(row.logo){
        return "<img style='width:auto;height:50px;' border='1 red'  src='"+row.logo+"'/>";
    }
}

function formatImgPath(value,row,index) {
    if(row.img_path){
        return "<img style='width:auto;height:50px;' border='1 red'  src='"+row.img_path+"'/>";
    }
}
function formatCheckStatus(value) {
    if (value==1){
        return "已通过";
    } else {
        return "未通过";
    }
}