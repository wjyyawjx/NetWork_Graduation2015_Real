$(function() {

	showCart();

	sumMoney();
	var id = window.location.href.split("?")[1].split("=")[1];
	
	
	$("#add").click(function(){
		var num = $("#buy_number").val();
		var endTime = $("#endTime").val();
		var url = "../../../car/addCar.action";
		var date = {"toyId":id,"carNum":num,"carEndTime":endTime};
		$.post(url, date, function(mes) {
			if(mes.state==1){
				swal({
				    title: mes.msg,
				    type: 'success',
				    
				    allowOutsideClick:false
				}).then(
					    function () {
					    	 parent.layer.close(index);
					    }
					)
			}else{
				swal({
				    title: '操作失败',
				    type: 'error',
				    
				    allowOutsideClick:false
				}).then(
					    function () {
					    	 parent.layer.close(index);
					    }
					) 
			}
		},"json")
	})

})
function deletes(id) {
	swal({
		title : "是否确认删除?",
		text : "请选择yes或者cancel",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "yes",
		closeOnConfirm : false
	}, function() {
		alert("111");
		var url = "../../../car/deleteById.action";
		var date = {
			"carId" : id
		}
		$.post(url, date, function(mes) {
			if (mes.state == 0) {
				swal({
					title : mes.msg,
					type : 'success',
					allowOutsideClick : false
				}).then(function() {
					parent.layer.close(index);
				})
			} else {
				swal({
					title : '操作失败',
					type : 'error',

					allowOutsideClick : false
				}).then(function() {
					parent.layer.close(index);
				})
			}
		}, "json");
	});
}

function showCart() {
	var url = "../../../car/findById.action";
	var date = null;
	var sum = 0;
	$.post(url,date,function(mes) {
			$.each(mes,function(i, item) {
				var money = (item.toyMoney + item.toyDeposit)* item.carNum;
				$("#tb1").append("<tr><td align='center' bgcolor='#ffffff' >"
								+ item.carId
								+ "</td>"
								+ "<td align='center' bgcolor='#ffffff' >"
								+ item.toyName
								+ "</td>"
								+ "<td align='center' bgcolor='#ffffff' >"
								+ item.userName
								+ "</td>"
								+ "<td align='center' bgcolor='#ffffff' >"
								+ item.toyMoney
								+ "￥</td>"
								+ "<td align='center' bgcolor='#ffffff' >"
								+ item.toyDeposit
								+ "￥</td>"
								+ "<td align='center' bgcolor='#ffffff' >"
								+ formatDate(item.carEndTime)
								+ "</td>"
								+ "<td align='center' class = 'money' bgcolor='#ffffff' width='130px' >"
								+ money.toFixed(2)
								+ "￥</td>"
								+ "<td align='center' bgcolor='#ffffff' ><a href='javascript:deletes(\""+ item.carId+ "\")'>删除</a></td></tr>");
				sum += money;
			});
		$("#totalMoney").html("购物金额小计" + sum.toFixed(2) + "￥元")
	}, "json");
}

function sumMoney() {
	var money = '';

	$(".money").each(function() {
		money = money + $(this).val() + ',';
	})
	$("#totalMoney").html("购物金额小计" + money + " ￥元");
}

function deleteAll() {
	if (confirm("确定删除数据")) {
		var url = "../../../car/deleteAll.action";
		var date = null;
		$.post(url, date, function(mes) {
			if (mes.state == 0) {
				alert(mes.msg)
				location.reload();
			} else if (mes.state == 1) {
				alert(mes.msg)
				location.reload();
			} else {
				alert(mes.msg)
				location.reload();
			}
		}, "json");
	} else {
		location.reload();
	}

}



function formatDate(inputTime) {  
    var date = new Date(inputTime);
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    return y + '-' + m + '-' + d;  
};


function formatDateTime(inputTime) {  
    var date = new Date(inputTime);
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;  
    second = second < 10 ? ('0' + second) : second; 
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;  
};

