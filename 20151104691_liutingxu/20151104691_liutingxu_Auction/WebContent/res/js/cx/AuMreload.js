$(function(){
	queryAll();
	
	$("#query").click(function() {
        var data = $("#queryForm").serialize(); //将表单序列化
        queryAll(data);
    });
	/**
	 * 用户下拉框
	 * @returns
	 */
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#userIds").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
		});
	},"json");
	$("#insertBtn").click(function(){
		findCom();
		findUser();
		$("#divBody").show();
		$("#myFrom").show();
	});
	$("#divBody").click(function(){
		 $('.form-horizontal')[0].reset();
		$("#divBody").hide();
		$("#myFrom").hide();
	});
	$("#exit").click(function(){
	    $('.form-horizontal')[0].reset();
		$("#divBody").hide();
		$("#myFrom").hide();
	});
});
/**
 * 增加或修改
 * @returns
 */
function addOrUpdate(){
	var url="../../mreload/addOrUpdate.action";
	var data=$("#myFrom").serialize();
	$.post(url,data,function(mes){
		if(mes.state == 1){
			swal("操作成功！")
		}else{
			swal("操作失败！")
		}
		queryAll(null);
		$("#divBody").hide();
		$("#myFrom").hide();
		$('.form-horizontal')[0].reset();
	},"json");
}
/**
 * 查询所有保证金记录
 * @param data
 * @returns
 */
function queryAll(data){
	$("#body").html("");
	var url="../../mreload/queryAll.action";
	var data=data;
	var str = "";
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			if(item.mrState == 1){
				str = "有效";
			}else{
				str = "无效";
			}
			$("#body").append("<tr><td>"+item.mrId+"</td><td>"+item.comName+"</td><td>"+item.userName+"</td><td>"+item.mrDate+"</td><td>"+str+"</td><td><button type='button' class='btn btn-primary' onclick=\"deleteById(\'"+item.mrId+"\')\" >删除</button>&nbsp;&nbsp;&nbsp;<button type='button' onclick=\"updateForm(\'"+item.mrId+"\')\" class='btn'>修改</button></td></tr>");
		});
	},"json");
}
/**
 * 删除
 * @param id
 * @returns
 */
function deleteById(id){
	swal({ 
		  title: "确定删除吗？", 
		  text: "你将无法恢复该虚拟文件！", 
		  type: "warning",
		  showCancelButton: true, 
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "确定删除！", 
		  cancelButtonText: "取消删除！",
		  closeOnConfirm: false, 
		  closeOnCancel: false	
		},
		function(isConfirm){ 
		  if (isConfirm) { 
			  var url="../../mreload/delete.action";
				var data={"mrId":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
					}else{
						swal("删除失败！", "操作失败","error")
					}
					queryAll();
				},"json"); 
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
}
/**
 * 修改上屏
 * @returns
 */
function updateForm(id){
	$("#divBody").show();
	$("#myFrom").show();
	showFrom();
	var url="../../mreload/findById.action";
	var data={"mrId":id};
	$.post(url,data,function(mes){
		$("#mrIds").val(mes.mrId);
		$("#comIda").val(mes.comId);
		$("#userIda").val(mes.userId);
		$("#mrDates").val(mes.mrDate);
		$("#mrStatea").val(mes.mrState);
	},"json");
}


/**
 * 关闭增加
 * @returns
 */
function hideFrom(){
    $('.form-horizontal')[0].reset();
}
/**
 * 查询下拉框
 * @returns
 */
function showFrom(){
	findCom();
	findUser();
}
/**
 * 商品下拉框
 * @returns
 */
function findCom(){
	$("#comIda").html("");
	var url="../../commodity/queryCom.action";
	var data=data;
	$.post(url,data,function(mes){
		$("#comIda").append("<option value=''>--请选择商品--</option>");
		$.each(mes,function(index,item){
			$("#comIda").append("<option value='"+item.comId+"'>"+item.comName+"</option>");
		});
	},"json");
}
/**
 * 用户下拉框
 * @returns
 */
function findUser(){
	$("#userIda").html("");
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#userIda").append("<option value=''>--请选择用户--</option>");
		$.each(mes,function(index,item){
			$("#userIda").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
		});
	},"json");
}