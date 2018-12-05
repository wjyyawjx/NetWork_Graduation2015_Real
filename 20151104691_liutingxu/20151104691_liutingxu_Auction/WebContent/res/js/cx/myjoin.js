$(function(){
	findIndent();
});
function findIndent(){
	$("#tbody").html("");
	var url="../../../record/findByIds.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var state;
			if(item.re_state==1){
				state="该商品正在竞拍中";
			}else{
				state="该商品竞拍已结束";
			}
			$("#tbody").append("<tr>"
					+"<td>"+item.re_id+"</td>"
					+"<td>"+item.com_name+"</td>"
					+"<td>"+item.user_name+"</td>"
					+"<td>"+item.re_date+"</td>"
					+"<td>"+item.re_money+"</td>"
					+"<td>"+state+"</td>"
					+"</tr>");
		});
	},"json");
}