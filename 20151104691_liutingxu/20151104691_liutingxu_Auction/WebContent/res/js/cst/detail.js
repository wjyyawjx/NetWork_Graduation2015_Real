var comId;
var userId;
var a=0;
$(function(){
	$("#body-header").load("../../../page/backstage/cx/head.html");
	$("#body-footer").load("footer.html");
	
	comId=getParameter("comId");
	
	findById();
	//查询出价记录行数
	findRecordCount();
	//查询出价记录
	findRecord();
	//查询出价记录排行
	RecordOrder();
	$("#zjAuction").click(function(){
		
		
		var url="../../../user/getSession.action";
		var data=null;
		$.post(url,data,function(mes){
			if(mes.userId!=null && mes.userId!=""){
				$.ajaxSetup({
					async: false
				});
				userId=mes.userId;
				selectMrecord2(userId);
				$.ajaxSetup({
					async: true
				});
				$("#backBody").show();
				$("#addAuction").show();
				
				
				if(a==1){
					$("#fourMoney").html($("#addAuctionMoney").val());
					$("#sfmoney").html("您的加价:");
				}else{
					$("#fourMoney").html(parseInt($("#addAuctionMoney").val())+parseInt($("#bzMoney").html())+".00");
				}
			}else{
				sweetAlert("抱歉", "您还没有登录请前往登录", "error");
				setTimeout(function(){
					location.href="../../../page/backstage/cx/login.html";
				},2000);
			}
		},"json");
	});
	$("#backBody").click(function(){
		$("#backBody").hide();
		$("#addAuction").hide();
	});
	
	$("#addAuctionMoney").keyup(function(){
		if(isNaN($("#addAuctionMoney").val())){
			$("#addAuctionMoney").val("0");
		}else if($("#addAuctionMoney").val()==""){
			$("#addAuctionMoney").val("0");
		}
		if(a==1){
			$("#fourMoney").html($("#addAuctionMoney").val()+".00");
		}else{
			$("#fourMoney").html(parseInt($("#addAuctionMoney").val())+parseInt($("#bzMoney").html())+".00");
		}
		
	});
	
	$("#auctionInput").click(function(){
		if(a==1){
			$("#sfmoney").html("您的加价:");
			selectMrecord(userId);
		}else if($("#addAuctionMoney").val()<parseInt($("#oneBzMoney").html())){
			swal("您的价格低于起拍价不能参与竞拍")
		}else{
			selectMrecord(userId);
		}
		
	});
});
function findDate(){
	var url="../../../commodity/findDate.action";
	var data={"dates":dates,"time":times,"comId":comId};
	$.post(url,data,function(mes){
		if(mes==1){
			sweetAlert("该商品已过期", "将自动跳转到首页", "error");
			setTimeout(function(){
				location.href="../../../page/backstage/cx/index.html";
			},2000);
		}else if(mes==0){
			sweetAlert("竞拍结束，将会对商品下架", "将自动跳转到首页", "error");
			setTimeout(function(){
				location.href="../../../page/backstage/cx/index.html";
			},2000);
		}else if(mes==2){
			console.info("该竞拍还没有开始");
			$("#zjAuction").attr({"disabled":"true"});
			$("#zjAuction").css({"background":"#f0f0f0"});
			console.info(mes);
			setTimeout(function(){
				findDate();
			},1000);
		}else if(mes==3){
			location.reload();
		}else if(mes==5){
			swal("该商品没有人参加竞拍已下架");
		}else{
			//$("#zjAuction").attr({"disabled":false});
			//$("#zjAuction").css({"background":"#1091de"});
			//setDateSelectedFn();
			
			console.info("竞拍进行中");
			console.info(mes);
			setTimeout(function(){
				findDate();
			},1000);
		}
	},"json");
	
}
//查询是否登录
var userId;
function findUser(){
	var url="../../../user/selectSession.action";
	var data=null;
	$.post(url,data,function(mes){
		userId=mes;
		
	},"json");	
}
//增加出价记录表
function addRecord(userId){
	var url="../../../record/addRecord.action";
	var data={"comId":comId,"userId":userId,"money":$("#addAuctionMoney").val()};
	$.post(url,data,function(mes){
		if(mes==1){
			console.info("增加出价记录成功");
			swal("参加竞拍成功", "请点击确认按钮", "success")
		}else{
			sweetAlert("参加竞拍失败", "请稍后重试", "error");
		}
	},"json");
}
//增加保证金记录表
function AddMrecord(userId){
	var url="../../../mreload/addMrecord.action";
	var data={"comId":comId,"userId":userId,"money":parseInt($("#bzMoney").html())};
	$.post(url,data,function(mes){
		if(mes==1){
			console.info("增加保证金记录成功");
		}
	},"json");
}
/**
 * 查询该用户是否缴纳保证金
 * @returns
 */
