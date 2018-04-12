var contextPath = "";
var homeTabTitle = '主页';

/**
 * 用于动态添加选项卡
 * @param title 选项卡的标题
 * @param url 选项卡要显示的内容的url
 */
function addTab(title, url) {
    if ($('#tabs').tabs('exists', title)) { // 如果当前选项卡已经存在（已经打开过）
        $('#tabs').tabs('select', title); // 直接显示选项卡
        var currTab = $('#tabs').tabs('getSelected'); // 哪个选项卡被选中了
        var url1 = $(currTab.panel('options').content).attr('src'); // 获取当前选中的选项卡的url
        if(url1 != undefined && currTab.panel('options').title != homeTabTitle) { // 如果当前选项卡的标题不是 主页
            $('#tabs').tabs('update',{ // 把显示 出的选项卡的内容更新
                tab:currTab,
                options:{
                    content:createFrame(url1)// 创建frame窗口
                }
            })
        }
    } else { // 如果选项卡不存在
        $('#tabs').tabs('add', { // 添加选项卡
            title: title,
            content: createFrame(url), // 创建frame窗口用于显示内容
            border: false,
            closable: true
        });
    }
    tabClose();
}

/**
 * 创建iframe窗口
 * @param url
 * @returns {string}
 */
function createFrame(url) {
    return '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
}

/**
 * 用于显示关闭，刷新tab页的右键菜单
 */
function tabClose() {
    // 双击某个tab页时,关闭该tab页
    $(".tabs-inner").dblclick(function(){
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close', subtitle);
    });
    // 给所有选项卡绑定上下文菜单（右键菜单）
    $(".tabs-inner").bind('contextmenu',function(e){
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        var subtitle =$(this).children(".tabs-closable").text();

        $('#mm').data("currtab", subtitle);
        $('#tabs').tabs('select', subtitle);
        return false;
    });
}

/**
 * 绑定选项卡的右键菜单每一个选项的点击事件
 */
function tabCloseEvent() {
    // 绑定刷新
    $('#mm-tabupdate').click(function(){
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        if(url != undefined && currTab.panel('options').title != homeTabTitle) {
            $('#tabs').tabs('update',{
                tab:currTab,
                options:{
                    content:createFrame(url)
                }
            })
        }
    })
    // 绑定关闭事件
    $('#mm-tabclose').click(function(){
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close',currtab_title);
    })
    // 绑定关闭所有事件
    $('#mm-tabcloseall').click(function(){
        $('.tabs-inner span').each(function(i,n){
            var t = $(n).text();
            if(t != homeTabTitle) { // 非主页的选项卡全部关闭
                $('#tabs').tabs('close',t);
            }
        });
    });
    // 绑定关闭其他选项卡事件
    $('#mm-tabcloseother').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        var nextall = $('.tabs-selected').nextAll();
        if(prevall.length>0){
            prevall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != homeTabTitle) {
                    $('#tabs').tabs('close',t);
                }
            });
        }
        if(nextall.length>0) {
            nextall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != homeTabTitle) {
                    $('#tabs').tabs('close',t);
                }
            });
        }
        return false;
    });
    $('#mm-tabcloseright').click(function(){
        var nextall = $('.tabs-selected').nextAll();
        if(nextall.length==0){
            alert('后边没有啦~~');
            return false;
        }
        nextall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });

    $('#mm-tabcloseleft').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        if(prevall.length==0){
            alert('到头了，前边没有啦~~');
            return false;
        }
        prevall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });

    $("#mm-exit").click(function(){
        $('#mm').menu('hide');
    })
}

$(function() {
    tabCloseEvent();
    $('.site-navi-tab').click(function() {
        var $this = $(this); // 把this js 对象转成jquery对象
        var href = $this.attr('data-src');
        var title = $this.text();
        addTab(title, href);
    });
});

function setPagination(tableId) {
    var p = $("#" + tableId).datagrid('getPager'); // 获取指定数据表格的分页组件
    $(p).pagination({
        pageSize: 10, // 默认显示多少项
        pageList: [10,20, 25, 30, 35, 40], // 可以选择的每页显示的项数
        beforePageText: '第',
        afterPageText: '页    共 {pages} 页', // pages变量表示表格里总共有多少页
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            $(this).pagination('loading');
            $(this).pagination('loaded');
        }
    });
}

function openWin(winId) {
    $("#" + winId).window("open");
}

function closeWin(winId) {
    $("#" + winId).window("close");
}

function openDlg(dlgId) {
    $("#" + dlgId).dialog("open");
}

function closeDig(dlgId) {
    $("#" + dlgId).dialog("close");
}

function showAlert(msg) {
    $.messager.alert("提示", msg, "info");
}

function formValidate(formId) {
    return $("#" + formId).form('enableValidation').form('validate');
}

function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    }
}
/**
 *日期格式：出生日期
 */
function formatBirthday(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();

        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }

        return year + "-" + month + "-" + day;
    }
}

function formatStatus(value) {
    if (value == 1) {
        return "可用";
    } else {
        return "不可用";
    }
}

function formatGender(value) {
    if (value == "M") {
        return "男";
    } else if (value == "F") {
        return "女";
    }
}

function formatName(value) {
    return value.name;
}