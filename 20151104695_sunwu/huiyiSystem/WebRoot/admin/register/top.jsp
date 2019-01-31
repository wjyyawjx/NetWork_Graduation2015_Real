<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
%>
<html>
<head>
    <!-- Bootstrap Styles-->
    <link href="<%=path%>/css1/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="<%=path%>/css1/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="<%=path%>/js1/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="<%=path%>/css1/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <script language='javascript'>
		var preFrameW = '206,*';
		var FrameHide = 0;
		var curStyle = 1;
		var totalItem = 9;
		function ChangeMenu(way){
			var addwidth = 10;
			var fcol = top.document.all.btFrame.cols;
			if(way==1) addwidth = 10;
			else if(way==-1) addwidth = -10;
			else if(way==0){
				if(FrameHide == 0){
					preFrameW = top.document.all.btFrame.cols;
					top.document.all.btFrame.cols = '0,*';
					FrameHide = 1;
					return;
				}else{
					top.document.all.btFrame.cols = preFrameW;
					FrameHide = 0;
					return;
				}
			}
			fcols = fcol.split(',');
			fcols[0] = parseInt(fcols[0]) + addwidth;
			top.document.all.btFrame.cols = fcols[0]+',*';
		}
		
		function logout()
		{
			   window.parent.location="<%=path %>/login.jsp";
		}
    </script>
    </head>
    <body>
 <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"><img src="<%=path%>/images/logo.png"></img></a>
                    <font style="float:right;padding:30px 20px 20px 900px;color:white">欢迎您：<strong>新朋友</strong>
						 <a href="#" onclick="logout()" style="color:white">&nbsp;&nbsp;返回登录</a>
						 </font>
            </div>
            </nav>
            </div>
            </body>
            </html>
              <!-- jQuery Js -->
    <script src="<%=path%>/js1/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="<%=path%>/js1/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="<%=path%>/js1/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="<%=path%>/js1/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=path%>/js1/morris/morris.js"></script>
    <!-- Custom Js -->
    <script src="<%=path%>/js1/custom-scripts.js"></script>
				