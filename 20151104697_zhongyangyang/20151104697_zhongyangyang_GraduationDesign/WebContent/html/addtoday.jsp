<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  function check() {
		for (var i = 0; i < document.form1.elements.length - 1; i++) {
			if (document.form1.elements[i].value == "") {
				alert("当前表单不能有空项");
				document.form1.elements[i].focus();
				return false;
			}
		}
		return true;

		}
  
  function show() {
      var fileTag = document.getElementById('picture');
      fileTag.onchange = function () {
          var file = fileTag.files[0];
          var fileReader = new FileReader();
          fileReader.onloadend = function () {
              if (fileReader.readyState == fileReader.DONE) {
                  document.getElementById('img').setAttribute('src', fileReader.result);
              }
          }
          fileReader.readAsDataURL(file);
      }
  }
  
</script>
</head>
<body>
<h2>添加商品信息</h2>
<form action="../Buytoday?opr=addBuy" method="post" enctype = "multipart/form-data">

<table>
<tr>
  		<img src="${pageContext.request.contextPath}/image/preview.jpg" id="img" style="width:80px;height:80px;"/>
  </tr>
  <tr>
	<td>图片上传</td>
	<td><input type="file" id="picture" name="pictureupload" onclick="show()"/> </td>
  </tr>
  <tr>
  <tr>
     <td>商品名：</td>
    <td><input type="text" name="buyTyname" ></td>
  </tr>
  <tr>
    <td>现价：</td>
    <td><input type="text" name="original"></td>
  </tr>
   <tr>
    <td>原价：</td>
    <td><input type="text" name="present"></td>
  </tr>
   <tr>
    <td>折扣：</td>
    <td><input type="text" name="dscount"></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align: center"><input type="submit" value="提交信息"></td>
   </tr>
  </table>
</form>

</body>
</html>