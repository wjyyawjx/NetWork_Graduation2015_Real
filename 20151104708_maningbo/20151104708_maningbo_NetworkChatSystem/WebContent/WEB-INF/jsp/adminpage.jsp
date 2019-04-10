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
			<h1 style="color: red;" class="col-lg-6">审核申请房间</h1>
			<div class="col-lg-3"></div>
		</div>
		<div class="row col-lg-12" height="120px"></div>
		<div class="row">
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
								 驳回
								</c:when>
								</c:choose>
							</td>
							<td>
								<button class="btn btn-success" name="updateStatus" value="1">通过</button>
								<button class="btn btn-danger" name="updateStatus" value="2">驳回</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	${success }
	<script>
    $("button[name='updateStatus']").click(function () {
           var status;
    		if($(this).val()==1){
    			status="01";
        	}else if($(this).val()==2){
        		status="03";
            };
            var $name=$(this).parent().parent().children().eq(1);
            var $id=$(this).parent().parent().children().eq(0);
            var text=$name.children().eq(0).val();
            $name.html(text);
            //Ajax调用处理
            var data={
                "id": $id.text(),
                "status":status
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/room/updateStatus.action",
                dataType:"json",
                type:"post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(data),
                success:function (res) {
                	location.reload(); 
                }
            });
    })

</script>
	
</body>
</html>