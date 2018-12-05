$(function(){
	findUser();
});
function findUser(){
	var url="../../../user/getSession.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#userName").html(mes.userName);
		$("#userName2").html(mes.userName);
		$("#userPhone").html(mes.userPhone);
		$("#userPwd").html(mes.userId);
		
		$("#userIdInput").val(mes.userId);
		var level="";
		if(mes.userType==1){
			level="普通用户";
		}else if(mes.userType==2){
			level="买家";
		}else if(mes.userType==3){
			level="管理员";
		}
		$("#userLevel").html(level);
		
		$("#userNameInput").val(mes.userName);
		$("#userPwdInput").val(mes.userPwd);
		
		//$("#userSexInput").val(sex);
		
		$.each($(".userSexInput"),function(index,item){
			if(item.value==mes.userSex){
				item.checked=true;
			}
		});
		
		$("#userPhoneInput").val(mes.userPhone);
		
		findWallet(mes.userId);
	},"json");
	
	
	$("#btna").click(function(){
		var url="../../../user/update.action";
		var data=$("#userForm").serialize();
		$.post(url,data,function(mes){
			if(mes.state==1){
				swal("修改成功", "请点击确认", "success");
				setTimeout(function(){
					location.reload();
				},2000);
			}else{
				sweetAlert("修改失败", "请确认", "error");
			}
		},"json");
	});
}
function findWallet(id){
	var url="../../../wallet/findWallet.action";
	var data={"userId":id};
	$.post(url,data,function(mes){
		$("#userMoney").html(mes.waBalance);
	},"json");
}