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
	$("#fromSubmit").click(function(){
		var url="../../auindent/addOrUpdate.action";
		var date=$("#myFrom").serialize();
		$.post(url,date,function(mes){
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
	
	$("#exit").click(function(){
		qk();
		$("#divBody").hide();
		$("#myFrom").hide();
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
//查询所有
function query(){
	$("#body").html("");
	var url="../../auindent/query.action";
	var data={"comName":$("#comName").val(),
			  "inDate":$("#inDate").val(),
			  "inTime":$("#inTime").val(),
			  "curPage":curPage};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			var state;
			if(item.inState==0){
				state="<span style='font-size:12px;color:gray;'>等待买家确认购买</span>";
			}else if(item.inState==1){
				state="<input type='button' onclick='findState(\""+item.inId+"\")' value='发货' class='btn btn-info btn-sm'>";
			}else if(item.inState==2){
				state="<span style='font-size:12px;color:gray;'>已发货等待买家收货</span>";
			}else if(item.inState==9){
				state="<span style='font-size:12px;color:gray;'>该商品出售完成</span>";
			}else if(item.inState==10){
				state="<span style='font-size:12px;color:gray;'>该订单已经失效了</span>";
			}
			$("#body").append("<tr><td>"+item.inId+"</td><td>"+item.comName+"</td><td>"+item.userName+"</td><td>"+item.inDate+"</td><td>"+item.inMoney+"</td><td>"+state+"</td><td><input type='button' onclick='inUpdate(\""+item.inId+"\")'  value='修改' class='btn  btn-warning btn-sm' id='insertBtn'>&nbsp;<input type='button' onclick='inDelete(\""+item.inId+"\")'  value='删除' class='btn btn-danger btn-sm' id='insertBtn'></td></tr>");
		});
	},"json");
}
function findState(inId){
	var url="../../auindent/findState.action";
	var data={"inId":inId};
	$.post(url,data,function(mes){
		if(mes==1){
			swal("发货成功");
			query();
		}else{
			swal("发货失败");
		}
	},"json");
}
/**
 * 查询行数
 * @returns
 */
function inCount(){
	$(".pagination").html("");
	var url="../../auindent/inCount.action";
	var data={"comName":$("#comName").val(),
			  "inDate":$("#inDate").val(),
			  "inTime":$("#inTime").val(),
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
function inUpdate(id){
	var url="../../auindent/findById.action";
	var data={"inId":id};
	$.post(url,data,function(mes){
		$("#inId").val(mes.inId);
		$("#comSelect").val(mes.comId);
		$("#userSelect").val(mes.userId);
		$("#inDate").val(mes.inDate);
		$("#inMoney").val(mes.inMoney);
		$("#stateSelect").val(mes.inState);
		
		$("#divBody").show();
		$("#myFrom").show();
	},"json");
}
function qk(){
	$("#inId").val("");
	$("#comSelect").val("");
	$("#userSelect").val("");
	$("#inDate").val("");
	$("#inMoney").val("");
	$("#stateSelect").val("");
}
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
				var url="../../auindent/inDelete.action";
				var data={"inId":id};
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
