<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
	String PID="";
	String goodsName="";
	//int TypeID=-1;
	int superID1=-1;
	int subID1=-1;
	String introduce="";
	String picture="";
	float price=(float)0.0;
	float nowPrice=(float)0.0;
	int sale=0;
	int newGoods=0;
	PID=request.getParameter("ID");
	if (PID!=null && PID!=""){
		int ID=Integer.parseInt(PID);
	      ResultSet rs=conn.executeQuery("select * from tb_goods where ID="+ID);
	      if(!rs.next()){
	    	  out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='ht_index.jsp';</script>");
	      }else{
	    	//TypeID=rs.getInt("TypeID");       
	           // superID1=rs.getInt("superID");
	           // subID1=rs.getInt("subID");
	            goodsName=rs.getString("goodsName");
	            introduce=rs.getString("introduce");
	            price=rs.getFloat("Price");       
	            nowPrice=rs.getFloat("nowPrice");        
	            picture=rs.getString("picture");
	            newGoods=rs.getInt("newgoods");  
	            sale=rs.getInt("sale");
	      }
	      ResultSet rs_super = conn.executeQuery("select ID,TypeName from tb_supertype group by ID,TypeName");
	      int superID=-1;
	      String superName="";
	      if(rs_super.next()){
	    	  superID=rs_super.getInt(1);
	      }else{
	            out.println("<script language='javascript'>alert('请先录入类别信息!');window.location.href='ht_index.jsp';</script>");
	            return;
	      }
	      int P_superID=-1;
	      ResultSet rs_sub=null;
	      //查询所属小类的默认选项
	      if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	            P_superID=superID1;
	            //superID
	      }else{
	            P_superID=Integer.parseInt(request.getParameter("superID"));
	      }
	      rs_sub = conn.executeQuery("select *from tb_subType where superType ="+P_superID);
	      int subID=-1;
	      String subName="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品添加</title>
<link rel="stylesheet" href="../front/css/mr-01.css" type="text/css">
<script type="text/javascript" src="onclock.js"></script>
<script src="../front/js/jsArr01.js" type="text/javascript"></script>
<script src="../front/js/module.js" type="text/javascript"></script>
<script src="../front/js/jsArr02.js" type="text/javascript"></script>
<script src="../front/js/tab.js" type="text/javascript"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.1.3.2.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/ajaxupload.js"></script>

<script type="text/javascript">
<%--
	$(function(){
		//上传图片
		new AjaxUpload('#picture', {
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
--%>
	function mycheck(){
		//验证
		if(form1.goodsName.value==""){
			alert("请输入商品名称！");
			from1.goodsName.focus();
			return;
		}
		if(form1.picture.value==""){
			alert("请输入图片路径！");
			form1.picture.focus();
			return;
		}
		if(form1.price.value==""){
			alert("请输入商品的定价！");
			form1.price.focus();
			return;
		}
		if(isNaN(form1.price.value)){
			alert("您输入的定价错误，请重新输入！");
			form1.price.value="";
			form1.price.focus();
			return;
		if(from1.introduce.value==""){
			alert("请输入商品简介！");
			form1.introduce.focus();
			return;
		}
		form1.submit();	
		}
	}
</script>
<style type="text/css">
	li{list-style: none;}
</style>
</head>
<body>
		<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
	%>
	<div id="top" style=" background: url(../front/images/top.jpg);height:150px;width:100%; background-size:cover;">
		<span style="margin-left:100px; font-size: 60px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;
		 color: white;">51汽车网后台管理系统</span>	
	</div>	
<table width="100%"height="250"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
	<td>
		<table width="100%" height="350" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
			<tr>
			<td width="250" valign="top">
			<table width="100%" height="480"  border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" background="../front/images/left.jpg"><jsp:include page="navigation.jsp"/></td>
			</tr>
			</table></td>
			<td align="center" valign="top"><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" background="../front/images/center.jpg">
					<table width="100%" height="36"  border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30%" style=" font-size: 10px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;color: white;">&nbsp;当前时间：<%=now %></td>
					</tr>	
				</table></td>
			</tr>
			<table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td valign="top">
                      <form action="goods_modify_deal.jsp" method="post" name="form1" >
                      <fieldset>
                      <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                     
				<tr>
				<td height="27">所属大类：</td>
				<td width="31%" height="27">&nbsp;
				 	<script language="javascript">
                        function F_super(val){
                              var url="";
                              eval("window.location.href='goods_modify.jsp?superID="+val+"&ID="+form1.ID.value+"'");
                         }
                 	</script>
                 	<select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
                          <%rs_super.first();
                           do{
                              superID=rs_super.getInt(1);
                              superName=rs_super.getString(2);
                           %>
                          <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
                          <%}while(rs_super.next());%>
                     </select></td>
                 <td width="13%" height="27"> &nbsp;所属小类：</td>
                 <td width="42%" height="27">&nbsp;
                      <select name="typeID" class="textarea" id="typeID">
	                       <%while(rs_sub.next()){
	                            subID=rs_sub.getInt(1);
	                            subName=rs_sub.getString(3);
	                        %>
	                        <option value="<%=subID%>"><%=subName%></option>
                            <%}%>
                     </select>
              </td>
              		</tr>
              		<tr>
              			 <td width="14%" height="27">&nbsp;商品名称：
              			 <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
              			 <td height="27" colspan="3">&nbsp;
              			 <input name="goodsName" type="text" class="Sytle_text" value="<%=goodsName%>" size="50">
              			  &nbsp;&nbsp;</td> 
              		</tr>
              		<tr>
              			<td height="16">&nbsp;图片文件：</td>
              			<td height="27" colspan="3">&nbsp;
                        <input name="picture" type="text" class="Style_upload" id="picture" value="<%=picture%>" size="30"> 
                        (此处只填写图片文件路径即可)</td>
              		</tr>
              		<tr>
              			<td height="27" align="center">定　　价：</td>
                    	<td height="27">&nbsp;                     
                        <input name="price" type="text" class="Sytle_text" id="price3" value="<%=price%>" size="14">(元)</td>
               			<td height="27" align="center">现&nbsp;&nbsp;&nbsp;&nbsp;价： </td><td height="27">&nbsp;
                        <input name="nowPrice" type="text" class="Sytle_text" id="price4" value="<%=nowPrice%>" size="14">(元)</td>	
              		</tr>
              		<tr>
              			<td height="45">&nbsp;是否新品：</td>
                    	<td>&nbsp; <input name="newGoods" type="radio" class="noborder" value="1"<%if(newGoods==1){out.print(" checked");}%>>是
  						<input name="newGoods" type="radio" class="noborder" value="0"<%if(newGoods==0){out.print(" checked");}%>>否</td>
              			<td>&nbsp;是否特价：</td>
                   	    <td><input name="sale" type="radio" class="noborder" value="1"<%if(sale==1){out.print(" checked");}%>>是
 						<input name="sale" type="radio" class="noborder" value="0"<%if(sale==0){out.print(" checked");}%>>否</td>	
              		</tr>
              		<tr>
              			<td height="103">&nbsp;商品简介：</td>
                    	<td colspan="3"><span class="style5">&nbsp; </span>
                        	<textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"><%=introduce%></textarea></td>	
              		</tr>
              		<tr>
              			<td height="38" colspan="4" align="center">
                        	<input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">&nbsp;                        
							<input name="Submit2" type="reset" class="btn_grey" value="重置">&nbsp;
              				<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()">
                    	</td>	
              		</tr>
              	</table>
				</fieldset>
				</form>
				</table>		
			</table>	
			</table>	
</table>
</body>
</html>
<%}else{
      out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';");
}%>
