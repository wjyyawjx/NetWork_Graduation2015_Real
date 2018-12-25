var curPage=1;
var maxPage=1;
$(function(){
	query();
	inCount();
	
	findCom();
	findUser();
	$("#insertBtn").click(function(){
		$("#divBody").show();
		$("#myFrom").show();
	});
	
	$("#divBody").click(function(){
		$("#divBody").hide();
		$("#myFrom").hide();
	});
	
	$("#exit").click(function(){
		qk();
		$("#divBody").hide();
		$("#myFrom").hide();
	});
	
	$("#fromSubmit").click(function(){
		var url="../../record/addOrUpdate.action";
		var data=$("#myFrom").serialize();
		$.post(url,data,function(mes){
			if(mes==1){
				swal("操作成功", "请点击确认按钮", "success");
				curPage=1;
				query();
				inCount();
				$("#divBody").hide();
				$("#myFrom").hide();
				qk();
			}else{
				swal("操作失败", "请重新操作", "error");
			}
		},"json");
	});
});
function findUser(){
	$("#userSelect").html("");
	var url="../../user/findAlls.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#userSelect").append("<option value=''>========请选择========</option>");
		$.each(mes,function(index,item){
			$("#userSelect").append("<option value="+item.userId+">"+item.userName+"</option>");
		});
	},"json");
}
function findCom(){
	$("#comSelect").html("");
	var url="../../commodity/findAlls.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#comSelect").append("<option value=''>========请选择========</option>");
		$.each(mes,function(index,item){
			$("#comSelect").append("<option value="+item.comId+">"+item.comName+"</option>");
		});
	},"json");
}

function queryStu(){
	query();
	inCount();
	
}
function query(){
	$("#body").html("");
	var url="../../record/query.action";
	var data={"comName":$("#comName").val(),
			  "userName":$("#userName").val(),
			  "reDate":$("#reDate").val(),
			  "reTime":$("#reTime").val(),
			  "curPage":curPage};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var state;
			if(item.reState==1){
				state="<span style='font-size:12px;color:gray;'>该商品正在竞拍中</span>";
			}else{
				state="<span style='font-size:12px;color:gray;'>该商品竞拍已结束</span>";
			}
			$("#body").append("<tr><td>"+item.reId+"</td><td>"+item.comName+"</td><td>"+item.userName+"</td><td>"+item.reDate+"</td><td>"+item.reState+"</td><td>"+item.reMoney+"</td><td>"+state+"</td><td><input type='button' onclick='inUpdate(\""+item.reId+"\")'  value='修改' class='btn  btn-warning btn-sm' id='insertBtn'>&nbsp;<input type='button' onclick='inDelete(\""+item.reId+"\")'  value='删除' class='btn btn-danger btn-sm' id='insertBtn'></td></tr>");
		});
	},"json");
}
/**
 * 查询行数
 * @returns
 */
function inCount(){
	$(".pagination").html("");
	var url="../../record/reCount.action";
	var data={"comName":$("#comName").val(),
			  "userName":$("#userName").val(),
			  "reDate":$("#reDate").val(),
			  "reTime":$("#reTime").val(),
			  "curPage":curPage};
	$.post(url,data,function(mes){
		maxPage=mes;
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
function page(val){
	curPage=val;
	query();
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
		query();
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
		query();
	}else{
		swal("已经到最后一页了")
	}
	
}
/**
 * 修改
 * @returns
 */
function inUpdate(id){
	var url="../../record/reUpdate.action";
	var data={"reId":id};
	$.post(url,data,function(mes){
		$("#reId").val(mes.reId);
		$("#comSelect").val(mes.comId);
		$("#userSelect").val(mes.userId);
		$("#reState").val(mes.reState);
		$("#recordDate").val(mes.reDate);
		$("#inMoney").val(mes.reMoney);
		$("#divBody").show();
		$("#myFrom").show();
	},"json");
}
/**
 * 删除
 * @param id
 * @returns
 */
function inDelete(id){
	swal({
		  title: "是否确认删除?",
		  text: "请选择yes或者cancel",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "yes",
		  closeOnConfirm: false
		},
		
		function(){
				var url="../../record/reDelete.action";
				var data={"reId":id};
				$.post(url,data,function(mes){
					if(mes==1){
						swal("删除成功", "请点击确认按钮", "success");
						query();
						inCount();
					}else{
						sweetAlert("删除失败", "请点击确认按钮", "error");
					}
				},"json");
		});
}
function qk(){
	$("#reId").val("");
	$("#comSelect").val("");
	$("#userSelect").val("");
	$("#reState").val("");
	$("#recordDate").val("");
	$("#inMoney").val("");
}