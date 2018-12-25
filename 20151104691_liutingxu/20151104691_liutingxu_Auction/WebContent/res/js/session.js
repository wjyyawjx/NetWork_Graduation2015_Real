//查询session是否存在的js
$(function(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		alert(mes.userName);
	},"json");
});