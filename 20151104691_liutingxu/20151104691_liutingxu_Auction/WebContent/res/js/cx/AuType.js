var curPage=1;
var type;
$(function(){
	query(null);
	findCount();
	$("#query").click(function() {
		type = $("#queryForm").serialize(); //将表单序列化
        query(type);
    });
	$("#submitf").click(function(){
		$("#myFrom").submit();
	})
	$("#insertBtn").click(function(){
		$("#divBody").show();
		$("#myFrom").show();
	});
	$("#divBody").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
	});
	$("#exit").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
	});
})
/**
 * 关闭增加
 * @returns
 */
function hideFrom() {
    $('.form-horizontal')[0].reset();
}
/**
 * 显示修改页面
 * @param id
 * @returns
 */
function updateForm(id){
	$("#divBody").show();
	$("#myFrom").show();
	var url="../../type/findById.action";
	var data={"typeId":id};
	$.post(url,data,function(mes){
		$("#typeIds").val(mes.typeId);
		$("#typeNamea").val(mes.typeName);
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
			  var url="../../type/delete.action";
				var data={"typeId":id};
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
}
/**
 * 查询所有商品类型
 * @returns
 */
function query(){
	$("#body").html("");
	var url="../../type/queryAll.action";
	var data={"curPage":curPage,"type":type};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#body").append("<tr><td>"+item.typeId+"</td><td>"+item.typeName+"</td><td><img style='width: 50px;height: 20px;' src='../../"+item.typeImage+"'/></td><td><button type='button' class='btn btn-danger btn-sm' onclick=\"deleteById(\'"+item.typeId+"\')\" >删除</button>&nbsp;&nbsp;&nbsp;<button type='button' class='btn  btn-warning btn-sm' onclick=\"updateForm(\'"+item.typeId+"\')\">修改</button></td></tr>");
		});
	},"json");
}
/**
 * 查询行数
 * @returns
 */
var maxPage;
function findCount(){
	$(".pagination").html("");
	var url="../../type/findCount.action";
	var data={"curPage":curPage};
	$.post(url,data,function(mes){
		maxPage=mes.totalPages;
		if(maxPage>0){
			$(".pagination").append("<li id='up'><a href='javascript:up();'>&laquo;</a></li>");
		}
		for (var i = 0; i < maxPage; i++) {
			if(i==0){
				$(".pagination").append("<li id='li"+(i+1)+"' class='active'><a href='#' onclick='page("+(i+1)+");'>"+(i+1)+"</a></li>");
			}else{
				$(".pagination").append("<li id='li"+(i+1)+"'><a href='#' onclick='page("+(i+1)+");'>"+(i+1)+"</a></li>");
			}
		}
		if(maxPage>0){
			$(".pagination").append("<li id='down'><a href='javascript:down();' >&raquo;</a></li>");
		}
	},"json");
}
/**
 * 
 * @param val
 * @returns
 */
function page(val){
	curPage=val;
	query(null);
	$(".pagination li").removeClass();
	$("#li"+val).addClass("active");
}
/**
 * 上一页
 * @returns
 */
function up(){
	if(curPage>1){
		curPage--;
		$(".pagination li").removeClass();
		$("#li"+curPage).addClass("active");
		query(null);
	}else{
		swal("已经到第一页了")
	}
}
/**
 * 下一页
 * @returns
 */
function down(){
	if(curPage<maxPage){
		curPage++;
		$(".pagination li").removeClass();
		$("#li"+curPage).addClass("active");
		query(null);
	}else{
		swal("已经到最后一页了")
	}
	
}