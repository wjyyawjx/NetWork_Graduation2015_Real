$(function(){
	 //初始化列表
	showList2();
	getMemberName();
		
	 
		
		/* /**
		 * 点击增加时,弹出层
		 */
		$("#addBtn").click(function(){
			setVoteType();
			$("#addOrUpdateDiv").show();
		});
		
		$("#cancelBtn").click(function(){
			$("#addOrUpdateDiv").hide();
		})
		/**
		 * 提交
		 */
		 $("#studentSubmit").click(function(){
			if($("#ids").val()!=1){
				alert("进入此方法");
				$("#addOrUpdateDiv").val("");
			}
			var url = "../../users/addOrUpdate_TitleAction.action";
			var data = $("#titleForm").serialize();
			$.post(url,data,function(mes){
				if(mes.state==1){
					alert("操作成功!");
					 $("#addOrUpdateDiv").hide();
					showList2(); 
				}
			},"json");
		})
 
 
});
/**
 * 获取登录的session
 */
function getMemberName(){
	
	var url="../../users/getUser_memberAction.action";
	var data = null;
	$.post(url,data,function(mes){
		$("#nameH2").html("欢迎你："+mes.memberEmail);
		$("#voteMemberName").val(mes.memberId);
	},"json");
}

/**
* 显示所有行的方法
*/
function showList(data){
	var url = "../../users/findTitle_TitleAction.action";
	$("#tab").html(""); 
	$.post(url,data,function(mes){
		
		$.each(mes,function(index,item){
			
			$("#tab").append("<tr><td>"+item.voteTypeName+"</td><td>"+item.titleName+"</td><td>"+(item.startTime==undefined?"":item.startTime)+"</td><td>"+(item.endTime==undefined?"":item.endTime)+"</td><td>"+item.voteMemberName+"</td><td>"+(item.titleRemark==undefined?"":item.titleRemark)+"</td><td><input type='button' class='btn btn-primary' value='修改' onclick=showUpdate(\'"+item.titleId+"\')><input type='button' class='btn' value='删除'  onclick=deletItem(\'"+item.titleId+"\')></td></tr>");
			
		})
		
	},"json");
}
/**
* 显示所有行的方法
*/
function showList2(){
	var url = "../../users/findTitle2_TitleAction.action";
	var data=null;
	$("#tab").html(""); 
	$.post(url,data,function(mes){
		
		$.each(mes,function(index,item){
			
			$("#tab").append("<tr><td>"+item.voteTypeName+"</td><td>"+item.titleName+"</td><td>"+(item.startTime==undefined?"":item.startTime)+"</td><td>"+(item.endTime==undefined?"":item.endTime)+"</td><td>"+item.voteMemberName+"</td><td>"+(item.titleRemark==undefined?"":item.titleRemark)+"</td><td><input type='button' class='btn btn-primary' value='修改' onclick=showUpdate(\'"+item.titleId+"\')><input type='button' class='btn' value='删除'  onclick=deletItem(\'"+item.titleId+"\')></td></tr>");
			
		})
		
	},"json");
}
/**
 * 显示修改
 */
function showUpdate(id){
	setVoteType();//加载类型
	var url = "../../users/showUpdate_TitleAction.action";
	var data = {"vo.titleId":id};
	$.post(url,data,function(mes){
		if(mes){
			
			$("#addOrUpdateDiv").show();
			/* $("#titleForm").setForm(mes); */
			$("#titleId").val(mes.titleId);
			$("#titleName").val(mes.titleName);
			$("#voteMemberId").val(mes.voteMemberId);
			$("#voteTypeId").val(mes.voteTypeId);
			$("#titleRemark").val(mes.titleRemark);
			$("#startTime").val(mes.startTime);
			$("#endTime").val(mes.endTime);
			$("#ids").val(1);
		}else{
			alert("找不到该学生!");
		}
		
	},"json")
}
/**
 * 删除
 * @param id
 * @returns
 */
function deletItem(id){
	var url = "../../users/delete_TitleAction.action";
	var data = {"vo.titleId":id};
	$.post(url,data,function(mes){
		
		if(mes.state==1){
			alert("删除成功!");
			showList2();//刷新页面
		}else{
			alert("操作失败!");
		}
		
	},"json")
}
/**
 * 加载类型
 */
function setVoteType(){
	
	var url="../../users/findType_TypeAction.action";
	var data = null ;
	$("#voteTypeId").html("");
	
	$.ajax({ 	
		type:"post",
		url:url,
		data:data,
		async:false, //同步
		dataType:"json",
		success:function(mes){
			$.each(mes,function(i,item){
				$("#voteTypeId").append("<option value='"+item.typeId+"'>"+item.typeName+"</option>");
			})
		},
		error:function(){
			alert("请求失败");
		}
	});
	
}
/**
 * 加载类型
 */
/*function setVoteType(){
	
	var url="../../users/findType_TypeAction.action";
	var data = null ;
	$("#voteTypeId").html("");
	
	$.ajax({ 	
		type:"post",
		url:url,
		data:data,
		async:false, //同步
		dataType:"json",
		success:function(mes){
			$.each(mes,function(i,item){
				$("#voteTypeId").append("<option value='"+item.typeId+"'>"+item.typeName+"</option>");
			})
		},
		error:function(){
			alert("请求失败");
		}
	});
	
}*/
/**
 * 查询
 * @returns
 */
function queryStu(){
	
	var data = $("#queryForm").serialize();
	showList(data);
	
}
