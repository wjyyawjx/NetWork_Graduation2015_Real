$(function(){
	$.ajaxSetup({
		  async: false
		});
	findSession();
	$.ajaxSetup({
		  async: true
		});
	$("#bodys").load("../../page/reception/cst/home.html");
	
});
function leftTable(url){
	$("#bodys").html("");
	$("#bodys").load(url);
}
function findSession(){
	var url="../../user/adminSession.action";
	var data=null;
	$.post(url,data,function(mes){
		if(mes==0){
			sweetAlert("抱歉", "你还没有登录", "error");
			setTimeout(function(){
				location.href="cyz/login.html";
			},2000);
		}
	},"json");
}
function findExit(){
	var url="../../user/adminExit.action";
	var data=null;
	$.post(url,data,function(mes){
		if(mes==1){
			location.href="../../page/reception/cyz/login.html";
		}
	},"json");
}