$(function(){
	//表单隐藏
	$("#a2").hide();
	//查询地区表所有
	show();
	
	$("#a3").click(function(){
		$("#a2").hide();
	})
	$("#add").click(function(){
		$("#a2").show();
	})
	//提交
	$("#formSubmit").click(function(){
		$("#areaName").val();
		var url="../../../area/addOrUpdate.action";
		var data=$("#a22").serialize(); //将表单序列化
		$.post(url,data,function(mes){
			if (mes.state==1) { 
			    swal("操作成功！", "你的虚拟文件已经被操作。","success");
			
			    $("#a2").hide();
			    $("#tb").html("");
			    //刷新页面
			    show();
			  } else { 
			    swal("操作失败！", "你的虚拟文件是安全的:)","error"); 
			    
			    $("#a2").hide();
			    $("#tb").html("");
			  //刷新页面
			    show();
			  } 
		},"json");
	})
});
function show(){
	//查询地区表所有
	var url="../../../area/selectAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#tb").append("<tr>" +
							"<td>"+item.arId+"</td>" +
							"<td>"+item.arName+"</td>"+
							"<td>" +
							"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.arId+");'>修改</button>" +
							"<button type='button' class='btn btn-danger' onclick='showDelete("+item.arId+");'>删除</button>" +
							"</td>"+
							"</tr>");
		})
	},"json");
}
//删除
function showDelete(id){
		var url="../../../area/deleteByPrimaryKey.action";
		var data={"arId":id};
		$.post(url,data,function(mes){
			swal({ 
				  title: "确定删除吗？", 
				  text: "你将无法恢复该虚拟文件！", 
				  type: "warning",
				  showCancelButton: true, 
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定删除！", 
				  closeOnConfirm: false
				},
				function(){
					 if (mes.state==1) { 
					    swal("删除！", "你的虚拟文件已经被删除。","success");
					    $("#tb").html("");
					    //刷新页面
					    show();
					  } else { 
					    swal("取消！", "你的虚拟文件是安全的:)","error"); 
					    $("#tb").html("");
					  //刷新页面
					    show();
					  } 
				});
		},"json");
	}

//修改显示
function showUpdate(id){
	$("#a2").show();
	var url="../../../area/selectByPrimaryKey.action";
	var data={"arId":id};
	$.post(url,data,function(mes){
		$("#areaId").val(mes.arId);
		$("#areaName").val(mes.arName);
	},"json");
}













