<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
</head>
<style type="text/css">    
     body{    
        background-image: url(img/bangkok-city.jpg);    
        background-size:cover;  
     }    

 </style> 
<body>
	<form action="SimpleFileupload" method="post" enctype="multipart/form-data">  
		<div id="div" style="width:1000px; height:50px; border:1px solid #000;">
			<div style="margin-top:25px;text-align: center;">
				文件上传：<input type="file" name="fileupload"/> 
			</div>
		</div>
    	 <div id="div" style="width:1000px; height:50px; border:1px solid #000;">
			<div style="margin-top:25px;text-align: center;">
				 描述：<input type="text" name="desc" id="desc"/>  
				 <input type="submit" value="提交"/>  
			</div>
		</div>
    </form>  
    <form action="index.jsp"> 
    <div id="div" style="width:1000px; height:50px; border:1px solid #000;">
			<div style="margin-top:25px;text-align: center;">
				<input type="submit" value="返回主页"/>  
			</div>
		</div> 
    </form> 
   	<div style="text_align: center;">
   		<input type="button" value="下载文件" onclick="window.location.href='ListFileServlet'">
   	</div>
</body>
</html>