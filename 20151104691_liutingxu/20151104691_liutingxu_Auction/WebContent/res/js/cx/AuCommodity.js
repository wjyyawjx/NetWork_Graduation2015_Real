var curPage = 1;
var maxPage = 0;
$(function(){
	query(null);
	findRows(null);
	$("#query").click(function() {
        var data = $("#queryForm").serialize(); //将表单序列化
        query(data);
        findRows(data);
    });
	$("#insertBtn").click(function(){
		$("#divBody").show();
		$("#myFrom").show();
		queryType();
		queryUser();
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
 * 查询总行数
 * @returns
 */
function findRows(data){
	$(".pagination").html("");
	var url="../../commodity/findRows.action";
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
 * 显示增加
 * @returns
 */
function showFrom() {
	queryType();
	queryUser();
    $("#big").show();
}
/**
 * 关闭增加
 * @returns
 */
function hideFrom() {
    $("#big").hide();
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
			  var url="../../commodity/delete.action";
				var data={"comId":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
						query();
					}else{
						swal("删除失败！", "操作失败","error")
						query();
					}
					findRows(data);
				},"json"); 
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
}

/**
 * 查询所有商品
 * @returns
 */
function query(data){
	$("#body").html("");
	var url="../../commodity/queryAll.action";
	var data=data;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var str = "";
			if(item.comState == 0){
				str = "<input type='button' onclick=findState(\'"+item.comId+"\') value='通过审核' class='btn btn-info btn-sm'>";
			}else if(item.comState == 1){
				str= "商品正在竞拍";
			}else{
				str= "商品已经下架";
			}
			$("#body").append("<tr><td style='font-size:2px;'>"+(index+1)+"</td><td style='font-size:5px;'>"+item.typeName+"</td><td>"+item.userName+"</td><td>"+item.comName+"</td><td >"+item.comComment+"</td><td>"+item.comMoney+"</td><td>"+item.comDate+"</td><td>"+item.comTime+"</td><td><img style='width: 30px;height: 30px;' src='../../"+item.comImage+"'/></td><td>"+str+"</td><td>"+item.comAuCommodity+"</td><td><button type='button' onclick=\"deleteById(\'"+item.comId+"\')\" class='btn btn-danger btn-sm' >删除</button>&nbsp;<button type='button'  class='btn  btn-warning btn-sm' onclick=\"updateForm(\'"+item.comId+"\')\">修改</button></td></tr>");
		});
	},"json");
}
function findState(comId){
	var url="../../commodity/findState.action";
	var data={"comId":comId};
	$.post(url,data,function(mes){
		if(mes==1){
			swal("审核通过");
			query();
		}else{
			swal("审核通过失败");
		}
	},"json");
}
/**
 * 显示修改页面
 * @param id
 * @returns
 */
function updateForm(id){
	queryType();
	queryUser();
	$("#divBody").show();
	$("#myFrom").show();
	 var url = "../../commodity/findById.action";
	 var data = {"comId":id}
	 $.post(url,data,function(mes){
		 $("#comIds").val(mes.comId);
		 $("#typeIds").val(mes.typeId);
		 $("#userIds").val(mes.userId);
		$("#comNames").val(mes.comName);
		$("#comComments").val(mes.comComment);
		$("#comMoneys").val(mes.comMoney);
		$("#comDates").val(mes.comDate);
		$("#comTimes").val(mes.comTime);
		$("#comStates").val(mes.comState);
		$("#comMargins").val(mes.comMargin);
	 },"json");
}
/**
 * 查询类型下拉框
 * @returns
 */
function queryType(){
	$("#typeId").html("");
	var url="../../type/queryType.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#typeIds").append("<option value=''>---请选择商品类型---</option>");
		$.each(mes,function(index,item){
			$("#typeIds").append("<option value='"+item.typeId+"'>"+item.typeName+"</option>");
		})
	},"json");
}
/**
 * 查询用户下拉框
 * @returns
 */
function queryUser(){
	$("#userId").html("");
	var url="../../user/queryAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#userIds").append("<option value=''>----请选择用户----</option>");
		$.each(mes,function(index,item){
			$("#userIds").append("<option value='"+item.userId+"'>"+item.userName+"</option>");
		});
	},"json");
}
