$(function(){
	$("#subBtn").click(function() {
		if($("#uName").val() == ""){
			swal({ 
				  title: "请填写账号！", 
				  timer: 2000, 
				  showConfirmButton: false 
				});
		}else if($("#pwd").val() == ""){
			swal({ 
				  title: "请填写密码！", 
				  timer: 2000, 
				  showConfirmButton: false 
				});
		}else{
			var url="../../../user/login.action";
			var data= $("#loginForm").serialize();
			$.post(url,data,function(mes){
				if(mes.state == 1){
					swal({ 
						  title: "登录成功！", 
						  timer: 2000, 
						  showConfirmButton: false 
						},function(){
							location.href = "index.html";
						});
				}else{
					swal({ 
						  title: "登录失败！", 
						  text: "用户密码或账号错误!", 
						  timer: 2000, 
						  showConfirmButton: false 
						});
				}
				
			},"json");
		}
    });
})