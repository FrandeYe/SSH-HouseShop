 /**
 * Created by Administrator on 2017/9/5.
 */
function submitFile () {
     if (formValidate("saveForm")) {
         $.post(contextPath + "/activity/saveActivity",
             $("#saveForm").serialize(),
             function (data) {
                 if (data.controllerResult.result == "success") {
                     showAlert(data.controllerResult.message);
                     window.location.href = "admin_activity.jsp";
                 } else {
                     showAlert(data.controllerResult.message);
                 }
             }, "json"
         );
     }
}