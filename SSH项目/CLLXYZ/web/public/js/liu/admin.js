/**
 * Created by Administrator on 2017/9/12.
 */
function submitFile() {
    $(function () {
        $.post(contextPath+"/admin/adminUpdatePwd",
            $("#form").serialize(),
            function (data) {
                window.location.href="admin_login.jsp";
            },"json"
        )
    });
}