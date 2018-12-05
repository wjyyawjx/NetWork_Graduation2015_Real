$(function(){
	findRecord();
});

function findRecord(){
	$.ajaxSetup({
		async: false
	});
	var userId=findUser();
	$.ajaxSetup({
		async: true
	});
	var url="../../../record/findUserRecord.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#recoldBodys").append("<tr>"
					+"<td>"+item.user_name+"</td>"
					+"<td>"+item.re_date+"</td>"
					+"<td>"+item.re_money+".00</td>"
					+"<td>"+item.com_name+"</td>"
				+"</tr>");
		});
	},"json");
}
function findUser(){
	var a;
	var url="../../../user/selectLogin.action";
	var data=null;
	$.post(url,data,function(mes){
		a=mes.userId;
	},"json");
	return a;
}
	
	