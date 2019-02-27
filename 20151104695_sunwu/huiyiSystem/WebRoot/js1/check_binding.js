$(function(){
	
    var event_id = "";
    var handler = null;
	function get() {
		params = {event_id: event_id};
		$.post('check_binding.php',params,function(data){
			switch(data.flag){
				case '0':
					window.location.href = "yc_app.php";
            		break;
				case '1':
            		$("#msgbox").html('<font color="red">获取二维码失败</font>').fadeIn("fast");
        			if(handler) clearInterval(handler);
                	break;
				case '2':
            		$("#msgbox").html('<font color="red">手机错误，登录失败</font>').fadeIn("fast");
        			if(handler) clearInterval(handler);
                	break;
				case '300055':
            		$("#msgbox").html('<font color="red">用户拒绝授权请求！</font>').fadeIn("fast");
        			if(handler) clearInterval(handler);
                	break;
				default:
        			if(data.event_id != event_id){
                            event_id = data.event_id;
                            $('#qrcodeimg').attr('src', data.qrcode_url);
                	}  
                	break;
			}
		},"json");
	}
	get();
    handler = setInterval(get, 4000);
});

