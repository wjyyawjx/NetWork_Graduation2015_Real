$(function(){
	
	$.ajaxSetup({
		  async: false
		});
	findUser();
	$.ajaxSetup({
		  async: true
		});
	
	var url="../../wareload/xfRecord.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#tbody").append("<tr>"
				+"<td>"+item.wr_id+"</td>"
				+"<td>"+item.wr_money+"</td>"
				+"<td>"+item.wr_date+"</td>"
				+"<td>"+item.wr_content+"</td>"
			+"</tr>");
		});
	},"json");
});
var userId;
function findUser(){
	var url="../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		userId=mes.userId;
	},"json");
}