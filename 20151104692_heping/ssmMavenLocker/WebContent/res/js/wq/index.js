//储物柜楼层
var j=0;
//金额
var je=null;
//储物柜编号
var bh=0;
//取件码
var reId=0;
//普通用户      还是        会员用户
var yhAndHy = 0;
//1-48的正则表达式
var regstr = /^(?:[1-9]|([1-3][0-9])?|4[0-8])$/;
//输出楼层
var louceng2;

$(function(){
	//储物柜隐藏
	$("#out").hide();
	//隐藏显示
	$("#two").hide();
	//隐藏
	$("#three").hide();
	//逾期支付页面
	$("#four").hide();
	//隐藏个人中心
	$("#five").hide();
	//逾期返回按钮
	$("#four3").click(function(){
		$("#four").hide();
	});
	
	//登陆进来如果付款>=100,普通用户升级为会员用户
	var url="../../../user/commonAndMember.action";
	$.post(url,null,function(mes){
		if(mes==1){
			
		}
	},"json");
	
	
	$(".shang_box").show();
	//点击微信还是支付宝
	$(".pay_item").click(function(){
		$(this).addClass('checked').siblings('.pay_item').removeClass('checked');
		var dataid=$(this).attr('data-id');
		$(".shang_payimg img").attr("src","../../../upload/img/"+dataid+".jpg");
		$("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
	});
	//使用储物柜返回
	$("#three3").click(function(){
		$("#three").hide(1000);
		$("#jiage").val("");
		$("#zje").html("");
		$("#yuq").html("");
		$("#wupin").val("");
	});
	//个人中心返回
	$("#fiveFH").click(function(){
		$("#five").hide();
	})
	
	//点击退出  把session里面的值清空
	$("#tc").click(function(){
		var url="../../../user/removeSession.action";
		$.post(url,null,function(mes){
			if(mes.state==1){
				swal({
				    title: '退出成功',
				    timer: 2000
				})
				$("#two").hide();
				$("#one").show();
			}else{
				swal({
				    title: '退出失败',
				    timer: 2000
				})
			}
			
		},"json");
	})
	
	
	//点击注册
	$("#one1").click(function(){
		location.href="../sh/LoginHTML/demo.html";
	});
	//点击登陆
	$("#one2").click(function(){
		location.href="../sh/LoginHTML/demo.html";
	})
	//点击个人中心
	$("#grzx").click(function(){
		/*$("#five").show();
		var url="../../../user/userSelect.action";
		$.post(url,null,function(mes){
			$("#uId").val(mes.uId);
			$("#uZh").val(mes.uZh);
			$("#uMm").val(mes.uMm);
			$("#uPhone").val(mes.uPhone);
			$("#uSite").val(mes.uSite);
			if(mes.uType=="1"){
				$("#useruser").html("普通用户");
			}else if(mes.uType=="2"){
				$("#useruser").html("会员用户");
			}
		},"json");*/
		
		
		layx.group('group',[
		    {
		        id:'group2',
		        title:'个人信息',
		        type:'url',
		        url:'./user.html'
		    },
		    {
		        id:'taobao',
		        title:'个人记录',
		        type:'url',
		        url:'./user2.html'
		    }
		],1);
	})
	//个人中心点击提交
	$("#fiveTiJiao").click(function(){
		$("#five").hide();
		var url="../../../user/addOrUpdate.action";
		var data=$("#biaodan").serialize(); //将表单序列化;
		$.post(url,data,function(mes){
			if(mes.state==1){
				swal({
				    title: '修改成功',
				    timer: 2000
				})
			}else{
				swal({
				    title: '修改失败',
				    timer: 2000
				})
			}
		},"json");
	})
	
	//用户session是否为空
	var url="../../../cabinet/backSession.action";
	var data=null;
	$.post(url,data,function(mes){
		if(mes.state==1){
			$("#two").show();
		}else{
			$("#two").hide();
		}
	},"json");
	
	//逾期支付后增加取件时间和去除取件码
	$("#four2").click(function(mes){
		var url="../../../record/backYuqiQujian.action";
		var data={"reCharge":$("#four1").html()}
		$.post(url,data,function(mes){
			if(mes==1){
				swal({
				    title: '支付成功',
				    timer: 2000
				})
				//没逾期         取完件柜子变空
				$("#gui").html("");
				//查询储物柜所有
				var url="../../../cabinet/backSelectAll.action";
				var data={"arId":j};
				$.post(url,data,function(mes){
					$.each(mes,function(i,item){
						$("#gui").append("<li id='li4"+item.caId+"'><span>编号"+item.caId+"</span><span style='display:none;' id='sp4"+item.caId+"'>"+item.caWhether+"</span><span style='margin-left:80px;'>"+item.chType+"</span></li>");
						if($("#sp4"+item.caId+"").html()=="满"){
							$("#li4"+item.caId+"").css({"background":"#FF8080"});
						}
						if($("#sp4"+item.caId+"").html()=="空"){
							$("#li4"+item.caId+"").css({"background":"#80FF80"});
						}
					});
				},"json")
			}else{
				swal({
				    title: '支付失败',
				    timer: 2000
				})
			}
		},"json");
	});
	
	
	//点击储物按钮
	$("#cw").click(function(){
		//储物柜不同类型的价格
		var url="../../../cabinet/selectAllType.action";
		$.post(url,null,function(mes){
			$.each(mes,function(i,item){
				if(item.chId==1){
					$("#threeDa").html("("+item.chCharge+"￥/h)");
				}else if(item.chId==2){
					$("#threeZhong").html("( "+item.chCharge+"￥/h)");
				}else{
					$("#threeXiao").html("( "+item.chCharge+"￥/h)");
				}
			})
		},"json");
		
		$("#threeOne").html("");
		$("#threeTwo").html("");
		$("#threeThree").html("");
		$("#three").show(1000);
		var url="../../../cabinet/backKon.action";
		var data={"caWhether":"空","loId":j};
		$.post(url,data,function(mes){
			$.each(mes,function(i,info){
				if(i=="1"){
					$.each(info,function(j,item){
						$("#threeOne").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
					})
				}else if(i=="2"){
					$.each(info,function(j,item){
						$("#threeTwo").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
					})
				}else if(i=="3"){
					$.each(info,function(j,item){
						$("#threeThree").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
					})
				}
				//$("#three0").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:30px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
			})
		},"json");
		
		var url="../../../user/userSelect.action";
		$.post(url,data,function(mes){
			yhAndHy=mes.uType;
		},"json")
	});
	
	
	//输入时间总金额自动返回值
	$("#jiage").keyup(function(){
		if(yhAndHy=="2"){
			$("#zje").html($("#jiage").val()*je*0.8);
			$("#shoufei").html("(会员收费8折)");
		}else{
			$("#zje").html($("#jiage").val()*je);
			$("#shoufei").html("(用户收费)");
		}
	});
	
	//点击确认
	$("#three2").click(function(){
		//判断输入时间是否在1-48h之间
		if(regstr.test($("#jiage").val()) && $("#wupin").val().length<20 && $("#wupin").val().length>=1){
			var url="../../../record/backSubmit.action";
			var data=({"caId":bh,"reMoney":$("#zje").html(),"reOverdue":"未逾期","reTime":$("#jiage").val(),"reCodeyin":$("#wupin").val()});
			$.post(url,data,function(mes){
				if(mes.state>0){
					//点击确认储物柜空变为满
					$("#gui").html("");
					//查询储物柜所有
					var url="../../../cabinet/backSelectAll.action";
					var data={"arId":j};
					$.post(url,data,function(mes){
						$.each(mes,function(i,item){
							$("#gui").append("<li id='li2"+item.caId+"'><span>编号"+item.caId+"</span><span style='display:none;' id='sp2"+item.caId+"'>"+item.caWhether+"</span><span style='margin-left:80px;'>"+item.chType+"</span></li>");
							if($("#sp2"+item.caId+"").html()=="满"){
								$("#li2"+item.caId+"").css({"background":"#FF8080"});
							}
							if($("#sp2"+item.caId+"").html()=="空"){
								$("#li2"+item.caId+"").css({"background":"#80FF80"});
							}
						});
					},"json");
					
					//为空时候查询可储物的储物柜，去除开始储物的储物柜
					$("#threeOne").html("");
					$("#threeTwo").html("");
					$("#threeThree").html("");
					var url="../../../cabinet/backKon.action";
					var data={"caWhether":"空","loId":j};
					$.post(url,data,function(mes){
						$.each(mes,function(i,info){
							if(i=="1"){
								$.each(info,function(j,item){
									$("#threeOne").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
								})
							}else if(i=="2"){
								$.each(info,function(j,item){
									$("#threeTwo").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
								})
							}else if(i=="3"){
								$.each(info,function(j,item){
									$("#threeThree").append("<li id='li"+item.caId+"' class='li' onclick='showli("+item.caId+")' style='width:30px;height:25px;background:#80FF80;cursor:pointer;'>"+item.caId+"</li>")
								})
							}
						})
					},"json");
					
				}else{
					swal({
					    title: '储物失败',
					    timer: 2000
					})
				}
			},"json");
			$("#jiage").val("");
			$("#zje").html("");
			$("#yuq").html("");
			$("#wupin").val("");
		}else{
			swal({
			    title: '输入相应的时间和物品',
			    timer: 2000
			})
		}
	});
	
	//取件按钮
	$(".qujian").click(function(){
		var url="../../../record/backLouCeng.action";
		var data={"reCode":$(".qujianma").val()};
		$.post(url,data,function(mes){
			louceng2 = mes.louceng2;
		},"json");
		
		var url="../../../record/backQuJian.action";
		var data={"reCode":$(".qujianma").val(),"louceng":j};
		$.post(url,data,function(mes){
			if(mes.reOverdue=="已逾期"){
				swal({
				    title: '已逾期',
				    timer: 2000
				})
				//逾期支付页面
				$("#four").show();
				//逾期要支付的金额
				var url="../../../record/backyuqi.action";
				var data={"reCode":$(".qujianma").val()};
				$.post(url,data,function(mes){
					$("#four1").html(mes.reCharge);
				},"json");
			}else if(mes.reOverdue=="未逾期"){
				swal({
				    title: '未逾期',
				    timer: 2000
				})
				//没逾期         取完件柜子变空
				$("#gui").html("");
				//查询储物柜所有
				var url="../../../cabinet/backSelectAll.action";
				var data={"arId":j};
				$.post(url,data,function(mes){
					$.each(mes,function(i,item){
						$("#gui").append("<li id='li3"+item.caId+"'><span>编号"+item.caId+"</span><span style='display:none;' id='sp3"+item.caId+"'>"+item.caWhether+"</span><span style='margin-left:80px;'>"+item.chType+"</span></li>");
						if($("#sp3"+item.caId+"").html()=="满"){
							$("#li3"+item.caId+"").css({"background":"#FF8080"});
						}
						if($("#sp3"+item.caId+"").html()=="空"){
							$("#li3"+item.caId+"").css({"background":"#80FF80"});
						}
					});
				},"json");
			}else{
				swal({
				    title: '取件码错误或储物柜不在这一层',
				    text: "本物品在"+louceng2+"F",
				    timer: 2000
				});
			}
		},"json");
	});
});
//可储存的储物柜
function showli(id){
	bh=id;
	$(".li").css({"background":"#80FF80"});
	$("#li"+id+"").css({"background":"#FF8080"});
	var url="../../../cabinet/backTypeCharge.action";
	var data={"caId":id};
	$.post(url,data,function(mes){
		je=mes.chCharge;
		$("#yuq").html(mes.chOverdue);
		$("#zje").html("");
		if(yhAndHy=="2"){
			$("#zje").html($("#jiage").val()*je*0.8);
			$("#shoufei").html("(会员收费8折)");
		}else{
			$("#zje").html($("#jiage").val()*je);
			$("#shoufei").html("(用户收费)");
		}
	},"json");
}


//储物柜显示
function boxin(i){
	j=i;
	//清空储物柜
	$("#gui").html("");
	
	$("#out").show();
	$("#louceng").html(i+"F");
	//查询储物柜所有
	var url="../../../cabinet/backSelectAll.action";
	var data={"arId":i};
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#gui").append("<li id='li"+item.caId+"'><span>编号"+item.caId+"</span><span style='display:none;' id='sp"+item.caId+"'>"+item.caWhether+"</span><span style='margin-left:70px;font-size:30px'>"+item.chType+"</span></li>");
			if($("#sp"+item.caId+"").html()=="满"){
				$("#li"+item.caId+"").css({"background":"#FF8080"});
				//#FF8080
			}
			if($("#sp"+item.caId+"").html()=="空"){
				$("#li"+item.caId+"").css({"background":"#80FF80"});
				//#80FF80
			}
		})
	},"json")
}
//储物柜隐藏
function hiden(){
	$("#out").hide();
}