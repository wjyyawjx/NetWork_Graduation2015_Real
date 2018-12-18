<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	var ws;
	var wsUri = "ws://localhost:8080/20151104708_maningbo_NetworkChatSystem/websocket";
	ws = new WebSocket(wsUri);
	//接收后台getBasicRemote().sendText()的内容
	ws.onmessage = function(message) {
		writeToScreen(message.data);
	};

	//发送按钮监听，点击按钮后，向后台发送信息，由后台OnMessage接收
	function button() {
		message = document.getElementById('in').value;
		ws.send(message);
	}
	//发生错误时
	ws.onerror = function(msg) {
		writeToScreen('<span style="color:red;">系统出错啦</span>' + msg.data);
		ws.close();
	};

	//聊天信息写入窗口中
	function writeToScreen(message) {
		var pre = document.createElement("p");
		pre.style.wordWrap = "break-word";
		pre.innerHTML = message;
		output.appendChild(pre);
	}

	//当关闭页面时执行，调用后台的OnClose方法
	window.onbeforeunload = function() {
		ws.close();
	};
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
				<div class="contact">
					<div class="contact-grids">
						<div class="col-md-4 address">
							<h3>Contact Info</h3>
							<p class="cnt-p">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit,sheets containing Lorem Ipsum passages sed do</p>
							<p>Eiusmod Tempor inc</p>
							<p>9560 St Dolor,London</p>
							<p>Telephone : +2 800 544 6035</p>
							<p>FAX : +1 800 889 4444</p>
							<p>
								Email : <a href="mailto:example@mail.com">mail@example.com</a>
							</p>
						</div>
						<div class="col-md-8 contact-form">
							<h3>聊天室</h3>
							<div style="width: 80%; height: 400px; overflow: scroll; border: 1px solid;"id="output"></div>
							<br />
							<div style="text-align: left;">
								<form action="">
									<input id="in" name="message" value="" type="text" style="width: 80%; height: 60px; border: 1px solid;">
									<br/><input onclick="button()" value="发送" type="button" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.js">
	</script>
</body>
</html>