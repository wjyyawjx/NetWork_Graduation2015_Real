<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8" import="java.util.*,java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.1.3.2.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/ajaxupload.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  
  <body>
  <script type="text/javascript">
    $(function(){
	//上传图片
	new AjaxUpload('#addLabProdPic', {
		action: '${pageContext.request.contextPath}/manage/upload.jsp', 
		name: 'picFile',
		responseType: 'json',
		onSubmit : function(file , ext){
			if (ext && /^(jpg|png|bmp)$/.test(ext.toLowerCase())){
				this.setData({
					'picName': file
				});
			} else {
				alert("请上传格式为 jpg|png|bmp 的图片！");
				return false;				
			}
		},
		onComplete : function(file,response){
			if(response.error) {
				alert(response.error);
				return;
			}
			//alert(response.picUrl);
			show(response.picUrl);
		}		
	});
})
  
  function show(path){

   if(document.all)//IE
   {
   //path = "D:/upload/11.png";
   document.getElementById("imgPreview").innerHTML="";
   document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果www.2cto.com  
   }
   else//FF
   {
   //path = "D:/upload/11.png";
   //document.getElementById("imgPreview").innerHTML = "<img id='img1' width='120px' height='100px' src='"+path+"'/>";
   
   document.getElementById("viewImg").src = path;
   
    }  
   };
  </script>
    <h1>Ajax文件上传例子,选择图片后立即上传,无需点击上传按钮</h1>
	<button id="addLabProdPic">选择图片</button>
	<br>
	<div id="imgPreview" style='width:120px; height:100px;'>
	 <img id="viewImg"  width="200px" height="200px;">
	 <%         
		String param = request.getParameter("param");//param就是取到的传递过来的内容	
	 %> 	
	 alert(<%=param%>);
	 <img src="/upload/test.png"  width="200px" height="200px;">
	 </div>
  </body>
</html>