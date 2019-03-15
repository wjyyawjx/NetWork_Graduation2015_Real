<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${lab_place.campus}${lab_place.building}${lab_place.houseId}
<br><br><br>
 <c:forEach items="${lab_stu}" var="stu">
 ${stu.name}${stu.num}
 <br>
 </c:forEach>
 <br><br><br>
  <c:forEach items="${lab_teach}" var="teach">
  ${teach.name}${teach.num}
  <br>
 </c:forEach>
  <br><br><br>
 ${lab_th.temperature}${lab_th.humidity}
  <br><br><br>
  <c:forEach items="${lab_ths}" var="lab_ths">
  ${lab_ths.temperature}+++${lab_ths.humidity}+++${lab_ths.time}
  <br>
 </c:forEach>
</body>
</html>