$(function(){
	showList();
	showAddress();
	
	$("#commit").click(function(){
		var str="";
		var sum= $("#sum").text();
		var dates = "";
		$("input[name='toyId']").each(function(){
			str+=$(this).val()+",";
		})
		$("input[name='carEndTime']").each(function(){
			dates+=$(this).val()+",";
		})
		if (confirm("确认支付,是否确定?")) {
			var url = "../../../record/commit.action";
			var date = {"toyId":str,"sum":sum,"carEndTime":dates};
			$.post(url,date,function(mes){
				if(mes.state==1){
					alert(mes.msg);
					location.href="../../../pages/user/member.html";
				}else if(mes==0){
					alert(mes.msg);
					location.reload();
				}
			},"json")
		} else {
			location.reload();
		}
		
			
	})
})
function showList(){
	var url = "../../../car/findById.action";
	var date = null;
	var sum = 0;
	var moneyTotla=0;
	var depositTotla=0;
	var num = 0;
	$.post(url,date,function(mes){
		$.each(mes,function(i, item) {
			var money = (item.toyMoney + item.toyDeposit)* item.carNum;
			$("#tb1").append("<tr>" +
					"<td align='center' style='display: none' class = 'toyId' bgcolor='#ffffff' ><input type = 'hidden' name='toyId' value = "+item.toyId+" /><input type = 'text' name='carEndTime' value = "+item.carEndTime+" /></td>"
					+"<td align='center' class = 'toyId' bgcolor='#ffffff' >"
					+ item.carId
					+ "</td>"
					+ "<td align='center' class = 'toyName' bgcolor='#ffffff' >"
					+ item.toyName
					+ "</td>"
					+ "<td align='center' class = 'userName' bgcolor='#ffffff' >"
					+ item.userName
					+ "</td>"
					+ "<td align='center' class = 'toyMoney' bgcolor='#ffffff' >"
					+ item.toyMoney
					+ "￥</td>"
					+ "<td align='center' class = 'toyDeposit' bgcolor='#ffffff' >"
					+ item.toyDeposit
					+ "￥</td>"
					+ "<td align='center' class = 'carEndTime' name = 'carEndTime' bgcolor='#ffffff' >"
					+ item.carEndTime
					+ "</td>"
					+ "<td align='center' class = 'money' bgcolor='#ffffff' width='130px' >"
					+ money.toFixed(2)
					+ "￥</td>"
					+ "<td align='center' bgcolor='#ffffff' ><a href='javascript:deletes("
					+ item.carId
					+ ")'>删除</a></td></tr>");
			num+=item.carNum;
			sum += money;
			moneyTotla=item.toyMoney*num;
			depositTotla=item.toyDeposit*num;
		});
		$("#money").html(moneyTotla.toFixed(2));
		$("#deposit").html(depositTotla.toFixed(2));
		$("#sum").html(sum.toFixed(2));
	},"json")
}


function showAddress(){
	var url = "../../../user/findByBill.action";
	var date = null;
	$.post(url,date,function(mes){
		$.each(mes,function(i, item) {
			$("#BillTb").append('<tr>'+
					'<td bgcolor="#ffffff">收货人姓名:</td>'+
					'<td bgcolor="#ffffff">'+item.userName+'</td>'+
					'<td bgcolor="#ffffff">电子邮件地址:</td>'+
					'<td bgcolor="#ffffff">'+item.userEmail+'</td>'+
					'</tr>'+
				'<tr>'+
				'<td bgcolor="#ffffff">配送区域:</td>'+
					'<td bgcolor="#ffffff">'+item.addressName+'</td>'+
					'<td bgcolor="#ffffff">详细地址:</td>'+
					'<td bgcolor="#ffffff">'+item.addressDetails+'</td>'+
					'</tr>'+
				'<tr>'+
				'<td bgcolor="#ffffff">电话:</td>'+
					'<td bgcolor="#ffffff">'+item.userPhone+'</td>'+
					'<td bgcolor="#ffffff">手机:</td>'+
					'<td bgcolor="#ffffff">'+item.userPhone+'</td></tr>');
		});
	},"json")
}


function deletes(id) {
	if (confirm("确定删除数据")) {
		var url = "../../../car/deleteById.action";
		var date = {
			"carId" : id
		}
		$.post(url, date, function(mes) {
			if (mes.state == 0) {
				alert(mes.msg);
				location.reload();
			} else {
				alert(mes.msg);
				location.reload();
			}
		}, "json");
	} else {
		location.reload();
	}
}
