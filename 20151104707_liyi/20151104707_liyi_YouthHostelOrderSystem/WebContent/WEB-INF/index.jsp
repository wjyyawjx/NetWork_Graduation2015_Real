<%@ page language="java" import="java.util.*,java.sql.*,com.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>青年旅舍网站预约系统</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/commons.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="js/tab.js">
</script>
	</head>

	<body>

		<div class="page">
			<div class="page_con">
				<jsp:include flush="true" page="/inc/top.jsp"></jsp:include>
				<%
					DBManager dbm = new DBManager();
					Connection conn = dbm.getConnection();
					String sql;
					PreparedStatement pstmt;
					ResultSet rs;
				%>
				


                   <div id="wrapper">


					<!--body start-->
					<div id="body">



						<!--ProductShow start-->
						<div class="MainBlock">

							<div class="Solutions">
								<div class="topic">


									<div id="Solutionsdemo">
										<div id="Solutionsindemo">
											<div id="Solutionsdemo1">
												<%
													sql = "select * from jing";

													pstmt = conn.prepareStatement(sql);
													rs = pstmt.executeQuery();

													while (rs.next()) {
														String id = rs.getString("id");
												%>


												<a href="jing_detail.jsp?id=<%=id%>" target="_blank"
													title="<%=rs.getString("name")%>"><img
														src="<%=rs.getString("pic")%>" width="200" height="124"
														alt="<%=rs.getString("name")%>">
												</a>
												
												
												
												<%
													}
												%>




												<div class="clearfix"></div>

											</div>
											<div id="Solutionsdemo2">

												

												<div class="clearfix"></div>

											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="main">
				    
					<div class="main_con">
						<div class="main_box clearfix">

							<div class="main_left">
								<div class="m_border">
									<div class="m_title">
										简介
									</div>
									<div class="m_content intro">
										<p>
											想旅游，就上青年旅舍网站预约系统。青年旅舍不是经济型酒店，我们提倡：文化交流，社会责任，实践环保，爱护大自然，简朴而高素质生活，自助及助人。加盟YHA青年旅舍，成为YHA的一员，帮助年轻人实现”读万卷书，行万里路”的梦想。办公地址：广州市天河区体育西路103号维多利广场A塔3606室（地铁1/3号线，体育西路站E出口）

											<p>
									</div>
								</div>
								<div class="m_border news">
									<div class="m_title">
										网站公告
									</div>
									<div class="m_content">
										<div class="news_list ">
											<ul>
												<%
													sql = "select * from news";

													pstmt = conn.prepareStatement(sql);
													rs = pstmt.executeQuery();

													while (rs.next()) {
														String id = rs.getString("id");
												%>
												<li>
													<a href="news_detail.jsp?id=<%=id%>" target="_blank"><%=rs.getString("title")%></a>
												</li>
												<%
													}
												%>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="main_center">
								<div class="m_border">



								</div>
								<div class="m_border">
									<ul class="product_tab">
										<li class="hover" onclick="setTab('data',1,2)" id="data1">
											青年旅舍信息
										</li>

									</ul>
									<div class="product_tabcon" id="con_data_1"
										style="display: block;">
										<ul>

											<%
												sql = "select * from jiudian order by id desc limit 4";

												pstmt = conn.prepareStatement(sql);
												rs = pstmt.executeQuery();

												while (rs.next()) {
													String id = rs.getString("id");
											%>
											<li>
												<p class="pic">
													<a href="jiu_detail.jsp?id=<%=id%>"><img
															src="<%=rs.getString("pic")%>" /> </a>

												</p>
												<p>

												</p>
											</li>
											<%
												}
											%>
										</ul>
									</div>

								</div>
								<div class="m_border">
									<div class="m_title2">
										<h3>
											留言
										</h3>
									</div>
									<div class="m_content">

										<%
											sql = "select * from message";

											pstmt = conn.prepareStatement(sql);
											rs = pstmt.executeQuery();

											while (rs.next()) {
												String id = rs.getString("id");
										%>
										<div class="leave_mes">
											<p class="mes_info">
												<span class="reply"><a href="#"></a> </span><span>留言人：<%=rs.getString("appuser")%></span><span>时间：<%=rs.getString("date")%></span>
											</p>
											<div class="mes_con">
												<%=rs.getString("msg")%>
											</div>
										</div>

										<%
											}
											if (rs != null)
												rs.close();
											if (pstmt != null)
												pstmt.close();
											if (conn != null)
												conn.close();
										%>
										<div class="message_con">

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!----------------内容区结束-------------------->
				<!---------------页脚开始---------------->
				<div class="bottom">
					<p>
						版权所有
					</p>
				</div>
				<!---------------页脚结束---------------->
			</div>
		</div>
		<script>
<!--
var speed=10;
var tab=document.getElementById("Solutionsdemo");
var tab1=document.getElementById("Solutionsdemo1");
var tab2=document.getElementById("Solutionsdemo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
-->
									</script>
	</body>
</html>