function selectMrecord(userId){
	RecordOrder();
	var urls="../../../wallet/findWallet.action";
	var datas={"userId":userId};
	$.post(urls,datas,function(info){
		console.info(info.waBalance);
		var url="../../../mreload/selectMrecord.action";
		var data={"comId":comId,"userId":userId};
		$.post(url,data,function(mes){
			if(mes!="" && mes!=null){
				console.info("该用户已经缴纳了保证金");
				console.info("****"+dqMpney);
				if((dqMpney+parseInt($("#addAuctionMoney").val()))<=maxMoney){
					swal("抱歉您的出价太低，请重新进行出价");
				}else if(parseInt(info.waBalance)>parseInt($("#addAuctionMoney").val())){
					addRecord(userId);
					$("#backBody").hide();
					$("#addAuction").hide();
					$("#addAuctionMoney").val("0");
				}else{
					swal("您的账户余额不足，请充值后重新进行竞拍");
				}
			}else{
				console.info("该用户没有缴纳了保证金");
				console.info(parseInt($("#addAuctionMoney").val())+parseInt($("#bzMoney").html()));
				if(parseInt($("#addAuctionMoney").val())<=maxMoney){
					swal("抱歉您的出价太低，请重新进行出价");
				}else if(parseInt(info.waBalance)>(parseInt($("#addAuctionMoney").val())+parseInt($("#bzMoney").html()))){
					AddMrecord(userId);
					addRecord(userId);
					$("#backBody").hide();
					$("#addAuction").hide();
					$("#addAuctionMoney").val("0");
				}else{
					swal("您的账户余额不足，请充值后重新进行竞拍");
				}
			}
		},"json");
	
	},"json");
	
	
}
/**
 * 查询是否缴纳保证金
 * @param userId
 * @returns
 */
function selectMrecord2(userId){
	var url="../../../mreload/selectMrecord.action";
	var data={"comId":comId,"userId":userId};
	$.post(url,data,function(mes){
		if(mes!="" && mes!=null){
			console.info("该用户已经缴纳了保证金");
			a=1;
		}else{
			console.info("该用户没有缴纳了保证金");
			a=0;
		}
	},"json");
}
function findRecordCount(){
	var url="../../../record/findRecordCount.action";
	var data={"comId":comId};
	$.post(url,data,function(mes){
		$("#recoldCount").html(mes);
	},"json");
}
/**
 * 查询出价记录
 * @returns
 */
function findRecord(){
	var url="../../../record/findRecord.action";
	var data={"comId":comId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#recoldBodys").append("<tr>"
					+"<td>"+item.user_name+"</td>"
					+"<td>"+item.re_date+"</td>"
					+"<td>"+item.re_money+".00</td>"
					+"<td>"+item.com_name+"</td>"
				+"</tr>");
		});
	},"json");
}
/**
 * 查询出价排行
 */
var maxMoney;
var dqMpney;
function RecordOrder(){
	$("#orderBodys").html("")
	var url="../../../record/RecordOrder.action";
	var data={"comId":comId};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			if(index==0){
				//最高价
				maxMoney=item.re_money;
				console.info("最高价"+item.re_money);
			}
			if(userId==item.user_id){
				dqMpney=item.re_money;
				console.info("您的出价"+item.re_money);
			}
			$("#orderBodys").append("<tr>"
					+"<td>"+item.user_name+"</td>"
					+"<td>"+item.re_date+"</td>"
					+"<td>"+item.re_money+".00</td>"
					+"<td>"+item.com_name+"</td>"
				+"</tr>");
		});
	},"json");
}
var clearTime1=0;
function setDateSelectedFn(){
	
	
	/*== 获取数据 ==*/
	var data={};
	//系统时间
	
	//开始时间
	data.startdate=dates;
	//结束时间
	data.enddate=times;
	clearTime1=$.leftTime(data,function(d){
	if(d.status){
		var $dateShow1=$("#dateShow2");
		$dateShow1.find(".d").html(d.d);
		$dateShow1.find(".h").html(d.h);
		$dateShow1.find(".m").html(d.m);
		$dateShow1.find(".s").html(d.s);
		switch(d.step){
			case 1:
			$("#dataInfoShow_1").html("距离开始时间：");
			break;
			case 2:
			$("#dataInfoShow_1").html("距离结束时间：");
			break;
			case 3:
			$("#dataInfoShow_1").html("倒计时已结束：");
			break;
			default: 
			$("#dataInfoShow_1").html("");
			break;
		}
	}
});
}


