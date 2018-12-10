$(function(){
	/**
	 * 验证账号
	 */
	$("#uName").blur(function(){
		 if($("#uName").val() == ""){
			 $("#nameMsg").html("请填写账号!");
		 }else{
			 findUserName();
		 }
	});
	/**
	 * 验证密码
	 */
	$("#pwda").blur(function(){
		 if($("#pwda").val() == ""){
			 $("#pwdMsg").html("请填写密码!");
		 }else{
			 $("#pwdMsg").html("");
		 }
	});
	/**
	 * 验证密码
	 */
	$("#pwdb").blur(function(){
		 if($("#pwdb").val() != $("#pwda").val()){
			 $("#pwdbMsg").html("两次密码输入不一致!");
		 }else{
			 $("#pwdbMsg").html("");
		 }
	});
	/**
	 * 验证手机号码
	 */
	$("#phone").blur(function(){
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
			if ($.trim($('#phone').val()).length == 0) { 
			 	$("#phoneMsg").html("请输入手机号码!");
			 } else if(!myreg.test($('#phone').val())){ 
				 $("#phoneMsg").html("手机号码有错误!");
			 }else{
				$("#phoneMsg").html("");
			 }
	});
	/**
	 * 注册验证
	 */
	$("#subBtn").click(function() {
		var sex=$('input:radio[name="userSex"]:checked').val();
		var isChecked = $("input[type='checkbox']").is(':checked');
		var pwda = $("#pwda").val();
		var pwdb = $("#pwdb").val();
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
		if($("#uName").val() == ""){
			swal("请填写账号!");
		}else if(pwda == ""){
			swal("请填写密码");
		}else if(isChecked == false){
			swal("请阅读并同意免责声明!");
		}else if(pwda != pwdb){
			swal("两次密码不一致!");
		}else if(sex == null){
			swal("请填写性别!");
		}else if(!myreg.test($('#phone').val())){ 
			swal("手机号码有错误!");
		}else if(findUserName() == false){
			swal("该用户名已存在!");
		}else{
			var url="../../../user/register.action";
			var data= $("#loginForm").serialize();
			$.post(url,data,function(mes){
				if(mes.state == 1){
					swal({ 
						  title: "注册成功！", 
						  timer: 2000, 
						  showConfirmButton: false 
						},function(){
							location.href = "login.html";
						});
				}else{
					swal({ 
						  title: "注册失败！", 
						  timer: 2000, 
						  showConfirmButton: false 
						});
				}
			},"json");
		}
    });
})

/**
 * 判断用户名是否存在
 * @returns
 */
function findUserName(){
	var url="../../../user/findUserName.action";
	var data= {"userName":$("#uName").val()}
	var bln = true;
	$.ajax({
		url:url,
		data:data,
		type:'post',
		dataType:'json',
		async:false,  //设置为异步,如果为false,则为同步
		success:function(mes){
			if(mes.state == 1){
				 $("#nameMsg").html("该账号已存在!");
				 bln = false;
			}else{
				 $("#nameMsg").html("");
				 bln = true;
			}
		},
		error:function(){
			alert("服务器发生错误!");
		}
		
	});
	return bln;
}
