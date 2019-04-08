<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easing.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js">
	
</script>
</head>
<body>
	<div class="container">
		<div class="row col-lg-12" height="120px"></div>
		<div class="row">
			<div class="col-lg-3"></div>
			<h1 style="color: red;" class="col-lg-6">申请房间</h1>
			<div class="col-lg-3"></div>
		</div>
		<div class="row col-lg-12" height="120px"></div>
		<div class="row">
			<form method="post" class="form-inline"
				action="${pageContext.request.contextPath}/room/add.action">
				<div class="form-group">
					<label for="exampleInputName2">RoomName</label> <input type="text"
						class="form-control" name="name" id="exampleInputName2"
						placeholder="请输入房间名称">
				</div>
				<button type="submit" class="btn btn-success">申请</button>
			</form>
		</div>
		<div class="row">
			<hr>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>id</th>
						<th>房间名称</th>
						<th>房间拥有着</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="room" items="${roomList }">

						<tr>
							<td>${room.id }</td>
							<td>${room.name }</td>
							<td>${room.userid }</td>
							<td>
								<c:choose>
								<c:when test="${room.status eq '00' }">
								待审核
   								</c:when>
								<c:when test="${room.status eq '01' }">
								房间正常
								</c:when>
								<c:when test="${room.status eq '02' }">
								 违法关停
								</c:when>
								<c:when test="${room.status eq '03' }">
								审核不通过
								</c:when>
								</c:choose>
							</td>
							<td><button class="btn btn-success" name="updateName">修改房间名称</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	${success }
	<script>
    $("button[name='updateName']").click(function () {
        var flag=$(this).text();
        if(flag=="修改房间名称"){
            var $name=$(this).parent().parent().children().eq(1);
            var text=$name.text();
            if(text==null||text==""){
                text=$name.children().eq(0).val();
            }
            console.log(text)
            console.log($name)
            var $input=$("<input type='text'>").val(text);
            $name.html($input);
            $(this).text("保存");
        }else if(flag=="保存"){
            var $name=$(this).parent().parent().children().eq(1);
            var $id=$(this).parent().parent().children().eq(0);
            var text=$name.children().eq(0).val();
            $name.html(text);
            //Ajax调用处理
            var data={
                "id": $id.text(),
                "name":text
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/room/updateName.action",
                dataType:"json",
                type:"post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(data),
                success:function (res) {
                    if(res.code==200){
						alert(res.msg);
                    }
                }
            });
            $(this).text("修改房间名称");
        }

    })

</script>
	
</body>
</html>