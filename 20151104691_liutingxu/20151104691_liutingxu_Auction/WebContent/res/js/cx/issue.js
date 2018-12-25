$(function(){
	
	$("#btns").click(function(){
		findName();
		findTypes();
		findDate();
		findTime();
		findStart();
		findMoney();
		findCommod();
		findComment();
		findFile();
		
		var i;
		$.each($(".dui"),function(index,item){
			i=index;
		});
		console.info(i);
		if(i==8){
			var formData =new FormData();
			formData.append("comName",$("#comName").val());
			formData.append("typeId",$("#auType").val());
			formData.append("comDate",$("#comDate").val());
			formData.append("comTime",$("#comTime").val());
			formData.append("comStarting",$("#comStarting").val());
			formData.append("comMoney",$("#comMoney").val());
			formData.append("comAuCommodity",$("#comAuCommodity").val());
			formData.append("comComment",$("#comComment").val());
			formData.append("comAuCommodity",$("#comAuCommodity").val());
			$.each($(".imgContainer").children("img"),function(index,item){
				formData.append("phpImage",item.alt);
			});
			
			$.ajax({
				type:"post",
				url:"../../../commodity/addCom.action",
				async:false,
				cache:false,
				data:formData,
				contentType:false,//由于提交的对象是FormData,所以要在这里更改上传参数的类型
				processData:false,//提交对象是FormData,不需要对数据做任何处理
				success:function(mes){
					if(mes==1){
						swal("发布成功", "请点击确认", "success");
						qk();
					}else{
						sweetAlert("发布失败", "请重试", "error");
					}
				},complete:function(){
	 
				}
			});
		}
		
	});
		//$("#issFrom").submit();

	$("#detailButton").click(function(){
		$("#addImageDiv").hide();
	});
	
	
	findType();
});
function findName(){
	if($("#comName").val()==""){
		$("#comNameTd").html("<span style='color:red;'>商品名称不能为空</span>");
	}else if($("#comName").val().length>50){
		$("#comNameTd").html("<span style='color:red;'>商品名称不能超过50个字</span>");
	}else{
		$("#comNameTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}

function findTypes(){
	if($("#auType").val()==""){
		$("#auTypeTd").html("<span style='color:red;'>请选择商品类型</span>");
	}else{
		$("#auTypeTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findDate(){
	if($("#comDate").val()==""){
		$("#dateTd").html("<span style='color:red;'>开始时间不能为空</span>");
	}else{
		$("#dateTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findTime(){
	if($("#comTime").val()==""){
		$("#timeTd").html("<span style='color:red;'>截止时间不能为空</span>");
	}else{
		$("#timeTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findStart(){
	if($("#comStarting").val()==""){
		$("#startTd").html("<span style='color:red;'>起拍价不能为空</span>");
	}else if(isNaN($("#comStarting").val())){
		$("#startTd").html("<span style='color:red;'>起拍价不符合规范请重新输入</span>");
	}else{
		$("#startTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findMoney(){
	if($("#comMoney").val()==""){
		$("#moneyTd").html("<span style='color:red;'>一口价不能为空</span>");
	}else if(isNaN($("#comMoney").val())){
		$("#moneyTd").html("<span style='color:red;'>一口价不符合规范请重新输入</span>");
	}else{
		$("#moneyTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findCommod(){
	if($("#comAuCommodity").val()==""){
		$("#commodityTd").html("<span style='color:red;'>保证金不能为空</span>");
	}else if(isNaN($("#comAuCommodity").val())){
		$("#commodityTd").html("<span style='color:red;'>保证金不符合规范请重新输入</span>");
	}else{
		$("#commodityTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findComment(){
	if($("#comComment").val()==""){
		$("#commentTd").html("<span style='color:red;'>商品备注不能为空</span>");
	}else if($("#comComment").val().length>100){
		$("#commentTd").html("<span style='color:red;'>商品备注不能超过100个字</span>");
	}else{
		$("#commentTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function findFile(){
	if($("#file").val()==""){
		$("#fileTd").html("<span style='color:red;'>商品图片不能为空</span>");
	}else{
		$("#fileTd").html("<span style='color:green;' class='dui'>√</span>");
	}
}
function qk(){
	$("#comName").val("");
	$("#auType").val("");
	$("#comDate").val("");
	$("#comTime").val("");
	$("#comStarting").val("");
	$("#comMoney").val("");
	$("#comAuCommodity").val("");
	$("#comComment").val("");
	$("#comAuCommodity").val("");
	$("#phpImage").val("");
}
function findType(){
	$("#auType").html("");
	var url="../../../type/findAll.action";
	var data=null;
	$.post(url,data,function(mes){
		$("#auType").append("<option value=''>======请选择======</option>");
		$.each(mes,function(index,item){
			$("#auType").append("<option value="+item.typeId+">"+item.typeName+"</option>");
		});
	},"json");
}

function findImage(){
	$("#addImageDiv").show();
}