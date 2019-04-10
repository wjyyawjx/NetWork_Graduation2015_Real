<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
<script type="text/javascript">
	function validatalength(obj){
		if(obj.length<6||obj.length>12) return false;
		return true;
	}
	function validata(){
		var old=$("#oldPass").val();
		var userPass=$("#userPass").val();
		var userPass2=$("#userPass2").val();
		if(old==""||userPass==""||userPass2==""){
			alert("密码不能为空");
			return false;
		}
		if(!validatalength(userPass)){
			alert("新密码长度6~12");
			return false;
		}
		if(userPass!=userPass2){
			alert("两次密码不一致！");
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>修改密码</h3>
		</div>
		<div class="row">
			<div class=" col-lg-2"></div>
			<form class="form-horizontal col-lg-8" action="${pageContext.request.contextPath}/userinfo/updatePass.action" method="post" onsubmit="return validata()">
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label">原密码：</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="oldPass"
							placeholder="oldPass" id="oldPass">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">新密码：</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="userPass"
							placeholder="userPass" id="userPass">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">重复新密码：</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="userPass2"
							placeholder="userPass2" id="userPass2">
					</div>
				</div>
				<hr>
				<div class="col-lg-12">
					<div class=" col-lg-1"></div>
					<button type="submit" class="btn btn-success btn-lg col-lg-10">提交</button>
					<div class=" col-lg-1"></div>
				</div>
			</form>
			<div class=" col-lg-2">${msg }</div>
		</div>
	</div>
</body>
</html>