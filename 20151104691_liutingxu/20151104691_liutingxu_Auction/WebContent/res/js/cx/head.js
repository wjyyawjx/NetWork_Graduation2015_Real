$(function(){
	$("#end").hover(function(){
		$("#end_div").show();
		$("#head_img").attr("src","../../../upload/cx/上标.png");
	},function(){
		$("#end_div").hide();
		$("#head_img").attr("src","../../../upload/cx/下标2.png");
	});
	$("#end_div").hover(function(){
		$("#end_div").show();
		$("#head_img").attr("src","../../../upload/cx/上标.png");
	},function(){
		$("#end_div").hide();
		$("#head_img").attr("src","../../../upload/cx/下标2.png");
	});
	getSession();
})
/**
 * 获取Session
 * @returns
 */
function getSession(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		if(mes.userId != null){
			$("#top_1_p1").html("<span style='margin-left:50px;'>欢迎您:"+mes.userName+"&nbsp;&nbsp;<a href='javascript:findExit();'>注销</a>&nbsp;&nbsp;&nbsp;<a style='margin-left:30px;color:black;' href='../../../page/backstage/cx/geren.html'>前往个人中心</a></span>");
		}
	},"json");
}
function findExit(){
	var url="../../../user/exitSession.action";
	var data=null;
	$.post(url,data,function(mes){
		location.href="../../../page/backstage/cx/login.html";
	},"json");
}