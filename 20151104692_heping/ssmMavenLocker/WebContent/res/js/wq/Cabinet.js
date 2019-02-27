var pp=1;
var count=0;
var data1=null;
$(function(){
	$("#a2").hide()
	//查询储物柜表所有
	show(null);
	//分页
	showPage(null);
	//模糊查询储物柜编号
	$("#a11").click(function(){
		$(".p_page").html("");
		var data = {"caId":$("#a12").val()};
		data1=$("#a12").val();
		show(data);
		showPage(data);
		$("#a12").val("");
		//$(".p_page").html("");
	})
	$("#add").click(function(){
		
		$("#a2").show();
	})
	$("#fh").click(function(){
		$("#a2").hide();
		$('#a3')[0].reset();
	})
	
	//查询储物柜表所有
	var url="../../../locker/selectAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#loId").append("<option value="+item.loId+">"+item.loName+"</option>");
		})
	},"json");
	//查询储物柜类型
	var url="../../../cabinet/selectAllType.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#chId").append("<option value="+item.chId+">"+item.chType+"</option>");
		})
	},"json");
	
	//点击提交
	$("#cabinetSubmit").click(function(){
		
			var url="../../../cabinet/addOrUpdate.action";
			var data=$("#a3").serialize(); //将表单序列化
			$.post(url,data,function(mes){
				if (mes.state==1) { 
				    swal("操作成功！", "你的虚拟文件已经被操作。","success");
				
				    $("#a2").hide();
				    $("#tb").html("");
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
//分页方法
function showPage(data){
	var url="../../../cabinet/count.action";
	$.post(url,data,function(mes){
			count = mes.totalPage;
			if(mes.totalPage>0){
				$(".p_page").append("<a class='skin' href='javascript:findPages()'>上一页</a>");
			}
			for(var i=0;i<mes.totalPage;i++){
				$(".p_page").append("<a href='javascript:findPagez("+(i+1)+")' class='skin'>"+(i+1)+"</a>");
			}
			if(mes.totalPage>0){
				$(".p_page").append("<a class='skin' href='javascript:findPagex()'>下一页</a>");
			}
	},"json");
}


function show(data){
	$("#tb").html("");
	var url="../../../cabinet/selectAll.action";
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#tb").append("<tr>" +
							"<td>"+item.caId+"</td>"+
							"<td>"+item.loName+"</td>"+
							"<td>"+item.chType+"</td>"+
							"<td>"+item.caWhether+"</td>"+
							"<td>"+item.caDeadline+"h"+"</td>"+
							"<td>" +
							"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.caId+");'>修改</button>" +
							"<button type='button' class='btn btn-danger' onclick='showDelete("+item.caId+");'>删除</button>" +
							"</td>"+
							"</tr>");
		})
	},"json");
}
function showDelete(id){
	var url="../../../cabinet/deleteByPrimaryKey.action"
	var data={"caId":id}
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

function showUpdate(id){
	
	$("#a2").show();
	
		var url="../../../cabinet/selectAllCNM.action";
		var data={"caId":id}
		$.post(url,data,function(mes){
			
				$("#caId").val(mes.caId);
				$("#loId").val(mes.loId);
				$("#chId").val(mes.chId);
				//$("#caWhether").val(item.caWhether);
				//$("input[@type=radio]").attr("checked",item.caWhether);
				$("input[name='caWhether']").each(function(){
					if($(this).val() == mes.caWhether){
						$(this).prop( "checked", true );
					}
				});
				$("#caDeadline").val(mes.caDeadline);
			
		},"json");
}

/**
 * 页数点击
 */
function findPagez(i){
	pp = i;
	var data={"curPage":i,"caId":data1};
	show(data);
}
/**
 * 上一页
 */
function findPages(){
	if(pp<=1){
		return;
	}
	pp--;
	findPagez(pp);
}
/**
 * 下一页
 */
function findPagex(){
	if(pp>=count){
		return;
	}
	pp++;
	findPagez(pp);
}




