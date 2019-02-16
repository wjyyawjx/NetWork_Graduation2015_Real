$(function(){
	$("#add").click(function(){
		$("#a2").show();
	})
	$("#a2").hide();
	//查询所有
	show();
	//点击返回
	$("#fh").click(function(){
		$("#a2").hide();
		//把表单参数清空
		$('#a3')[0].reset();
	});
	//点击表单提交按钮
	$("#cabinetSubmit").click(function(){
		var url="../../../charge/addandupdate.action";
		var data=$("#a3").serialize(); //将表单序列化
		$.post(url,data,function(mes){
			if (mes.state==1) { 
			    swal("操作成功！", "你的虚拟文件已经被操作。","success");
			
			    $("#a2").hide();
			    $("#tb").html("");
			    $('#a3')[0].reset();
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
	$("#tb").html("");
	var url="../../../charge/findall.action";
	$.post(url,null,function(mes){
		$.each(mes,function(i,item){
				$("#tb").append("<tr>" +
				"<td>"+item.chId+"</td>"+
				"<td>"+item.chType+"</td>"+
				"<td>"+item.chCharge+"</td>"+
				"<td>"+item.chOverdue+"</td>"+
				"<td>" +
				"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.chId+");'>修改</button>" +
				"<button type='button' class='btn btn-danger' onclick='showDelete("+item.chId+");'>删除</button>" +
				"</td>"+
				"</tr>");
		})
		
	},"json");
}
/**
 * 修改，根据id查询
 * @param id
 * @returns
 */
function showUpdate(id){
	$("#a2").show();
	var url="../../../charge/findById.action";
	var data={"chId":id};
	$.post(url,data,function(mes){
		$("#chId").val(mes.chId);
		$("#chType").val(mes.chType);
		$("#chCharge").val(mes.chCharge);
		$("#chOverdue").val(mes.chOverdue);
	},"json");
}

//删除
function showDelete(id){
	var url="../../../charge/deletes.action";
	var data={"chId":id}
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
	},"json")
}

