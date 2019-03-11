<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <meta name="baseUrl" content="${ctx}"/>
    <meta name="roleId" content="${roleId}"/>
    <title>websocket</title>
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="http://cdn.jsdelivr.net/sockjs/1.0.1/sockjs.min.js"></script>
<script>
    //websocket
    $(function () {
        var baseUrl = $('meta[name="baseUrl"]').attr("content");
        //判断当前浏览器是否支持WebSocket
        var websocket;
        if ('WebSocket' in window) {
            websocket = new WebSocket('ws://' + window.location.host + '/myHandler');
            //      var ws = new WebSocket('ws://192.168.3.26:8999/activity/external/myHandler') //也可以指定ip
        } else if ('MozWebSocket' in window) {
            websocket = new MozWebSocket("ws://" + window.location.host + '/myHandler'); //未测试
        } else {
            websocket = new SockJS("http://" + window.location.host + '/myHandler'); //未测试
        }

        websocket.onopen = function () {
        	alert("123");
                    console.log("正在打开连接,准备发消息给服务器...");
            websocket.send("{text:hello}");
        }
        websocket.onclose = function () {
                    console.log("服务器关闭连接:onclose");
        }

        websocket.onmessage = function (msg) {
                    console.log("收到服务器推送数据:"+msg.data);
        }


    })
</script>
</head>

<body>
<div class="act-outline" width="100%">
    it is work.
</div>

</body>
</html>
