<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<h2>聊天室</h2>
    <div
        style="width: 400px; height: 260px; overflow: scroll; border: 1px solid;"
        id="output"></div>
    <br />
    <div style="text-align: left;">
        <form action="">
            <input id="in" name="message" value="" type="text"
                style="width: 400px; height: 60px; border: 1px solid;"> <br />
            <br /> <input onclick="button()" value="发送" type="button" />
        </form>
    </div>

</body>
</html>