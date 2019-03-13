<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Friend List</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--//side-bar-->
			<div >	
					<div class="offer-grids">
						<h3>我的好友列表</h3>
						<c:forEach items="${friend}" var="c">
						<div class="col-md-4 offer-grids-info">
							<img src="images/img2.jpg" alt=""/>	
							<div class="offer-text">
								<h5>${c.friend_2}</h5>
								<br>
							</div>
						</div>
						</c:forEach>
					</div>					
				</div>
			</div>
		</div>	

</body>
</html>