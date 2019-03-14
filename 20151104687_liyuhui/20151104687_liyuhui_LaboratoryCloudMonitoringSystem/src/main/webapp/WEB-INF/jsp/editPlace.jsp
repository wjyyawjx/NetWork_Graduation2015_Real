<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<link rel="stylesheet" type="text/css" href="/superAdministrator/css/style.css" />
 
</head>
<body>
 
<div class="workingroom">
 
    <div class="addOrEdit" >
        <form action="updatePlace" method="post">
        	位置ID：<input type="text" name="placeId" value="${place.placeId}"> <br>
			校区：<input type="text" name="campus" value="${place.campus}"> <br> 
			教学楼：<input type="text" name="building" value="${place.building}"> <br>
			房间号：<input type="text" name="houseId" value="${place.houseId}"> <br>
			所属专业：<input type="text" name="major" value="${place.major}"> <br><br>
            <input type="hidden" name="id" value="${place.id}">
            <input type="submit" value="修改">
        </form>  
    </div>
</div>
</body>
</html>