var dates;
var times;
var images;
var comId;
function findById(){
	var url="../../../detail/findById.action";
	var data={"comId":comId};
	$.post(url,data,function(mes){
		comId=mes.comId;
		$("#body-center-body-right-header-ul-title").html(mes.comName);
		$("#body-center-body-right-header-ul-money").html(mes.comStarting);
		$("#comId").html(mes.comId);
		$("#starting").html(mes.comMoney+".00");
		dates=mes.comDate;
		times=mes.comTime;
		$("#comIdli").html(mes.comId);
		$("#comType").html(mes.typeName);
		$("#comUser").html(mes.userName);
		$("#date").html(dates);
		$("#time").html(times);
		$("#margin").html(mes.comAuCommodity+".00");
		$("#content-content").html(mes.comComment);
		$("#userName").html(mes.userName);
		
		$("#oneBzMoney").html(mes.comStarting);
		$("#bzMoney").html(mes.comAuCommodity+".00");
		$("#fourMoney").html(mes.comAuCommodity+".00");
		$("#body-center-body-left-image").html("<img style='width:100%;height:450px;' src=../../../"+mes.comImage+">");
		images=mes.comImage;
		
		findImage();
		findImage2();
		//初始化
		setDateSelectedFn();
		findDate();
	},"json");
	
}
function findImage(){
	var url="../../../image/findBycomId.action";
	var data={"comId":comId,"imType":1};
	$.post(url,data,function(mes){
		$("#body-center-body-left-ul").append("<li><</li>");
		$("#body-center-body-left-ul").append('<li id="li0" style="border:1px solid red;"><img src="../../../'+images+'" class="body-center-body-left-ul-image" onclick="findQHimg(0,\''+images+'\')"></li>');
		$.each(mes,function(index,item){
			$("#body-center-body-left-ul").append('<li id="li'+(index+1)+'"><img src="../../../'+item.imUpload+'" class="body-center-body-left-ul-image" onclick="findQHimg('+(index+1)+',\''+item.imUpload+'\')"></li>');
		});
		$("#body-center-body-left-ul").append("<li>></li>");
	},"json");
}
function findQHimg(val,img){
	$("#body-center-body-left-ul li").css({"border":"none"});
	$("#li"+val).css({"border":"1px solid red"});
	$("#body-center-body-left-image").html('<img style="width:100%;height:450px;" src="../../../'+img+'">');
}
function findImage2(){
	var url="../../../image/findBycomId.action";
	var data={"comId":comId,"imType":2};
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#content-content-ul").append('<li><img style="width:100%;" src="../../../'+item.imUpload+'"></li>');
		});
	},"json");
}

function findUl(val){
	$("#body-center-body-right-footer-header-ul li").css({"background":"#f0f0f0"});
	$("#body-center-body-right-footer-header-ul li").css({"color":"black"});
	$("#daoulli"+val).css({"background":"#1091de"});
	$("#daoulli"+val).css({"color":"white"});
	$(".body-center-body-right-footer-header").css({"display":"none"});
	$("#body-center-body-right-footer-header"+val).css({"display":"block"});
}
function getParameter(param)
{
	var query = window.location.search;
	var iLen = param.length;
	var iStart = query.indexOf(param);
	if (iStart == -1)
		return "";
	iStart += iLen + 1;
	var iEnd = query.indexOf("&", iStart);
	if (iEnd == -1)
		return query.substring(iStart);

	return query.substring(iStart, iEnd);
}
