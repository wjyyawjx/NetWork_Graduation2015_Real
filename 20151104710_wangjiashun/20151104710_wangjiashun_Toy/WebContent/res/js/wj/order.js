$(function(){
	showList();
})

function showList(){
	var url = "../../record/findByUserId.action";
	var date = null;
	$.post(url,date,function(mes){
		$.each(mes,function(i,item){
			$("#order").append('<tr>'+
		            '<td align="center" bgcolor="#ffffff"><a href="user.php?act=order_detail&amp;order_id=3021" class="f6">'+item.recordId+'</a></td>'+
		            '<td align="center" bgcolor="#ffffff">'+formatDate(item.recordTime)+'</td>'+
		            '<td align="center" bgcolor="#ffffff">'+item.toyName+'</td>'+
		            '<td align="center" bgcolor="#ffffff">'+item.userName+'</td>'+
		            '<td align="center" bgcolor="#ffffff"><font class="f6"><span style="color:red">'+formatDate(item.recordEndTime)+'</span></font></td>'+
		            '</tr>');
		})
	},"json")
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