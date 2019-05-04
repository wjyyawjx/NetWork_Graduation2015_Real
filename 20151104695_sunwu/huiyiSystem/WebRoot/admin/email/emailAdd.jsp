<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
   String path = request.getContextPath();
   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        
        
        <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="<%=path %>/js/popup_shuaxin_no.js"></script>
        
        
        <script type="text/javascript">
		    function yuangongByOrg()
		    {
		       	var strUrl = "<%=path %>/org?type=orgAll1";
		       	var ret = window.open(strUrl,"","width=800px,height=400px,top=400px,left=800px,status=no,directories=yes,scrollbars=yes,resizable=no,model=true");
			    if(ret==undefined)
			    {
			       ret="";
			    }
		    }
		    
		    function check1()
            {
               if(document.formAdd.to_yuangong_id.value=="")
               {
                  alert("请输入接收者");
                  return false;
               }
               if(document.formAdd.title.value=="")
               {
                  alert("请输入文件标题");
                  return false;
               }
               var url="<%=path %>/email?type=fajianxiangAdd";
               document.formAdd.action=url;
		       document.formAdd.submit();
            }
            
		    function check2()
            {
               if(document.formAdd.to_yuangong_id.value=="")
               {
                  alert("请输入接收者");
                  return false;
               }
               if(document.formAdd.title.value=="")
               {
                  alert("请输入文件标题");
                  return false;
               }
               var url="<%=path %>/email?type=caogaoxiangAdd";
               document.formAdd.action=url;
		       document.formAdd.submit();
            }
		    
		    function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
		</script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>新文件</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         接收者：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="to_yuangong_id" id="to_yuangong_id" readonly="readonly"/>
						        <input type="button" value="选择" onclick="yuangongByOrg()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       标题：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="title" size="70"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="content"  basePath="/fckeditor" width="500" height="160" value="请输入内容" toolbarSet="Basic"></FCK:editor>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        附件：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fujian" id="fujian" size="30" readonly="readonly"/>
						        <input type="button" value="上传" onclick="up()"/>
						        <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="from_yuangong_id" value="${sessionScope.yuangong.id }"/>
						       <input type="button" value="发送" onclick="check1()"/>&nbsp; 
						       <input type="button" value="备份到私人文件" onclick="check2()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
