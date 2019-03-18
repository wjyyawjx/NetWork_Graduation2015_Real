<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">

        <meta name="description" content="Violate Responsive Admin Template">
        <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

        <title>实验室云端监管系统</title>
            
        <!-- CSS -->
        <link rel="stylesheet" type="text/css"
	href="superAdministrator/css/style.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
        <link href="css/calendar.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/icons.css" rel="stylesheet">
        <link href="css/generics.css" rel="stylesheet"> 
    </head>
    <body id="${User.color}">

        <header id="header" class="media">
            <a href="" id="menu-toggle"></a> 
            <a class="logo pull-left" href="">实验室云端监管系统</a>
            
            <div class="media-body">
                <div class="media" id="top-menu">
                    <div class="pull-left tm-icon">
                        <a data-drawer="messages" class="drawer-toggle" href="">
                            <i class="sa-top-message"></i>
                            <i class="n-count animated">5</i>
                            <span>通知</span>
                        </a>
                    </div>
                    <div id="time" class="pull-right">
   
                        <span id="hours"></span>
                        :
                        <span id="min"></span>
                        :
                        <span id="sec"></span>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="clearfix"></div>
        
        <section id="main" class="p-relative" role="main">
            
            <!-- Sidebar -->
            <aside id="sidebar">
                
                <!-- Sidbar Widgets -->
                <div class="side-widgets overflow">
                    <!-- Profile Menu -->
                    <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
                            <img class="profile-pic animated" src="${User.image }" alt=""><!--头像-->
                            <table>
                            	<tr>
                            		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            		<td>姓名：</td>
                            		<td>${User.name}</td>
                            	</tr>
                            	<tr>
                            		<td></td>
                            		<td>编号： </td>
                            		<td>${User.num }</td>
                            	</tr>
                            </table>
                            <a href="doLogout">登出</a>  
                    </div>
                    <!-- Calendar -->
                    <div class="s-widget m-b-25">
                        <div id="sidebar-calendar"></div>
                    </div>


                    <!-- Projects -->
                    
                </div>
                
                <!-- Side Menu -->
                <ul class="list-unstyled side-menu">
                    <li class="active">
                        <a class="sa-side-home" href="${pageContext.request.contextPath }/menu">
                            <span class="menu-item">主页</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-form" href="${pageContext.request.contextPath }/mine">
                            <span class="menu-item">我的信息</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="sa-side-folder" href="">
                            <span class="menu-item">实验室用户信息</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                        	<li><a href="${pageContext.request.contextPath }/config/listAll">实验室全部用户信息管理</a></li>
                        	<li><a href="${pageContext.request.contextPath }/config/listStu">实验室学生用户信息管理</a></li>
                        	<li><a href="${pageContext.request.contextPath }/config/listTeach">实验室教师用户信息管理</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="sa-side-table" href="">
                            <span class="menu-item">超级管理</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                        	<li><a href="${pageContext.request.contextPath }/config/listLab">实验室管理</a></li>
                        	<li><a href="${pageContext.request.contextPath }/config/listPlace">位置管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/config/listUser">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/config/listRole">角色管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/config/listPermission">权限管理</a></li>                     
                        </ul>
                    </li>
                    
                    <li>
                        <a class="sa-side-chart" href="">
                            <span class="menu-item">****</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-calendar" href="">
                            <span class="menu-item">我的日程</span>
                        </a>
                    </li>
                </ul>

            </aside>
        
            <!-- Content -->
            <section id="content" class="container">
            
                <!-- Messages Drawer -->
                <div id="messages" class="tile drawer animated">
                    <div class="listview narrow">
                        <div class="media">
                            <a href="">Send a New Message</a>
                            <span class="drawer-close">&times;</span>
                            
                        </div>
                        <div class="overflow" style="height: 254px">
                            <div class="media">
                                <div class="pull-left">
                                    <img width="40" src="img/profile-pics/1.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <small class="text-muted">Nadin Jackson - 2 Hours ago</small><br>
                                    <a class="t-overflow" href="">Mauris consectetur urna nec tempor adipiscing. Proin sit amet nisi ligula. Sed eu adipiscing lectus</a>
                                </div>
                            </div><!--通知-->
                        </div>
                        <div class="media text-center whiter l-100">
                            <a href=""><small>展开全部</small></a>
                        </div>
                    </div>
                </div>
                
                <hr class="whiter" />
                <div style="font-size:20px; text-align:center; ">
                	<a >实验室云端监管系统</a>
                </div>
                <div style="font-size:16px; text-align:center; ">
                	<a >欢迎使用！ ${User.name}</a>
                </div>
                <hr class="whiter" />
                <hr class="whiter" />
                <hr class="whiter" />
                <div class="block-area" style="margin-top:50px; margin-left:80px; width:90%">
                	<div class="row">
                	<c:forEach items="${Lab}" var="lab">	
                       	<div class="col-md-3 col-xs-6 " style="height:260px" >
                       		<a href="/config/showLab?lId=${lab.lId}"><img alt="${lab.lName}" src="img/imnu_head.jpg" style="width:120px;height:120px">
	                		<p>实验室名称: ${lab.lName}</p>
	                		<p>所属校区: ${lab.campus}</p>
	                		<p>所属教学楼: ${lab.building}</p>
	                		<p>所属院系: ${lab.major}</p>
	                		<p>门牌号: ${lab.houseId} </p></a>
                        </div>
                     </c:forEach>   
                    </div>
                </div>
                
            </section>

        </section>
        
        <!-- Javascript Libraries -->
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script> <!-- jQuery Library -->
        <script src="js/jquery-ui.min.js"></script> <!-- jQuery UI -->
        <script src="js/jquery.easing.1.3.js"></script> <!-- jQuery Easing - Requirred for Lightbox + Pie Charts-->

        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Charts -->
        <script src="js/charts/jquery.flot.js"></script> <!-- Flot Main -->
        <script src="js/charts/jquery.flot.time.js"></script> <!-- Flot sub -->
        <script src="js/charts/jquery.flot.animator.min.js"></script> <!-- Flot sub -->
        <script src="js/charts/jquery.flot.resize.min.js"></script> <!-- Flot sub - for repaint when resizing the screen -->

        <script src="js/sparkline.min.js"></script> <!-- Sparkline - Tiny charts -->
        <script src="js/easypiechart.js"></script> <!-- EasyPieChart - Animated Pie Charts -->
        <script src="js/charts.js"></script> <!-- All the above chart related functions -->


        <!--  Form Related -->
        <script src="js/icheck.js"></script> <!-- Custom Checkbox + Radio -->

        <!-- UX -->
        <script src="js/scroll.min.js"></script> <!-- Custom Scrollbar -->

        <!-- Other -->
        <script src="js/calendar.min.js"></script> <!-- Calendar -->
        <script src="js/feeds.min.js"></script> <!-- News Feeds -->
        

        <!-- All JS functions -->
        <script src="js/functions.js"></script>
    </body>
