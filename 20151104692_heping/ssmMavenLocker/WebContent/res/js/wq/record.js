//查询出来的行数
var count = 0;
//获取当前页数
var pp = 0;

var data1 = null;
$(function(){
	//隐藏
	$("#a2").hide();
	//查询所有
	findAll();
	//查询记录表所有行数
	findAllCount();
	//根据用户模糊查询
	$("#a11").click(function(){
		$("#tb").html("");
		data1=$("#a12").val();
		findAll({"uZh":$("#a12").val()});
		findAllCount({"uZh":$("#a12").val()});
		//搜索框清空
		$("#a12").val("");
	});
	//点击增加
	$("#add").click(function(){
		$("#a2").show(500)
	});
	//点击返回
	$("#fh").click(function(){
		$("#a2").hide();
		//把表单参数清空
		$('#a3')[0].reset();
	});
	
	//点击提交
	$("#cabinetSubmit").click(function(){
		if($("#reId").val()=="" && $("#uId").val()=="" && $("#caId").val()=="" && $("#reDeposit").val()=="" && $("#reOverdue").val()==""){
			var url="../../../record/addOrUpdate.action";
			var data=$("#a3").serialize(); //将表单序列化
			$.post(url,data,function(mes){
				if (mes.state==1) { 
				    swal("操作成功！", "你的虚拟文件已经被操作。","success");
				
				    $("#a2").hide();
				    $("#tb").html("");
				    //刷新页面
				    findAll();
				  } else { 
				    swal("操作失败！", "你的虚拟文件是安全的:)","error"); 
				    
				    $("#a2").hide();
				    $("#tb").html("");
				    //刷新页面
				    findAll();
				  } 
			},"json");
		}else{
			swal({
			    title: '文本框请输入值',
			    timer: 2000
			})
		}
	});
	
	//用户下拉框
	var url="../../../record/findUser.action";
	$.post(url,null,function(mes){
		$.each(mes,function(i,item){
			$("#uId").append("<option value="+item.uId+">"+item.uZh+"</option>")
		})
	},"json")
	//柜子下拉框
	var url="../../../cabinet/findByGuiZi.action";
	$.post(url,null,function(mes){
		$.each(mes,function(i,item){
			$("#caId").append("<option value="+item.caId+">"+item.caId+"</option>");
		})
	},"json");
});



//查询所有
function findAll(data){
	var url="../../../record/findAll.action";
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			var reout=item.reOut;
			if(item.reOut==null){
				reout="未取出";
			}
			var reCharge=item.reCharge;
			if(item.reCharge==null){
				reCharge="未逾期"
			}
			var reCode=item.reCode;
			if(item.reCode=="1"){
				reCode="已取出"
			}
			
			$("#tb").append("<tr>" +
							"<td>"+item.reId+"</td>" +
							"<td>"+item.uZh+"</td>" +
							"<td>"+item.caId+"</td>" +
							"<td>"+item.reDeposit+"</td>" +
							"<td>"+reout+"</td>" +
							"<td>"+item.reTime+"</td>" +
							"<td>"+item.reMoney+"</td>" +
							"<td>"+item.reOverdue+"</td>" +
							"<td>"+reCharge+"</td>" +
							"<td>"+reCode+"</td>" +
							"<td>"+item.reCodeyin+"</td>" +
							"<td>" +
							"<button type='button' class='btn btn-warning' onclick='showUpdate("+item.reId+");'>修改</button>" +
							"<button type='button' class='btn btn-danger' onclick='showDelete("+item.reId+");'>删除</button> " +
							"</td>"+
							"</tr>");
		});
	},"json");
}

//删除
function showDelete(id){
	var url="../../../record/findIdDelete.action";
	var data={"reId":id};
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
				    findAll();
				  } else { 
				    swal("取消！", "你的虚拟文件是安全的:)","error"); 
				    $("#tb").html("");
				  //刷新页面
				    show();
				  } 
			});
	},"json");
}
//点击修改
function showUpdate(id){
	var reCharge=item.reCharge;
	if(item.reCharge==null){
		reCharge="未逾期"
	}
	$("#a2").show(500);
	var url="../../../record/findById.action";
	var data={"reId":id};
	$.post(url,data,function(mes){
		$("#reId").val(mes.reId);
		$("#uId").val(mes.uId);
		$("#caId").val(mes.caId);
		$("#reDeposit").val(mes.reDeposit);
		$("#reOut").val(mes.reOut);
		$("#reTime").val(mes.reTime);
		$("#reMoney").val(mes.reMoney);
		$("#reOverdue").val(mes.reOverdue);
		$("#reCharge").val(reCharge);
		$("#reCode").val(mes.reCode);
		$("#reCodeyin").val(mes.reCodeyin);
	},"json");
}

//查询表所有行数
function findAllCount(data){
	$(".p_page").html("");
	var url="../../../record/findAllCount.action";
	$.post(url,data,function(mes){
		count = mes.totalPage;
		if(mes.totalPage>1){
			$(".p_page").append("<a class='skin' href='javascript:findShang()'>上一页</a>");
		}
		for(var i=0;i<mes.totalPage;i++){
			$(".p_page").append("<a href='javascript:findZhong("+(i+1)+")' class='skin'>"+(i+1)+"</a>");
		}
		if(mes.totalPage>1){
			$(".p_page").append("<a class='skin' href='javascript:findXia()'>下一页</a>");
		}
	},"json");
}

//点击页数
function findZhong(i){
	pp = i;
	$("#tb").html("");
	findAll({"curPage":i,"uZh":data1});
}

//点击上一页
function findShang(){
	if(pp<=1){
		return;
	}
	pp--;
	findZhong(pp);
}

//点击下一页
function findXia(){
	if(pp>=count){
		return;
	}
	pp++;
	findZhong(pp);
}


