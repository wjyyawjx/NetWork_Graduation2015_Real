$(function(){
	$("#body-header").load("head.html");
	$("#body-footer").load("../cst/footer.html");
	$(".tbody1_left_div").hover(function(){
		$("#big").show();
	},function(){
		$("#big").hide();
	});
	$("#big").hover(function(){
		$("#big").show();
	},function(){
		$("#big").hide();
	});
	queryType();
	queryCom();
	
	findNotice();
})
function findNotice(){
	$("#tbody-ul").html("");
	var url="../../../AuNotice/findNotice.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			if(index%2==0){
				$("#tbody-ul").append("<li style='font-size:13px;' >&nbsp;&nbsp;&nbsp;<span><a style='text-decoration:none ;font-weight:blod;color:#a20000;' href=javascript:showView(\'"+item.no_id+"\',\'"+item.no_title+"\',\'"+item.no_content+"\')>"+item.no_title+"</a></span></li>");
			}else{
				$("#tbody-ul").append("<li style='font-size:13px;background:#f0f0f0;'>&nbsp;&nbsp;&nbsp;<span ><a style='text-decoration:none ;font-weight:blod;color:#a20000;' href=javascript:showView(\'"+item.no_id+"\',\'"+item.no_title+"\',\'"+item.no_content+"\')>"+item.no_title+"</a></span></li>");
			}
			
		});
	},"json");
}
/**
 * 查询所有商品
 * @returns
 */
function queryCom(){
	var url="../../../commodity/queryCom.action";
	var data=null;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$(".tbodys_small").append("<a href='../../../page/backstage/cst/detail.html?comId="+item.comId+"'><div><img width='100%' height='170px' src='../../../"+item.comImage+"'/><p class='name'><a href='#'>"+item.comName+"</a></p><p class='price'>￥<span>"+item.comMoney+"</span></p></div></a>");
		});
	},"json");
}
/**
 * 首页的查询类型
 * @returns
 */
function queryType(){
	var url="../../../type/queryType.action";
	var data=data;
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#tbody1_left").append("<div id='tbody1_left_div1' class='tbody1_left_div'><img style='margin-top:15px;' src='../../../"+item.typeImage+"'/><p><a href=''>"+item.typeName+"</a></p><a id='aaa' href=''>手机</a>&nbsp;&nbsp;<a href=''>相机</a>&nbsp;&nbsp;&nbsp;<a href=''>笔记本</a></div>");
		});
	},"json");
}

/**
 * 显示通知
 * @param id
 * @param title
 * @param context
 * @returns
 */
function showView(id,title,context){
	 
	$("#notis").css("display","block");
	$("#context_not").html("<p style='text-align:center'><b>"+title+"</b></p><hr><p>"+context+"</p>");
}


function closeNo(){
	$("#notis").css("display","none");
}