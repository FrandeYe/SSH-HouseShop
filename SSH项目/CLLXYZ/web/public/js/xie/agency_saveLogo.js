function submitFile () {
    $.post("/agency/uploadHeadIcon",
        $("#form").serialize(),
        function (data) {
            if(data.controllerResult=="success"){
                alert("public/js/xie/agency_saveLogo.js:9");
                window.location.href =contextPath + "/agency/agency_index.jsp";
            }
        },"json"
    );
}