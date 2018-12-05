$(function(){
	
	$("#tj").click(function() {
		 
		var url="../../../user/htlogin.action";
		var data= $("#myform").serialize();
		$.post(url,data,function(mes){
			if(mes.state == 1){
				swal({ 
					  title: "登录成功！", 
					  timer: 1500, 
					  showConfirmButton: false 
					},function(){
						location.href = "../../../page/reception/index.html";
					});
			}else{
				swal({ 
					  title: "登录失败！", 
					  text: "您的账号不是管理员或账号密码错误！", 
					  timer: 3000, 
					  showConfirmButton: false 
					});
			}
			
		},"json");
    });
})