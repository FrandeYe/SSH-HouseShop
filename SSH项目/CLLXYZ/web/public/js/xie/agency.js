/***
 *只查询经销商底下的楼盘
 */
function setBuildings(id) {
    $.post("/buildings/pagerBuildingsAgencyVO?id=" + id,
        function (data) {
            if (data) {
                var buildingsSelect = $("#buildings");
                $.each(data.nameIdVOList, function (index, buildings) {
                    buildingsSelect.append('<option value="' + buildings.id + '"> ' + buildings.name + '</option>');
                });
            }
        }, "json"
    );
}

//根据楼盘id来选择楼栋
function setBuilding(roomStatus) {
    var buildings = $("#buildings").val();
    $.post("/building/pagerBuildingBuildingsVO?id=" + buildings + "&roomStatus=" + roomStatus,
        function (data) {
            if (data) {
                var buildingsSelect = $("#building");
                buildingsSelect.empty();
                $.each(data.nameIdVOList, function (index, building) {
                    buildingsSelect.append('<option value="' + building.id + '"> ' + building.name + '</option>');
                });
            }}, "json");
}