<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
<script  src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.qqFace.js"></script>
<script type="text/javascript">

$(function(){

	$('.emotion').qqFace({
		id : 'facebox', 
		assign:'in', 
		path:'${pageContext.request.contextPath}/arclist/'	//表情存放的路径

	});
});

//查看结果

function replace_em(str){

	str = str.replace(/\</g,'&lt;');

	str = str.replace(/\>/g,'&gt;');

	str = str.replace(/\n/g,'<br/>');

	str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${pageContext.request.contextPath}/arclist/$1.gif" border="0" />');

	return str;

}

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<div class="contact">
					<div class="contact-grids">
						<div class="col-md-8 contact-form">
							<h3>聊天室</h3>
							<div style="width: 80%; height: 400px; overflow: scroll; border: 1px solid;"id="output"></div>
							<br />
							<div style="text-align: left;">
							<span class="emotion">表情</span></p>
									<input id="username" name="username" type="hidden" value="${userBean.userName}">
									<input id="in" name="in" value="" onkeyup="listener(event)" type="text" style="width: 80%; height: 60px; border: 1px solid;">
									<br/>
									
									<input onclick="button()" value="发送" type="button" id="sub_btn"/>
							</div>
						</div>
					</div>
				</div>
			
		</div>
	</div>
	<script type="text/javascript">
	var localChatKey="chat_key"+${userBean.id}+":room:"+${roomId}
	var jsonArray=localStorage.getItem(localChatKey);
    function loadMsg(jsonArray){
        var objArray=JSON.parse(jsonArray);
        for(var i=0;i<objArray.length;i++){
            var data=objArray[i];
            initMsg(JSON.stringify(data));
        }
    }
    function initMsg(message){
        var obj=JSON.parse(message);
        var html;
        if(obj.id==${userBean.id}){//自己发送的消息
            html="<div class='media'>"+
                "<div class='media-body'>"+
                "<h4 class='media-heading text-right' style='font-family: 楷体; color:red'>"+obj.username+"</h4>"+
                "<h5 class='media-heading text-right' style=' margin-right: 20px;'>"+replace_em(obj.message)+"</h5>"+
                "</div>"+
                "<div class='media-right'>"+
                "<a href='#'>"+
                "<img width='50px' height='50px' class='media-object' src='${pageContext.request.contextPath}/upload/"+obj.img+"' alt='...'>"+
                "</a>"+
                "</div>"+
                "</div>";

        }else{
            html="<div class='media'>"+
                "<div class='media-left'>"+
                "<a href='${pageContext.request.contextPath}/friend/${userBean.userName}/"+obj.username+".action'>"+
                "<img width='50px' height='50px' class='media-object' src='${pageContext.request.contextPath}/upload/"+obj.img+"' alt='...'>"+
                "</a>"+
                "</div>"+
                "<div class='media-body'>"+
                "<h4 class='media-heading' style='font-family: 楷体; '>"+obj.username+"</h4>"+
                "<h5 class='media-heading text-left' style=' margin-left: 20px;'>"+replace_em(obj.message)+"</h5>"+
                "</div>"+
                "</div>";
        }
        var pre = document.createElement("p");
        pre.style.wordWrap = "break-word";
        pre.innerHTML = html;
        $("#output").append(pre);
        var div = document.getElementById('output');
        div.scrollTop =div.scrollHeight;
    }
    if(jsonArray==null||jsonArray==''){
        localStorage.setItem(localChatKey,JSON.stringify([]));
    }else{
        loadMsg(jsonArray);
    }
    var ws;
    var wsUri = "ws://localhost:8080/20151104708_maningbo_NetworkChatSystem/websocket/${roomId}";
    ws = new WebSocket(wsUri);
 
    //接收后台getBasicRemote().sendText()的内容
    ws.onmessage = function(message) {
        writeToScreen(message.data);
    };

    //发送按钮监听，点击按钮后，向后台发送信息，由后台OnMessage接收
    function button() {
        sendMsg();

    }
    function sendMsg(){
        message = document.getElementById('in').value;
        document.getElementById('in').value="";
        username = document.getElementById('username').value;
        //message += message + username;
        var data={
            "id":${userBean.id},
            "username":username,
            "message":message,
            "img":"${userBean.image}"
        };
        ws.send(JSON.stringify(data));
    }
    //发生错误时
    ws.onerror = function(msg) {
        writeToScreen('<span style="color:red;">系统出错啦</span>' + msg.data);
        ws.close();
    };
    /**
     */
    //聊天信息写入窗口中
    function writeToScreen(message) {
    	var jsonArray=localStorage.getItem(localChatKey);
    	var objArray=JSON.parse(jsonArray);
        var obj=JSON.parse(message);
        var html;
        if(obj.id==${userBean.id}){//自己发送的消息
            html="<div class='media'>"+
                "<div class='media-body'>"+
                "<h4 class='media-heading text-right' style='font-family: 楷体; color:red'>"+obj.username+"</h4>"+
                "<h5 class='media-heading text-right' style=' margin-right: 20px;'>"+replace_em(obj.message)+"</h5>"+
                "</div>"+
                "<div class='media-right'>"+
                "<a href='#'>"+
                "<img width='50px' height='50px' class='media-object' src='${pageContext.request.contextPath}/upload/"+obj.img+"' alt='...'>"+
                "</a>"+
                "</div>"+
                "</div>";

        }else{
            html="<div class='media'>"+
                "<div class='media-left'>"+
                "<a href='${pageContext.request.contextPath}/friend/${userBean.userName}/"+obj.username+".action'>"+
                "<img width='50px' height='50px' class='media-object' src='${pageContext.request.contextPath}/upload/"+obj.img+"' alt='...'>"+
                "</a>"+
                "</div>"+
                "<div class='media-body'>"+
                "<h4 class='media-heading' style='font-family: 楷体; '>"+obj.username+"</h4>"+
                "<h5 class='media-heading text-left' style=' margin-left: 20px;'>"+replace_em(obj.message)+"</h5>"+
                "</div>"+
                "</div>";
        }
        var pre = document.createElement("p");
        pre.style.wordWrap = "break-word";
        pre.innerHTML = html;
        $("#output").append(pre);
        var div = document.getElementById('output');
        div.scrollTop =div.scrollHeight;
        objArray.push(obj);
        localStorage.setItem(localChatKey,JSON.stringify(objArray));
    }
    function listener(event){
        if(event.keyCode == 13){
            sendMsg();
        }
    };
    //当关闭页面时执行，调用后台的OnClose方法
    window.onbeforeunload = function() {
        ws.close();
    };
    
    
</script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js">
	</script>
</body>
</html>