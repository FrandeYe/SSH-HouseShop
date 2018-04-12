$(function(){
	//js-appoint-user
	$.ajax({
		type : "POST",
		url : "/api/user/appoint.php",
		data : {action:'list'},
		success : function(data) {
			if(data){
				var appendHtml = '';
				for(var i in data){
					appendHtml += ' <li>·<a href="javascript:;">'+data[i].username+' '+data[i].telephone+'提交预约信息 ['+data[i].seconds+']</a></li>';
				}
				$('.js-appoint-user').append(appendHtml);
				//滚动
				var obj=$('#textScroll');
				if(obj.find('li').length>5){
					var d=setInterval(function(){
						obj.children('li').eq(0).animate({height:0},'slow',function(){
							obj.append($(this).removeAttr('style'));
						});
					},2000);
				}
			}else{
				
			}
		},
		error:function(){
			
		}
	});
	//提交信息	
	A6.submitinfo('#submit-info');
	A6.submitinfo('#submit-info2');
	// 预约报名 风格列表
	A6.getStyleList('#js-style-list');
})