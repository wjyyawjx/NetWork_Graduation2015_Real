var curPage=1;
var type;
$(function(){
	finAll();
	findCount();
	$("#query").click(function() {
        type = $("#queryForm").serialize(); //将表单序列化
        finAll(type);
    });
	
})



function formHidden(){
	$("#formMain").hide(1000);
}

function showForm() {
    $("#formMain").show(1000);
}

/**
 * 关闭增加
 * @returns
 */
function hideFrom() {
    $("#formMain").hide();
    $('.form-horizontal')[0].reset();
}

/**·
 * 查询显示所有
 * @returns
 */
function finAll(type){
	$("#body").html("");
	var url="../../AuNotice/findAll.action";
	var data={"curPage":curPage,"type":type};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#body").append("<tr><td>"+item.noId+"</td><td>"+item.noTitle+"</td><td> "+item.noContent+"</td><td><button type='button' class='btn btn-primary' text-style='margin-left:10px'  onclick=\"deleteById(\'"+item.noId+"\')\">删除</button>	          <button type='button' class='btn btn-warning'  onclick=\"showForm(\'"+item.noId+"\')\">修改</button></td></tr>");
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
			  var url="../../AuNotice/delete.action";
			  var data={"noId":id};
				$.post(url,data,function(mes){
					if(mes.state == 1){
						swal("删除成功！", "操作成功","success")
						finAll();
					}else{
						swal("删除失败！", "操作失败","error")
						finAll();
					}
				},"json");
		  } else { 
		    swal("取消！", "你的虚拟文件是安全的:)","error"); 
		  } 
		});
} 

/**
 * 显示修改的方法
 */
function showForm(id){
	$(".pagination").html("");
	$("#formMain").show(1000);
	$("#flNames").html("");
	var url="../../AuNotice/findById.action";
	var data={"noId":id};
	$.post(url,data,function(mes){
		$("#flId").val(mes.noId);
		$("#noTitle").val(mes.noTitle) 
		$("#noContent").val(mes.noContent);
	},"json");
}


/**
 * 增加或者修改
 * @returns
 */
function addOrUpdate(){
	var url="../../AuNotice/addOrUpdate.action"
	var data=$("#flowerForm").serialize();
	$.post(url,data,function(mes){
		if(mes.state == 1){
			swal("操作成功！", "操作成功","success")
			finAll();
			$("#formMain").hide(1000);
		}else{
			swal("操作失败！", "操作失败","error")
			finAll();
			$("#formMain").hide(1000);
		}
	},"json")
}


/**
 * 查询总行数
 */                                                                
var maxPage =0;
function findCount(){
	$(".pagination").html("");
	var url="../../AuNotice/findCount.action";
	var data={"curPage":curPage};
	$.post(url,data,function(mes){
		maxPage=mes.totalPages
		if(maxPage>0){
			$(".pagination").append("<li id='up'><a href='javascript:up();'>&laquo;</a></li>");
		}
		for(var i=0;i<maxPage;i++){
			if(i==0){
				$(".pagination").append("<li id='li"+(i+1)+"' class='active'><a href='#' onclick='page("+(i+1)+");'>"+(i+1)+"</a></li>");
			}else{
				$(".pagination").append("<li id='li"+(i+1)+"'><a href='#' onclick='page("+(i+1)+");'>"+(i+1)+"</a></li>");
			}
		}
		if(maxPage>0){
			$(".pagination").append("<li id='down'><a href='javascript:down();'>&raquo;</a></li>");
		}
	},"json");
}

function page(val){
	curPage=val;
	finAll();
	$(".pagination li").removeClass();
	$("#li"+val).addClass("active");
}

/**
 * 上一页
 */
function up(){
	if(curPage>1){
		curPage--;
		$(".pagination li").removeClass();
		$("#li"+curPage).addClass("active");
		
		finAll();
	}
}
/**
 * 下一页
 */
function down(){
	if(curPage<maxPage){
		curPage++;
		$(".pagination li").removeClass();
		$("#li"+curPage).addClass("active");
		finAll();
	}
}




