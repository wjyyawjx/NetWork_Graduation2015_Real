var curPage = 1;
var maxPage = 0;
$(function(){
	queryUsers();
	queryAll(null);
	findRows(null);
	
	$("#query").click(function() {
        var data = $("#queryForm").serialize(); //将表单序列化
        queryAll(data);
        findRows(data);
    });
	
	
	$("#btn").click(function(){
		var url="../../site/addOrUpdate.action";
		var data=$("#myFrom").serialize();
		$.post(url,data,function(mes){
			if(mes.state == 1){
				swal("操作成功！")
			}else{
				swal("操作成功！")
			}
			queryAll();
			findRows(null);
			$("#divBody").hide();
			$("#myFrom").hide();
			 $('.form-horizontal')[0].reset();
		},"json"); 
	})
	
	$("#insertBtn").click(function(){
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
})
/**
 * 显示增加
 * @returns
 */
function showFrom(){
	findUser();
}
/**
 * 关闭增加
 * @returns
 */
function hideFrom(){
    $('.form-horizontal')[0].reset();
}
/**
 * 查询总行数
 * @returns
 */
function findRows(data){
	$(".pagination").html("");
	var url="../../site/findCount.action";
	$.post(url,data,function(mes){
		maxPage = mes.totalPages;
		if(maxPage>0){
			$(".pagination").append("<li id='up'><a href='#' onclick='up()'>&laquo;</a></li>");
		}
		for (var i = 0; i < maxPage; i++) {
			$(".pagination").append("<li><a href='#'>"+(i+1)+"</a></li>");
		}
		if(maxPage>0){
			$(".pagination").append("<li id='down'><a href='#' onclick='down()'>&raquo;</a></li>");
		}
		/**
		 * 页数
		 */
		$(".pagination li:eq(1)").addClass("active");
		$(".pagination li:not(':first,:last')").click(function(){
			$(this).siblings().removeClass('active');
			$(this).addClass("active");
			var data = {"curPage":$(this).text()};
			queryAll(data);
		});
	},"json");
}
/**
 * 上一页
 * @returns
 */
function up(){
	var upPage =  parseInt($(".active").text())-parseInt(1);
	if(upPage>0){
		$(".pagination li"+":eq("+(upPage)+")").addClass("active").siblings("li").removeClass("active");
		var data = {"curPage":upPage};
		queryAll(data);
		return;
	}else{
		swal("已经到第一页了")
	}
}
/**
 * 下一页
 * @returns
 */
function down(){
	var downPage =  parseInt($(".active").text())+parseInt(1);
	if(downPage<=maxPage){
		$(".pagination li"+":eq("+(downPage)+")").addClass("active").siblings("li").removeClass("active");
		var data = {"curPage":downPage};
		queryAll(data);
		return;
	}else{
		swal("已经到最后一页了")
	}
}
/**
 * 查询所有地址
 * @returns
 */
function queryAll(data){
	$("#body").html("");
	var url="../../site/queryAll.action";
	var data=data;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#body").append("<tr><td>"+item.siId+"</td><td>"+item.siName+"</td><td>"+item.userName+"</td><td>"+item.siContent+"</td><td>"+item.siPhone+"</td><td><button type='button' class='btn btn-primary' onclick=\"deleteById(\'"+item.siId+"\')\" >删除</button>&nbsp;&nbsp;&nbsp;<button type='button'  onclick=\"updateForm(\'"+item.siId+"\')\" class='btn'>修改</button></td></tr>");
		});
	},"json");
}
/**
 * 修改上屏
 * @returns
 */
function updateForm(id){
	findUser();
	$("#divBody").show();
	$("#myFrom").show();
	var url="../../site/findById.action";
	var data={"siId":id};
	$.post(url,data,function(mes){
		$("#sId").val(mes.siId);
		$("#siNames").val(mes.siName);
		$("#uId").val(mes.userId);
		$("#siContents").val(mes.siContent);
		$("#siPhones").val(mes.siPhone);
	},"json");
}

/**
 * 显示增加用户列表
 * @returns
 */
function findUser(){
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#uId").append("<option value=''>---请选择用户---</option>");
		$.each(mes,function(index,item){
			$("#uId").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
		});
	},"json");
}
/**
 * 查询用户下拉框
 * @returns
 */
function queryUsers(){
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#userIds").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
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
			  var url="../../site/delete.action";
				var data={"siId":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
					}else{
						swal("删除失败！", "操作失败","error")
					}
					queryAll();
					findRows(null);
				},"json"); 
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
}