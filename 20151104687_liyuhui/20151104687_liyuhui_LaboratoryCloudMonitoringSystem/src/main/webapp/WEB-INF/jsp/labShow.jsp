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
        <script src="js/echarts.min.js"></script>
        <script src="js/jquery.min.js"></script>
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
                            <img class="profile-pic animated" src="${pageContext.request.contextPath }/${User.image }" alt=""><!--头像-->
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
                	<a >${lab_place.campus}${lab_place.building}${lab_place.houseId}</a>
                </div>
                
                <div>
                	<a href="addTeach?lId=${lab.lId}">添加教师</a>
                	<a href="addStu?lId=${lab.lId}">添加学生</a>
                </div>
                <hr class="whiter" />
                <hr class="whiter" />
                <hr class="whiter" />
                <div class="block-area" style="margin-top:50px; margin-left:80px; ">
                    
                    <div class="row">
                    	
                        <div class="col-md-6 col-xs-8  ">
                        	<a style="font-size:18px">实验室温湿度记录</a>
	                        <!-- <table  border="1" style="width:100%; border-color:white">
	                			<tr>
	                				<td>编号</td>
	                				<td>时间</td>
	                				<td>温度（℃）</td>
	                				<td>湿度（%）</td>
	                			</tr>
	                			<c:forEach items="${lab_ths}" var="lab_ths">
	                			<tr>
	                				<td>${lab_ths.id}</td>
	                				<td>${lab_ths.time}</td>
	                				<td>${lab_ths.temperature} ℃</td>
	                				<td>${lab_ths.humidity} %</td>
	                			</tr>
	                			</c:forEach>
	                		</table> -->
	                		<input type="hidden" value="${fn:length(lab_ths)}" name="lab_length" id="lab_length">
	                		<c:forEach items="${lab_ths}" var="lab_ths" varStatus="status">
    					 		<input type="hidden" value="${lab_ths.time }" name='Time${status.count}' id='Time${status.count}'>
    					 		<input type="hidden" value="${lab_ths.temperature }" id='Tem${status.count}'>
    					 		<input type="hidden" value="${lab_ths.humidity }" id='Hum${status.count}'>
    					 	</c:forEach>
                        	<div  id="oldchart" style="height:430px">
				        	<script type="text/javascript">
				        		var myChart = echarts.init(document.getElementById('oldchart'));
					        	var time = [];
				        		var tem = [];
				        		var hum = [];
				        		var i = 0;
				        		var length =  $("#lab_length").val();
				        		for(i;i<length;i++){
				        			time[i] = $("#Time"+(i)).val()+"";
				        			tem[i] = $("#Tem"+(i)).val();
				        			hum[i] = $("#Hum"+(i)).val();
				        		}  	
				        		var timeData = time;
				        		
				        		timeData = timeData.map(function (str) {
				        		    return str.replace('GMT+08:00 2019', '');
				        		});
				        		
				        		option = {
				        		    title: {
				        		        text: '实验室温湿度记录统计',
				        		        textStyle:{
				        		            color:'#fff',
				        		        },
				        		        subtext: '',
				        		        x: 'center'
				        		    },
				        		    tooltip: {
				        		        trigger: 'axis',
				        		        axisPointer: {
				        		            animation: false
				        		        }
				        		    },
				        		    color:['#80FF80','#ED7C30'],
				        		    legend: {
				        		    	textStyle:{
				        		            color:'#fff',
				        		        },
				        		        data:['温度','湿度'],
				        		        x: 'left'
				        		    },
				        		    toolbox: {
				        		        feature: {
				        		            dataZoom: {
				        		                yAxisIndex: 'none'
				        		            },
				        		            restore: {},
				        		            saveAsImage: {}
				        		        }
				        		    },
				        		    axisPointer: {
				        		        link: {xAxisIndex: 'all'}
				        		    },
				        		    dataZoom: [
				        		        {
				        		            show: true,
				        		            textStyle:{//图例文字的样式
					        		            color:'#fff',
					        		        },
				        		            realtime: true,
				        		            start: 30,
				        		            end: 70,
				        		            xAxisIndex: [0, 1]
				        		        },
				        		        {
				        		            type: 'inside',
				        		            realtime: false,
				        		            start: 30,
				        		            end: 70,
				        		            xAxisIndex: [0, 1]
				        		        }
				        		    ],
				        		    grid: [{
				        		        left: 50,
				        		        right: 50,
				        		        height: '35%'
				        		    }, {
				        		        left: 50,
				        		        right: 50,
				        		        top: '55%',
				        		        height: '35%'
				        		    }],
				        		    xAxis : [
				        		        {
				        		            type : 'category',
				        		            boundaryGap : false,
				        		            axisLine: {
				        		            	onZero: true,
				        		            	lineStyle: {color: '#fff'}
				        		            },
				        		            axisLabel: {
				                                show: true,
				                                textStyle: {
				                                    color: '#fff'
				                                }
				                            },
				        		            data: timeData
				        		        },
				        		        {
				        		            gridIndex: 1,
				        		            type : 'category',
				        		            boundaryGap : false,
				        		            axisLabel: {
				                                show: false,
				                            },
				                            axisLine: {
				        		            	onZero: true,
				        		            	lineStyle: {color: '#fff'}
				        		            },
				        		            data: timeData,
				        		            position: 'top'
				        		        }
				        		    ],
				        		    yAxis : [
				        		        {
				        		            name : '温度（℃）',
				        		            type : 'value',
				        		            axisLine: {
				        		            	lineStyle: {color: '#fff'}
				        		            },
				        		            axisLabel : {
				                                formatter: '{value}',
				                                textStyle: {
				                                    color: '#fff'
				                                }
				                            },
				        		            max : 50
				        		        },
				        		        {
				        		            gridIndex: 1,
				        		            name : '湿度（%）',
				        		            type : 'value',
				        		            axisLine: {
				        		            	lineStyle: {color: '#fff'}
				        		            },
				        		            axisLabel : {
				                                formatter: '{value}',
				                                textStyle: {
				                                    color: '#fff'
				                                }
				                            },
				        		            inverse: true
				        		        }
				        		    ],
				        		    series : [
				        		        {
				        		            name:'温度',
				        		            type:'line',
				        		            symbolSize: 8,
				        		            hoverAnimation: true,
				        		            data:tem

				        		            
				        		        },
				        		        {
				        		            name:'湿度',
				        		            type:'line',
				        		            xAxisIndex: 1,
				        		            yAxisIndex: 1,
				        		            symbolSize: 8,
				        		            hoverAnimation: true,
				        		            data:hum
				        		        }
				        		    ]
				        		};
				        		
				        		myChart.setOption(option);
				        	</script>
				        	</div>
                        </div>
                        <div class="col-md-4 col-xs-8">
                        <a style="font-size:18px">实验室实时温度</a>
                        <div  id="newchart" style="height:430px">
				        <script type="text/javascript">
				            // 基于准备好的dom，初始化echarts实例
				            var myChart = echarts.init(document.getElementById('newchart'));
				            // 指定图表的配置项和数据
				            var option = {
				            	    //backgroundColor: '#1b1b1b',
				            	    tooltip : {
				            	        formatter: "{a} <br/>{c} {b}"
				            	    },
				            	    toolbox: {
				            	        show : true,
				            	        feature : {
				            	            mark : {show: true},
				            	            restore : {show: true},
				            	            saveAsImage : {show: true}
				            	        }
				            	    },
				            	    series : [
				            	        {
				            	            name:'实验室湿度',
				            	            type:'gauge',
				            	            min:0,
				            	            max:100,
				            	            splitNumber:10,
				            	            center : ['70%', '55%'],
				            	            radius: '60%',
				            	            axisLine: {            // 坐标轴线
				            	                lineStyle: {       // 属性lineStyle控制线条样式
				            	                    color: [[0.09, 'lime'],[0.82, '#1e90ff'],[1, '#ff4500']],
				            	                    width: 3,
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            axisLabel: {            // 坐标轴小标记
				            	                textStyle: {       // 属性lineStyle控制线条样式
				            	                    fontWeight: 'bolder',
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            axisTick: {            // 坐标轴小标记
				            	                length :15,        // 属性length控制线长
				            	                lineStyle: {       // 属性lineStyle控制线条样式
				            	                    color: 'auto',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            splitLine: {           // 分隔线
				            	                length :25,         // 属性length控制线长
				            	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
				            	                    width:3,
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            pointer: {           // 分隔线
				            	                shadowColor : '#fff', //默认透明
				            	                shadowBlur: 5
				            	            },
				            	            title : {
				            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				            	                    fontWeight: 'bolder',
				            	                    fontSize: 20,
				            	                    fontStyle: 'italic',
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            detail : {
				            	                //backgroundColor: 'rgba(30,144,255,0.8)',
				            	                //borderWidth: 1,
				            	                borderColor: '#fff',
				            	                shadowColor : '#fff', //默认透明
				            	                shadowBlur: 5,
				            	                offsetCenter: [0, '50%'],       // x, y，单位px
				            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				            	                    fontWeight: 'bolder',
				            	                    color: '#fff'
				            	                }
				            	            },
				            	            data:[{value: ${lab_th.humidity},name: '湿度 %'}]
				            	        },
				            	        {
				            	            name:'实验室温度',
				            	            type:'gauge',
				            	            center : ['32%', '55%'],    // 默认全局居中
				            	            radius : '60%',
				            	            min:0,
				            	            max:50,
				            	            endAngle:45,
				            	            splitNumber:5,
				            	            axisLine: {            // 坐标轴线
				            	                lineStyle: {       // 属性lineStyle控制线条样式
				            	                    color: [[0.29, 'lime'],[0.86, '#1e90ff'],[1, '#ff4500']],
				            	                    width: 2,
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            axisLabel: {            // 坐标轴小标记
				            	                textStyle: {       // 属性lineStyle控制线条样式
				            	                    fontWeight: 'bolder',
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            axisTick: {            // 坐标轴小标记
				            	                length :12,        // 属性length控制线长
				            	                lineStyle: {       // 属性lineStyle控制线条样式
				            	                    color: 'auto',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            splitLine: {           // 分隔线
				            	                length :20,         // 属性length控制线长
				            	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
				            	                    width:3,
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            pointer: {
				            	                width:5,
				            	                shadowColor : '#fff', //默认透明
				            	                shadowBlur: 5
				            	            },
				            	            title : {
				            	                offsetCenter: [0, '-30%'],       // x, y，单位px
				            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				            	                    fontWeight: 'bolder',
				            	                    fontStyle: 'italic',
				            	                    color: '#fff',
				            	                    shadowColor : '#fff', //默认透明
				            	                    shadowBlur: 10
				            	                }
				            	            },
				            	            detail : {
				            	                backgroundColor: 'rgba(30,144,255,0.8)',
				            	                borderWidth: 1,
				            	                borderColor: '#fff',
				            	                shadowColor : '#fff', //默认透明
				            	                shadowBlur: 5,
				            	                width: 80,
				            	                height:30,
				            	                offsetCenter: [20, 50],       // x, y，单位px
				            	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				            	                    fontWeight: 'bolder',
				            	                    color: '#fff'
				            	                }
				            	            },
				            	            data:[{value: ${lab_th.temperature}, name: '温度 ℃'}]
				            	        }
				            	    ]
				            	};
				            // 使用刚指定的配置项和数据显示图表。
				            myChart.setOption(option);
				        </script>
				        </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:50px; ">
                        <div class="col-md-5 col-xs-8">
                       		 <a style="font-size:18px">实验室教师用户</a>
	                        <table border="1" style="width:100%; border-color:white;">
	                			<tr>
	                				<td>姓名</td>
	                				<td>工号</td>
	                			</tr>
	                			<c:forEach items="${lab_teach}" var="teach">
	                			<tr>
	                				<td>${teach.name}</td>
	                				<td>${teach.num}</td>
	                			</tr>
	                			</c:forEach>
	                		</table>
                        
                        </div>
                        <div class="col-md-5 col-xs-8">
                        	<a style="font-size:18px">实验室学生用户</a>
	                        <table border="1" style="width:100%; border-color:white">
	                			<tr>
	                				<td>姓名</td>
	                				<td>学号</td>
	                			</tr>
	                			<c:forEach items="${lab_stu}" var="stu">
	                			<tr>
	                				<td>${stu.name}</td>
	                				<td>${stu.num}</td>
	                			</tr>
	                			</c:forEach>
	                		</table>
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

        <!--  Form Related -->
        <script src="js/icheck.js"></script> <!-- Custom Checkbox + Radio -->

        <!-- UX -->
        <script src="js/scroll.min.js"></script> <!-- Custom Scrollbar -->

        <!-- Other -->
        <script src="js/calendar.min.js"></script> <!-- Calendar -->
        <script src="js/feeds.min.js"></script> <!-- News Feeds -->
        

        <!-- All JS functions -->
        <script src="js/functions.js"></script>
        <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    </body>
