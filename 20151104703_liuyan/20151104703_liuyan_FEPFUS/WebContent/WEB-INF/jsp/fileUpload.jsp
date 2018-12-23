<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
 
<script>
// 判断是否填写上传人并已选择上传文件
function check(){
    var name = document.getElementById("name").value;
    var file = document.getElementById("file").value;
    var c_type = document.getElementById("c_type").value;
    var c_price = document.getElementById("c_price").value;
    var c_des = document.getElementById("c_des").value;
    if(name==""){
        alert("填写上传人");
        return false;
    }
    if(c_type==""){
        alert("填写类型");
        return false;
    }
    if(c_price==""){
        alert("填写价格");
        return false;
    }
    if(c_des==""){
        alert("填写描述");
        return false;
    }
    if(file.length==0||file==""){
        alert("请选择上传文件");
        return false;
    }
    return true;
}
</script>
</head>
<body>
<div align="center">
<div align="left" style="width:24%;">
    <form action="${pageContext.request.contextPath }/fileUpload.action"
    method="post" enctype="multipart/form-data" onsubmit="return check()">
	物品的名字：<input id="name" type="text" name="name" /><br />
	请选择图片：<input id="file" type="file" name="uploadfile" 
                                                   multiple="multiple" /><br />
            物品的类型：<select name="c_type" id="c_type">
					         <option value="植物">植物</option>
					         <option value="其它">其它</option>
					         <option value="动物" selected="selected">动物</option>
		    </select><br />
            物品的价格：<input id="c_price" type="text" name="c_price" /><br />
            物品的描述：<textarea rows="4" cols="50" id="c_des" name="c_des"></textarea>                                               
		       <input type="submit" value="上传" />
	</form>
</div>
</div>
</body>
</html>
