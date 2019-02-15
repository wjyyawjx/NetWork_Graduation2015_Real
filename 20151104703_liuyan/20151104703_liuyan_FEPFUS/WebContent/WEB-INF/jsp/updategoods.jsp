<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品</title>
</head>
<body>
<form action="update.action">
  <table width="599"  border="1" align="center">
    <tr>
    <td width="96" rowspan="4"> 
      <img style=" height:100% ; width:100%" alt=""  src="${comm.c_img}" >
    </td>
    <td width="148" height="20">商品名称：<input id="c_name" type="text" name="c_name" value="${comm.c_name}"/></td>
  </tr>
  <tr>
    <td height="20">商品价格：<input id="c_price" type="text" name="c_price" value="${comm.c_price}"/></td>
  </tr>
  <tr>
    <td height="20">商品类型：<select name="c_type" id="c_type">
					         <option value="植物">植物</option>
					         <option value="其它">其它</option>
					         <option value="动物" selected="selected">${comm.c_type}</option>
		                </select></td>
  </tr>
  <tr>
    <td height="60">商品描述：<textarea rows="2.5" cols="15" id="c_des" name="c_des">${comm.c_des}</textarea></td>
      
  </tr>
</table>
  <div align="center">
    <input type="submit" value="提交">
  </div>
</form>
   
</body>
</html>