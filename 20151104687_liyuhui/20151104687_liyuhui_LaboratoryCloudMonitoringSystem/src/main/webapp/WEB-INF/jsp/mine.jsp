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
            <a class="logo pull-left" href="menu.html">实验室云端监管系统</a>
            
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
                	<a >我的信息</a>
                </div>
                <div style="font-size:16px; text-align:center; ">
                	<a >欢迎使用！ ${User.name}</a>
                </div>
                <hr class="whiter" />
                <hr class="whiter" />
                <hr class="whiter" />
				<div  class="block-area" style="margin-top:50px; margin-left:80px; ">
					<div class="col-md-10 col-xs-8  ">
					<h3>个人信息：</h3>
					<h4>
					<table>
	                	<tr>
	                		<td rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img class="profile-pic animated" src="${User.image }" alt=""></td>
	                		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</td>
	                        <td>${User.name}</td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编号： </td>
	                        <td>${User.num }</td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别： </td>
	                        <td>${User.sex }</td>
	                    </tr>
	                    <tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄： </td>
	                        <td>${User.age }</td>
	                        <td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话： </td>
	                        <td>${User.tel }</td>
	                        <td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱： </td>
	                        <td>${User.email }</td>
	                    </tr>
	                </table>
	                </h4>
	                <br><br>
	                </div>
	                <div class="col-md-5 col-xs-8  ">
	                	<h3>已授权实验室：</h3>
	                </div>
	                <div class="col-md-5 col-xs-8  ">
	                	<h3>申请中实验室：</h3>
	                </div>
	                <div class="col-md-5 col-xs-8  ">
	                <form action="${pageContext.request.contextPath }/editMine" method="post" enctype="multipart/form-data">
	                	<h3>个人信息修改：</h3>
	                	<h4>
	                	<table>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</td>
	                			<td><input type="text" name="name" value="${User.name}" style="color:black" placeholder="姓名"></td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式：</td>
	                			<td><input type="text" name="tel" value="${User.tel }" style="color:black" placeholder="联系方式"></td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮箱：</td>
	                			<td><input type="text" name="email" value="${User.email }" style="color:black" placeholder="电子邮箱"></td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;头像：</td>
	                			<td><input type="file" id="image" name="image" value="${User.image}" accept="image/*" placeholder="头像"></td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄：</td>
	                			<td><input type="text" name="age" value="${User.age }" style="color:black" placeholder="年龄"></td>
	                		</tr>
	                	</table><br>
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	<button type="submit" style="background-color: red;border: none;color: white;padding: 10px 25px;text-align: center;text-decoration: none;display: inline-block; font-size: 13px;">修改</button>
	                	</h4>
	                </form>
	                </div>
	                <script>
						function editPwd(){
			    			var pwd = $("#pwd").val();
			    			var pwd1 = $("#pwd1").val();
			    			var randomjsp = $("#randomjsp").val();
			    			if(pwd!=pwd1){
			    				alert("两次密码不一致！");
			        			return false;
			    			}
			    			if(randomjsp == ""){
			    				alert("请输入验证码！");
			        			return false;
			    			}
			    			return true;
						}
					</script>
	                <div class="col-md-5 col-xs-8 ">
	                <form action="${pageContext.request.contextPath }/editPwd" method="post" onsubmit="return editPwd()" >
	                	<h3>密码修改：</h3>
	                	<h4>
	                	<table>
	                	<tr>
	                		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：</td>
	                		<td><input type="text" id="pwd" name="pwd" style="height:20;color:black" placeholder="请新输入密码"/></td>
	                		</tr>
	                		<tr>
	                		<td>&nbsp;</td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;再次输入：</td>
	                			<td><input type="text" id="pwd1" style="height:20;color:black" placeholder="请再次输入密码"/></td>
	                		</tr>
	                		<tr>
	                		<td>&nbsp;</td>
	                		</tr>
	                		<tr>
	                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码：</td>
	                			<td><input type="text" name="randomjsp" class="uname"  style="height:20;color:black" placeholder="请输入验证码">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><img src="getVerify" alt="" style="width:100; height:30" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'"></td>
							</tr>
						</table><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	<button type="submit" style="background-color: red;border: none;color: white;padding: 10px 25px;text-align: center;text-decoration: none;display: inline-block; font-size: 13px;" onclick="return editPwd()">修改</button>
	                	</h4>
	                	<br>
	                </form>
	                </div>
	                
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
