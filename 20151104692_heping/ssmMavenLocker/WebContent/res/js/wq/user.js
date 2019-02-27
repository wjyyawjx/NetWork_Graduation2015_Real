//查询出来的行数
var count = 1;

var pp = 1;

//把搜索框的值提出来
var data1 = null;
$(function(){
	$("#a2").hide()
	//查询所有
	backFindAll(null);
	//查询行数
	backFindCount(null);
	$("#a11").click(function(){
		data1 = $("#a12").val();
		$("#tb").html("");
		$(".p_page").html("");
		backFindAll({"uZh":$("#a12").val()});
		backFindCount({"uZh":$("#a12").val()})
	});
	
	//点击增加
	$("#add").click(function(){
		$("#a2").show();
	})
	//点击返回
	$("#fh").click(function(){
		$("#a2").hide();
		//把表单参数清空
		$('#a3')[0].reset();
	})
	//点击提交按钮
	$("#cabinetSubmit").click(function(){
		var url="../../../user/addOrUpdate.action";
		var data=$("#a3").serialize(); //将表单序列化
		$.post(url,data,function(mes){
			if (mes.state==1) { 
			    swal("操作成功！", "你的虚拟文件已经被操作。","success");
			
			    $("#a2").hide();
			    $("#tb").html("");
			    //刷新页面
			    backFindAll(null);
			  } else { 
			    swal("操作失败！", "你的虚拟文件是安全的:)","error"); 
			    
			    $("#a2").hide();
			    $("#tb").html("");
			    //刷新页面
			    backFindAll(null);
			  } 
		},"json");
	});
});
/**
 * 查询所有
 * @param data
 * @returns
 */
var user;
function backFindAll(data){
	var url="../../../user/backFindAll.action";
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			if(item.uType=="1"){
				user="普通用户";
			}else if(item.uType=="2"){
				user="会员用户";
			}else{
				user="管理员";
			}
			$("#tb").append("<tr>" +
							"<td>"+item.uId+"</td>" +
							"<td>"+item.uZh+"</td>" +
							"<td>"+item.uMm+"</td>" +
							"<td>"+user+"</td>" +
							"<td>"+item.uPhone+"</td>" +
							"<td>"+item.uSite+"</td>" +
							"<td>" +
							"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.uId+");'>修改</button>" +
							"<button type='button' class='btn btn-danger' onclick='showDelete("+item.uId+");'>删除</button>" +
							"</td>" +
							"</tr>");
		})
	},"json");
}
/**
 * 查询行数
 * @param data
 * @returns
 */
function backFindCount(data){
	var url="../../../user/backFindCount.action";
	$.post(url,data,function(mes){
		count = mes.totalPage;
		if(count>1){
			$(".p_page").append("<a class='skin' href='javascript:findShang()'>上一页</a>");
		}
		for(var i=0;i<count;i++){
			$(".p_page").append("<a href='javascript:findZhong("+(i+1)+")' class='skin'>"+(i+1)+"</a>");
		}
		if(count>1){
			$(".p_page").append("<a class='skin' href='javascript:findXia()'>下一页</a>");
		}
	},"json");
}

/**
 * 删除
 * @param id
 * @returns
 */
function showDelete(id){
	var url="../../../user/showDelete.action";
	var data={"uId":id};
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
				    backFindAll();
				  } else { 
				    swal("取消！", "你的虚拟文件是安全的:)","error"); 
				    $("#tb").html("");
				  //刷新页面
				    backFindAll();
				  } 
			});
	},"json")
}

/**
 * 修改
 * @param id
 * @returns
 */
function showUpdate(id){
	$("#a2").show();
	var url="../../../user/showUpdate.action";
	var data={"uId":id};
	$.post(url,data,function(mes){
		$("#uId").val(mes.uId);
		$("#uZh").val(mes.uZh);
		$("#uMm").val(mes.uMm);
		$("#uType").val(mes.uType);
		$("#uPhone").val(mes.uPhone);
		$("#uSite").val(mes.uSite);
	},"json");
}


/**
 * 点击页面
 * @param i
 * @returns
 */
function findZhong(i){
	//点击页数的按钮先把数据清空
	$("#tb").html("");
	pp = i;
	backFindAll({"curPage":i,"uZh":data1});
}
/**
 * 点击上一页
 * @returns
 */
function findShang(){
	if(pp<=1){
		return;
	}
	pp--;
	findZhong(pp);
}
/**
 * 点击下一页
 * @returns
 */
function findXia(){
	if(pp>=count){
		return;
	}
	pp++;
	findZhong(pp)
}



