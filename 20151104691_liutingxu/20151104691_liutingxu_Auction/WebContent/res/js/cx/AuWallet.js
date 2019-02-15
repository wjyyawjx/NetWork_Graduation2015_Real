var curPage = 1;
var maxPage = 0;
$(function(){
	
	query(null);
	findRows(null);
	queryUser();
	
	
	$("#query").click(function() {
        var data = $("#queryForm").serialize(); //将表单序列化
        query(data);
        findRows(data);
    });
	
	$("#divBody").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
		qk()
	});
	
	$("#exit").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
		qk()
	});
})

/**
 * 查询总行数
 * @returns
 */
function findRows(data){
	$(".pagination").html("");
	var url="../../wallet/findCount.action";
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
			query(data);
		});
	},"json");
}
/**
 * 查询所有商品
 * @returns
 */
function query(data){
	$("#body").html("");
	var url="../../wallet/queryAll.action";
	var data=data;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#body").append("<tr><td>"+item.waId+"</td><td>"+item.userName+"</td><td>"+item.waBalance+"</td><td><button type='button' class='btn btn-danger btn-sm' onclick=\"deleteById(\'"+item.waId+"\')\" >删除</button>&nbsp;&nbsp;&nbsp;<button type='button' data-toggle='modal' data-target='#myModal' onclick=\"updateForm(\'"+item.waId+"\')\" class='btn  btn-warning btn-sm'>修改</button></td></tr>");
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
		query(data);
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
		query(data);
		return;
	}else{
		swal("已经到最后一页了")
	}
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
			  var url="../../wallet/delete.action";
				var data={"waId":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
					}else{
						swal("删除失败！", "操作失败","error")
					}
					query();
				},"json"); 
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
}
/**
 * 增加或修改
 * @returns
 */
function addOrUpdate() {
	alert(1);
	var url="../../wallet/addOrUpdate.action";
	var data=$("#myFrom").serialize();
	$.post(url,data,function(mes){
		if(mes.state == 1){
			swal("操作成功！", "操作成功","success");
			query();
			$("#divBody").hide();
			$("#myFrom").hide();
			qk();
		}else{
			swal("操作失败！", "操作失败","error");
			query();
			 
		}
		$('#myModal').modal('hide');
	},"json");
}
/**
 * 显示增加
 * @returns
 */
function showFrom() {
	$("#divBody").show();
	$("#myFrom").show();
}
/**
 * 关闭增加
 * @returns
 */
function hideFrom() {
    $('.form-horizontal')[0].reset();
}
/**
 * 查询用户下拉框
 * @returns
 */
function queryUser(){
	$("#userSelect").html("<option value=''>=======请选择=======</option>");
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#userSelect").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
		});
	},"json");
}

/**
 * 显示修改页面
 * @param id
 * @returns
 */
function updateForm(id){
	$("#divBody").show();
	$("#myFrom").show();
	var url = "../../wallet/findById.action";
	 var data = {"waId":id}
	 $.post(url,data,function(mes){
//		 var options = { jsonValue: mes }; 
//		 $("#myForm").initForm(options); //通过json直接给表单的控件赋值
		 $("#waId").val(mes.waId);
		 $("#userSelect").val(mes.userId);
		 $("#waBalance").val(mes.waBalance);
	 },"json");
}
function qk(){
	$("#waId").val("");
	 $("#userSelect").val("");
	 $("#waBalance").val("");
}
