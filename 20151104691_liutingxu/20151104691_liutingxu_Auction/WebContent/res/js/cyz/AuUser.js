$(function(){
	
	$.ajax({

	    url: '',

	    async: false

	});
	
	$("#insertBtn").click(function(){
		$("#divBody").show();
		$("#myFrom").show();
	});
	query(null);
	$("#exit").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
	});
});
/**
 * 查询显示所有
 * @param data
 * @returns
 */
function query(data){
	$("#body").html("");
	var url="../../user/queryAll.action";
	var data=data;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var sex = "";
			if(item.userSex == 0){
				sex = "男";
			}else{
				sex = "女";
			}
			var type = "";
			if(item.userType == 1){
				type = "用户";
			}else if(item.userType == 2){
				type = "卖家";
			}else{
				type = "管理员";
			}
			$("#body").append("<tr><td>"+item.userId+"</td><td>"+item.userName+"</td><td>"+item.userPwd+"</td><td>"+sex+"</td><td>"+item.userPhone+"</td><td>"+type+"</td><td><button type='button' onclick=\"deleteById(\'"+item.userId+"\')\" class='btn btn-primary'>删除</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn' data-target='#myModal' data-toggle='modal' onclick=\"updateFrom(\'"+item.userId+"\')\" >修改</button></td></tr></tr>");
		});
	},"json");
}
/**
 * 增加或修改
 * @returns
 */
function submitForm(){
	alert(1)
	var url="../../user/addOrUpdate.action";
	var data= $("#myFrom").serialize();
	$.post(url,data,function(mes){
		if(mes.state == 1){
			alert("操作成功");
			query(null);
		}else{
			alert("操作失败");
		}
		$('#myModal').modal('hide');
		query(null);
	},"json");
	$("#divBody").hide();
	$("#myFrom").hide();
}
/**
 * 修改
 * @param id
 * @returns
 */
function updateFrom(id){
	$("#divBody").show();
	$("#myFrom").show();
	var url="../../user/findById.action";
	var data={"userId":id};
	$.post(url,data,function(mes){
		$("#userIds").val(mes.userId);
		$("#userNames").val(mes.userName);
		$("#userPwds").val(mes.userPwd);
		if(mes.userSex == 1){
			$("input[name='userSex']").get(0).checked = true;
		}else{
			$("input[name='userSex']").get(1).checked = true;
		}
		$("#userPhones").val(mes.userPhone);
		$("#typeIds").val(mes.userType);
	},"json");
}
/**
 * 关闭窗口表单清空
 * @returns
 */
function closeForm(){
	 $('.form-horizontal')[0].reset();
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
			  var url="../../user/delete.action";
				var data={"id":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
						query(null);
					}else{
						swal("删除失败！", "操作失败","error")
						query(null);
					}
					findCount();
				},"json"); 
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
	/*var url="../../user/delete.action";
	var data={"id":id};
	$.post(url,data,function(mes){
		if(mes.state == 1){
			alert("删除成功");
			query(null);
		}else{
			alert("删除失败");
			query(null);
		}
	},"json");*/
}
/**
* 根据名字查询
*/
function queryStu(){
	$("#body").html("");
	var url ="../../user/findByUser.action";
	var data = {"userName":$("#titleName").val()};
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			var sex = "";
			if(item.userSex == 0){
				sex = "男";
			}else{
				sex = "女";
			}
			var type = "";
			if(item.userType == 1){
				type = "用户";
			}else if(item.userType == 2){
				type = "卖家";
			}else{
				type = "管理员";
			}
			$("#body").append("<tr><td>"+item.userId+"</td><td>"+item.userName+"</td><td>"+item.userPwd+"</td><td>"+sex+"</td><td>"+item.userPhone+"</td><td>"+type+"</td><td><button type='button' onclick=\"deleteById(\'"+item.userId+"\')\" class='btn btn-primary'>删除</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn' data-target='#myModal' data-toggle='modal' onclick=\"updateFrom(\'"+item.userId+"\')\" >修改</button></td></tr></tr>");
		})
	},"json")
}