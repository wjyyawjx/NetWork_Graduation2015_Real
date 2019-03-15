$(function(){
	showList();
	
})
function showList(){
	var moneyTotla = null;
	var depositTotla = null;
	var msg = null;
	var msgs = null;
	var url = "../../record/selectLeasa.action";
	var date = null;
	$.post(url,date,function(mes){
		$.each(mes,function(i,item){
		moneyTotla+=item.toyMoney;
		depositTotla+=item.toyDeposit;
		if(item.recordState==1 && item.recordState!=null){
			msg = "租赁中";
			msgs = "归还玩具";
		}else if(item.recordState==2 && item.recordState!=null){
			msg = "已归还";
			msgs = "";
		}else if(item.recordState==null){
			msg = "";
		}
			$("#tb11").append('<tr align="center">'+
		            '<td bgcolor="#ffffff" width="10%">'+item.recordId+'</td>'+
		            '<td bgcolor="#ffffff" width="15%">'+item.toyName+'</td>'+
		            '<td bgcolor="#ffffff">'+(item.toyMoney).toFixed(2)+'</td>'+
		            '<td bgcolor="#ffffff">'+(item.toyDeposit).toFixed(2)+'</td>'+
		            '<td bgcolor="#ffffff" width="10%">'+formatDate(item.recordTime)+'</td>'+
		            '<td bgcolor="#ffffff" width="10%">'+formatDate(item.recordEndTime)+'</td>'+
		            '<td bgcolor="#ffffff" id = '+item.recordId+'>'+msg+'</td>'+
		            '<td bgcolor="#ffffff"><a href = "javascript:returns(\''+item.recordId+'\',\''+msgs+'\')">'+msgs+'</a></td>'+
		            ' </tr>	');
		})
	},"json")
}

function returns(id,msgs){
	if(msgs==""){
		return;
	}
	if (confirm("确定归还玩具嘛？")) {
		var url = "../../record/update.action";
		var date = {"recordId":id};
		$.post(url,date,function(mes){
			if(mes.state==1){
				alert(mes.msg);
				location.reload();
			}else{
				alert(mes.msg);
				location.reload();
			}
		},"json")
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