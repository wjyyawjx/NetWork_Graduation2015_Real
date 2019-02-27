function CheckUserLogin() {
    if ($('#userid').val() =="")
    {
        $("#userid_s").html('<font color="red">请输入用户名！</font>').fadeIn("fast");
        $('#userid').focus();
        return false;
    }
    if ($('#password').val() =="")
    {
        
        $("#password_s").html('<font color="red">请输入动态密码！</font>').fadeIn("fast");
        $('#password').focus();
        return false;
    }
	params = {username:$('#userid').val(),dynamic_code:$('#password').val()};//ajax登录验证
	$.post('check_dynamic.php',params,function(data){
		switch(data.flag){
			case '0':
				window.location.href = $('#gotopage').val();
            	break;
			case '1':
            	$("#password_s").html('<font color="red">动态密码错误！</font>').fadeIn("fast");
        		$('#password').focus();
                break;
			case '2':
            	$("#userid_s").html('<font color="red">账号未授权或未绑定！</font>').fadeIn("fast");
        		$('#userid').focus();
                break;
			default:
                $("#userid_s").html('<font color="red">未知错误！</font>').fadeIn("fast");
        		$('#userid').focus();
                break;
		}
	},"json");
	
}
