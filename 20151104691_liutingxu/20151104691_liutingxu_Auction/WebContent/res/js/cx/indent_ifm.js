$(function(){
	$.ajaxSetup({
		  async: false
		});
	findUser();
	$.ajaxSetup({
		  async: true
		});
	selectUser();
	
	findPath();
	
	$("#Body").click(function(){
		$("#shopDiv").hide();
		$("#Body").hide();
		$("#pathDiv").hide();
	});
	
	$("#submitInput").click(function(){
		$("#pathDiv").hide();
		$("#shopDiv").show();
	});
	
	
	$("#shopSubmit").click(function(){
		alert(1);
		var url="../../../auindent/updateState.action";
		var data={"inId":$("#inId").val(),"state":1};
		$.post(url,data,function(mes){
			if(mes==1){
				swal("确认购买成功");
				$("#shopDiv").hide();
				$("#Body").hide();
				$("#pathDiv").hide();
				selectUser();
			}else{
				swal("购买失败");
			}
		},"json");
	});
	
	$("#shopExit").click(function(){
		$("#shopDiv").hide();
		$("#Body").hide();
		$("##pathDiv"),hide();
	});
	
	
	
	
});
function findPath(){
	$("#pathUl").html("");
	var url="../../../site/findByUserId.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#pathUl").append('<li><div style="margin-top: 30px;color:gray;font-size: 14px;margin-left: 20px;"><input name="radio" type="radio"/>&nbsp;&nbsp;收货人:'+item.user_name+' 地址:'+item.si_content+'</div></li>');
		});
	},"json");
}
function selectUser(){
	$("#bodys").html("");
	var url="../../../auindent/selectUser.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var state;
			if(item.in_state==0){
				state="<input type='button' class='bodyInput' onclick='findIndexSubmit(\""+item.in_id+"\",\""+item.in_money+"\")' value='确认购买'/><input onclick='findIndexExit(\""+item.in_id+"\")' class='bodyInput' type='button' value='取消'/>";
			}else if(item.in_state==1){
				state="等待商家发货";
			}else if(item.in_state==2){
				state="<input type='button' onclick='findState(\""+item.in_id+"\")' class='bodyInput' value='确认收货'/>";
			}else if(item.in_state==9){
				state="购买完成";
			}else if(item.in_state==10){
				state="该订单已经失效了";
			}
			$("#bodys").append("<tr>" +
					"<td style='font-size:9px;'>"+item.in_id+"</td>" +
					"<td style='font-size:9px;'>"+item.com_name+"</td>" +
					"<td>"+item.user_name+"</td>" +
					"<td>"+item.in_date+"</td>" +
					"<td>"+item.in_money+"</td>" +
					"<td>"+state+"</td>" +
				"</tr>");
		});
	},"json");
}

function findState(inId){
	var url="../../../auindent/findStates.action";
	var data={"inId":inId};
	$.post(url,data,function(mes){
		if(mes==1){
			swal("确认收货成功");
			selectUser();
		}else{
			swal("确认收货失败");
		}
	},"json");
}
function findIndexExit(inId){
	var url="../../../auindent/updateState.action";
	var data={"inId":inId,"state":10};
	$.post(url,data,function(mes){
		if(mes==1){
			swal("取消成功该订单已失效");
			selectUser();
		}else{
			swal("取消失败");
		}
	},"json");
}
function findIndexSubmit(id,money){
	$("#inId").val(id);
	$("#moneySpan").html(money);
	$("#Body").show();
	$("#pathDiv").show();
}
var userId;
function findUser(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		userId=mes.userId;
	},"json");
}
	
	