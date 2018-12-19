$(function(){
	$.ajaxSetup({
		  async: false
		});
	findUser();
	$.ajaxSetup({
		  async: true
		});
	
	var url="../../../commodity/comUser.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var state;
			if(item.com_state==0){
				state="等待审核";
			}else if(item.com_state==1){
				state="审核通过";
			}if(item.com_state==2){
				state="商品已下架";
			}
			$("#tbody").append("<tr>"
				+"<td>"+item.com_name+"</td>"
				+"<td>"+item.type_name+"</td>"
				+"<td>"+item.com_comment+"</td>"
				+"<td>"+item.com_money+"</td>"
				+"<td>"+item.com_date+"</td>"
				+"<td>"+item.com_time+"</td>"
				+"<td>"+state+"</td>"
			+"</tr>");
		});
	},"json");
});

var userId;
function findUser(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		userId=mes.userId;
	},"json");
}