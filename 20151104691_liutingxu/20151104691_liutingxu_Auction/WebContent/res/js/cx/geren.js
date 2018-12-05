$(function(){
	$("#gerenHeader").load("../../../page/backstage/cx/head.html");
	$("#gerenFooter").load("../../../page/backstage/cst/footer.html");
	
	$("#shopButton").click(function(){
		$("#shoppingDiv").hide();
		$("#shoppingDiv2").show();
	});
	$("#shopButton2").click(function(){
		$("#shoppingDiv").hide();
		$("#shoppingDiv2").hide();
		$("#shoppingBodys").hide();
		var url="../../../wallet/addWallet.action";
		var data={"money":$("#moneyInput").val()};
		$.post(url,data,function(mes){
			if(mes==1){
				swal("充值成功", "请点击确认按钮", "success");
				setTimeout(function(){
					location.reload();
				},1500);
			}
		},"json");
		
		$("#moneyInput").val("")
	});
	$("#shoppingBodys").click(function(){
		$("#shoppingDiv").hide();
		$("#shoppingDiv2").hide();
		$("#shoppingBodys").hide();
	});
});
function findChong(){
	$("#shoppingDiv").show();
	$("#shoppingBodys").show();
}