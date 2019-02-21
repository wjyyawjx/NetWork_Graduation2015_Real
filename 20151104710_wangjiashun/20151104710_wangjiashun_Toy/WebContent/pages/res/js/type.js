$(function(){
	 //初始化列表
	showList2();
		
	 
		
		/* /**
		 * 点击增加时,弹出层
		 */
		$("#addBtn").click(function(){
			$("#addOrUpdateDiv").show();
		});
		
		$("#cancelBtn").click(function(){
			$("#addOrUpdateDiv").hide();
		})
		/**
		 * 提交
		 */
		 $("#studentSubmit").click(function(){
			
			var url = "../../users/addOrUpdate_TypeAction.action";
			var data = $("#typeForm").serialize();
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
* 显示所有行的方法
*/
function showList(data){
	var url = "../../users/findType_TypeAction.action";
	$("#tab").html(""); 
	$.post(url,data,function(mes){
		
		$.each(mes,function(index,item){
			
			$("#tab").append("<tr><td>"+item.typeId+"</td><td>"+(item.typeName==undefined?"":item.typeName)+"</td><td>"+(item.typeNumber==undefined?"":item.typeNumber)+"</td><td>"+(item.typeRemark==undefined?"":item.typeRemark)+"</td><td><input type='button' class='btn btn-primary' value='修改' onclick=showUpdate(\'"+item.typeId+"\')><input type='button' class='btn' value='删除'  onclick=deletItem(\'"+item.typeId+"\')></td></tr>");
			
		})
		
	},"json");
}
/**
* 显示所有行的方法
*/
function showList2(){
	var url = "../../users/findType2_TypeAction.action";
	var data=null;
	$("#tab").html(""); 
	$.post(url,data,function(mes){
		
		$.each(mes,function(index,item){
			
			$("#tab").append("<tr><td>"+item.typeId+"</td><td>"+(item.typeName==undefined?"":item.typeName)+"</td><td>"+(item.typeNumber==undefined?"":item.typeNumber)+"</td><td>"+(item.typeRemark==undefined?"":item.typeRemark)+"</td><td><input type='button' class='btn btn-primary' value='修改' onclick=showUpdate(\'"+item.typeId+"\')><input type='button' class='btn' value='删除'  onclick=deletItem(\'"+item.typeId+"\')></td></tr>");
			
		})
		
	},"json");
}
/**
 * 显示修改
 */
function showUpdate(id){
	var url = "../../users/showUpdate_TypeAction.action";
	var data = {"vos.typeId":id};
	$.post(url,data,function(mes){
		if(mes){
			
			$("#addOrUpdateDiv").show();
			/* $("#titleForm").setForm(mes); */
			$("#typeId").val(mes.typeId);
			$("#typeName").val(mes.typeName);
			$("#typeNumber").val(mes.typeNumber);
			$("#typeRemark").val(mes.typeRemark);
			
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
	var url = "../../users/delete_TypeAction.action";
	var data = {"vos.typeId":id};
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
 * 查询
 * @returns
 */
function queryStu(){
	
	var data = $("#queryForm").serialize();
	showList(data);
	
}
