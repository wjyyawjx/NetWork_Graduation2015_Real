$(function(){
	$("#a2").hide()
	//查询地区表所有
	show();
	
	
	$("#fh").click(function(){
		$("#a2").hide();
		$("#loId").val("");
		$("#option").val("");
		$("#loName").val("");
		$("#loPhone").val("");
	})
	$("#add").click(function(){
		$("#a2").show()
	})
	
	//查询地区表所有
	var url="../../../area/selectAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#option").append("<option value="+item.arId+">"+item.arName+"</option>");
		})
	},"json"); 
	
	//模糊查询
	$("#a11").click(function(){
		$("#tb").html("");
		var url="../../../locker/selectByName.action";
		var data={"loName":$("#a12").val()}
		$.post(url,data,function(mes){
			$.each(mes,function(i,item){
				$("#tb").append("<tr>" +
								"<td>"+item.loId+"</td>"+
								"<td>"+item.arName+"</td>"+
								"<td>"+item.loName+"</td>"+
								"<td>"+item.loPhone+"</td>"+
								"<td>" +
								"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.loId+");'>修改</button>" +
								"<button type='button' class='btn btn-danger' onclick='showDelete("+item.loId+");'>删除</button>" +
								"</td>"+
								"</tr>");
			})
		},"json")
		$("#a12").val("");
	});
	
	$("#lockerSubmit").click(function(){
		var url="../../../locker/addOrUpdate.action";
		var data=$("#a3").serialize(); //将表单序列化
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
	
})
function show(){
	//查询地区表所有
	var url="../../../locker/selectAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#tb").append("<tr>" +
							"<td>"+item.loId+"</td>"+
							"<td>"+item.arName+"</td>"+
							"<td>"+item.loName+"</td>"+
							"<td>"+item.loPhone+"</td>"+
							"<td>" +
							"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.loId+");'>修改</button>" +
							"<button type='button' class='btn btn-danger' onclick='showDelete("+item.loId+");'>删除</button>" +
							"</td>"+
							"</tr>");
		})
	},"json");
}

//删除
function showDelete(id){
		var url="../../../locker/deleteByPrimaryKey.action";
		var data={"loId":id};
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
//修改
function showUpdate(id){
	$("#a2").show();
	var url="../../../locker/selectByPrimaryKey.action";
	var data={"loId":id};
	$.post(url,data,function(mes){
		//$("#option").html("")
		$("#loId").val(mes.loId);
		$("#option").val(mes.arId);
		$("#loName").val(mes.loName);
		$("#loPhone").val(mes.loPhone);
	},"json");
}
