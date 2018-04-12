function formatSaleStatus () {
    $('#list').datagrid({
        rowStyler:function(index,row){
            if (row.sale_status=="待售中"){
                return 'background-color:#FF9933;';
            }
            if (row.sale_status == "已售出") {
                return 'background-color:\n' +
                    '#FFCC99;';
            }
        }
    });
}

function formatName(value) {
    return value.name;
}

function validActivity() {
    var row = $("#list").datagrid("getSelected");
    alert(row.id);
    alert(row.sale_satus);
}

function setRoomTable() {
    var id = $("#building").val();
    $("#list").datagrid("reload", "/room/pagerRoomBuilding?id=" + id);
}

function saveRoom() {
    closeDig('dlg');
    $.post("/room/saveRoom",
        $("#addForm").serialize(),
        function (data) {
            showAlert(data.controllerResult.message);
            window.location.href = "agency_roomNumber.jsp";
        },"json");
}

function setHouse() {
    var buildings = $("#buildings").val();
    var building = $("#building").val();
    $.post("/house/pagerHouseBuildingsVO?id=" + buildings + "&buildingId=" + building,
        function(data) {
            if(data) {
                //例如一个楼栋一层最多有三个房间，则len为3，一楼的房号为101,102,103.
                var len = data.total;
                var hiddenDiv = $("#hiddenDiv");
                hiddenDiv.empty();
                for (var i = 0; i < len; i++) {
                    var divLabelBegin = '<div class="form-group">\n' +
                        '                    <label class="col-sm-2 control-label">'+(i+1) +'号房间户型</label>\n' +
                        '                    <div class="col-sm-6">';

                    var selectStr = '<select id="house'+ (i+1) +'" name="name_house'+ (i+1) +'" class="form-control ">\n' +
                        '\n' +
                        '                        </select>';

                    var divEndStr = '</div>\n' +
                        '                </div>';
                    hiddenDiv.append(divLabelBegin + selectStr + divEndStr);

                    var houseSelect = $("#house" + (i+1));
                    $.each(data.nameIdVOList, function (index, house) {
                        houseSelect.append('<option value="' + house.id + '"> ' + house.name + '</option>');
                    });

                }

            }
        }
        )
}