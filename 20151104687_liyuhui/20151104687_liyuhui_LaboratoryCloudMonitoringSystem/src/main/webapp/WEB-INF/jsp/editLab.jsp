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
        <form action="updateLab" method="post">
            	实验室名: <input type="text" name="lName" value="${lab.lName}"> <br><br>
     			授权用户:<br>
            <div style="text-align:left;width:300px;margin:0px auto;padding-left:50px">
                <c:forEach items="${us}" var="us">
                    <c:set var="hasPermission" value="false" />
                    <c:forEach items="${currentusers}" var="currentusers">
                        <c:if test="${us.id==currentusers.id}">
                            <c:set var="hasPermission" value="true" />
                        </c:if>
                    </c:forEach>
                    <input type="checkbox"  ${hasPermission?"checked='checked'":"" } name="userIds" value="${us.id}"> ${us.name}<br>
                </c:forEach>
            </div>   
            <br><br>
            	实验室位置：<br>
            <div style="text-align:left;width:300px;margin:0px auto;padding-left:50px">
                <c:forEach items="${places}" var="ps">
                    <c:set var="hasPermission" value="false" />
                        <c:if test="${ps.id==place.id}">
                            <c:set var="hasPermission" value="true" />
                        </c:if>
                    <input type="radio"  ${hasPermission?"checked='checked'":"" } name="placeId" value="${ps.placeId}"> ${ps.campus}${ps.building}${ps.houseId},${ps.major}<br>
                </c:forEach>
            </div>          
             
            <input type="hidden" name="lId" value="${lab.lId}">
            <input type="submit" value="修改">
        </form>  
    </div>
</div>
</body>
</html>