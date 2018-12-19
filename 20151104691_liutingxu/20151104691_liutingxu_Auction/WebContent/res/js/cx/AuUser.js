$(function(){
	query();
})
/**
 * 查询所有用户
 * @returns
 */
function query(){
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#body").append("<tr><td>"+item.userId+"</td><td>"+item.userName+"</td><td>"+item.userPwd+"</td><td>"+item.userSex+"</td><td>"+item.userPhone+"</td><td>"+item.userType+"</td><td><button type='button' class='btn btn-primary'>删除</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn'>修改</button></td></tr>");
		});
	},"json");
}