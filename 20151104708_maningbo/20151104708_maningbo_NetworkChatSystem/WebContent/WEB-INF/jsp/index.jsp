<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
	var flag='<%=session.getAttribute("flag") %>';
	if("unlogin".equals(flag)){
		alert("1111");
	}else{
		alert("2222");
	}

</script>
<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div>
				<!--banner-->
				<div class="banner">
					<div class="jumbotron banner-text">
						<h2>欢迎&nbsp;&nbsp;&nbsp;${userBean.userName}&nbsp;&nbsp;&nbsp;进入！</h2>
					</div>
				</div>
				<!--//banner-->
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>	
    <script src="js/bootstrap.js"> </script>
</body>
</html>