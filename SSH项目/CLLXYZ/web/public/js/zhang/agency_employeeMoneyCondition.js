/**
 * 只查询经销商底下的员工
 */
function employee(id) {
    $.post("<%=path %>/employee/pagerEmployeeAgencyVO?id=" + id,
        function (data) {
            if (data) {
                for(var i = 0,len = data.nameIdVOList.length;i<len;i++){
                    $("#empSelect").append('<option value="' + data.nameIdVOList[i].id + '"> ' + data.nameIdVOList[i].name + '</option>');
                }
            }
        }, "json"
    );
}

function setChartsData() {
    alert($("#empselect option").val());
    alert("agency/agency_employeeMoneyCondition.jsp?id=");
}