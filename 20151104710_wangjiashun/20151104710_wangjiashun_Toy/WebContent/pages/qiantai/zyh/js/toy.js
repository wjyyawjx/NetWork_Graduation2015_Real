$(function(){
	var id = window.location.href.split("?")[1].split("=")[1];
	$("#toyId").val(id);
	
	show(id);
	
	comments(id);
	findRow(id);
	
	$("#close").click(function(){
		$("#quiz").hide();
	})
})


function showImg(id){
	var date ={"id":id};
	var url = "../../../toy/findById.action"; 
	$.post(url,date,function(mes){
		$("#iiimag").append("<li><a href='' target='_blank'><img src='../../../"+mes.photoPath+"'  class='B_blue' /></a></li>");
		$("#toyImg").append("<img src='../../../"+mes.photoPath+"' alt='' />&nbsp;");
	},"json")
}


function show(id){
	var url = "../../../toy/findById.action"; 
	var date ={"id":id};
	$.post(url,date,function(mes){
		$("#toyName").html(mes.toyName);
		$("#toyAge").append(mes.toyAge+"岁");
		$("#toyMoney").html("￥"+mes.toyMoney+"元");
		$("#toyDeposit").html("￥"+mes.toyDeposit+"元(非会员)");
		$("#toyName").html(mes.toyName);
		$("#jqzoom").append("<a href='../../../"+mes.photoPath+"' id='zoom1' class='MagicZoom MagicThumb' title='"+mes.toyName+"'><img  width=358 height=358 src='../../../"+mes.photoPath+"' alt='"+mes.toyName+"'/></a>");
	},"json")
}

function getSeesion(){
	var url = "../../../comment/getSession.action"; 
	var date =null;
	$.post(url,date,function(mes){
		if(mes.userId==null){
			alert("请登录");
			location.href="../../user/login.html";
		}else{
			alert(mes.userId);
			$("#userId").val(mes.userId);
			$("#quiz").show();
		}
	},"json")
	
}

function comments(id){
	$("#comments1").html("");
	var url = "../../../comment/findByToyId.action"; 
	var date ={"id":id};
	$.post(url,date,function(mes){
		$.each(mes,function(index,item){
			$("#comments1").append("<li>"+item.userName+":"+item.commentContent+"</li>");
		});
		
	},"json")
}

function findRow(id){
	var url = "../../../comment/findCommentRow.action"; 
	var date ={"id":id};
	$.post(url,date,function(mes){
			$("#font1xcc").html("全部评论"+mes.state+"");
		
	},"json")
}

function summbit(){
	
	
	$.ajax({
		type:"post",
		url:"../../../comment/addOrUpdate.action",
		async:false,
		cache:false,
		data:new FormData($("#myFrom")[0]),
		contentType:false,//由于提交的对象是FormData,所以要在这里更改上传参数的类型
		processData:false,//提交对象是FormData,不需要对数据做任何处理
		success:function(mes){
			if(mes.state==1){
				swal({
					title : mes.msg,
					type : 'success',
					allowOutsideClick : false
				}).then(function() {
					parent.layer.close(index);
				})
				$("#quiz").hide();
				location.reload();
			}else{
				swal({
					title : '操作失败',
					type : 'error',

					allowOutsideClick : false
				}).then(function() {
					parent.layer.close(index);
				})
				$("#quiz").hide();
				location.reload();
			}
		},complete:function(){

		}
	});
	
}

