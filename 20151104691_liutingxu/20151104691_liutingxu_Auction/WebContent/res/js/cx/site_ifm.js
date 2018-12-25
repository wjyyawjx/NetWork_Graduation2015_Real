$(function(){
	$.ajaxSetup({
		async: false
	});
	findUser();
	$.ajaxSetup({
		async: true
	});
	findById();
	//$("#siteTd").load("../../../page/backstage/site.html");
	
	$("#btn").click(function(){
		findName();
		findPhone();
		findContent();
		var i;
		$.each($(".dui"),function(index,item){
			i=index;
		});
		console.info(i);
		if(i==2){
			var url="../../../site/addSite.action";
			var data=$("#siteFrom").serialize();
			$.post(url,data,function(mes){
				if(mes==1){
					swal("增加成功", "请点击确认", "success");
					findById(userId);
				}else{
					sweetAlert("增加失败", "请确认", "error");
				}
			},"json");
		}
		
	});
});

function findName(){
	if($("#siName").val()==""){
		$("#nameTd").html("<span style='color:red;'>收货人不能为空</span>");
	}else if($("#siName").val().length>20){
		$("#nameTd").html("<span style='color:red;'>收货人长度不能超过二十</span>");
	}else{
		$("#nameTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findPhone(){
	if($("#siPhone").val()==""){
		$("#phoneTd").html("<span style='color:red;'>收货电话不能为空</span>");
	}else if($("#siPhone").val().length!=11){
		$("#phoneTd").html("<span style='color:red;'>收货电话不符合规范</span>");
	}else if(isNaN($("#siPhone").val())){
		$("#phoneTd").html("<span style='color:red;'>收货电话必须是数字</span>");
	}else{
		$("#phoneTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}

function findContent(){
	if($("#content").val()==""){
		$("#contentTd").html("<span style='color:red;'>收货地址不能为空</span>");
	}else if($("#content").val().length>100){
		$("#contentTd").html("<span style='color:red;'>收货地址长度不能超过100</span>");
	}else{
		$("#contentTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}

var userId;
function findUser(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		userId=mes.userId;
	},"json");
}
	
function findById(id){
	$("#tbody").html("");
	var url="../../../site/findByUserId.action";
	var data={"userId":userId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#tbody").append("<tr>"
					+"<td>"+item.si_id+"</td>"
					+"<td>"+item.user_name+"</td>"
					+"<td>"+item.si_content+"</td>"
					+"<td><a href='#'>删除</a></td>"
				+"</tr>");
		});
	},"json");
}