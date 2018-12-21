<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'demo.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>
  <body>
<div id="messages"></div>
<script type="text/javascript">
    var webSocket =
            new WebSocket('ws://127.0.0.1:8080/20151104708_maningbo_NetworkChatSystem/ws');

    webSocket.onerror = function(event) {
        onError(event);
    };

    webSocket.onopen = function(event) {
        onOpen(event);
    };
    webSocket.onmessage = function(event) {
      alert(event);
        onMessage(event);
    };
    function onMessage(event) {
      alert(event);
        document.getElementById('messages').innerHTML
                += '<br />' + event.data;
    }
    function onOpen(event) {
        document.getElementById('messages').innerHTML
                = 'Connection established';
    }
    function onError(event) {
        alert(event.data);
    }
</script>
</body>
</html>