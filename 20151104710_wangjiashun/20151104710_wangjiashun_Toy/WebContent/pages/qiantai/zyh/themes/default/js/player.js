// JavaScript Document
jQuery(function($){
	var index = 0;
	$('<div id="flow"></div>').appendTo("#myjQuery");

	//婊戝姩瀵艰埅鏀瑰彉鍐呭	
	$("#myjQueryNav li").hover(function(){
		if(MyTime){
			clearInterval(MyTime);
		}
		index  =  $("#myjQueryNav li").index(this);
		MyTime = setTimeout(function(){
		ShowjQueryFlash(index);
		$('#myjQueryContent').stop();
		} , 400);

	}, function(){
		clearInterval(MyTime);
		MyTime = setInterval(function(){
		ShowjQueryFlash(index);
		index++;
		if(index==4){index=0;}
		} , 3000);
	});
	//婊戝叆 鍋滄鍔ㄧ敾锛屾粦鍑哄紑濮嬪姩鐢�.
	 $('#myjQueryContent').hover(function(){
			  if(MyTime){
				 clearInterval(MyTime);
			  }
	 },function(){
				MyTime = setInterval(function(){
				ShowjQueryFlash(index);
				index++;
				if(index==4){index=0;}
			  } , 3000);
	 });
	//鑷姩鎾斁
	var MyTime = setInterval(function(){
		ShowjQueryFlash(index);
		index++;
		if(index==4){index=0;}
	} , 3000);
});
function ShowjQueryFlash(i) {
$("#myjQueryContent div").eq(i).animate({opacity: 1},1000).css({"z-index": "1"}).siblings().animate({opacity: 0},1000).css({"z-index": "0"});
$("#flow").animate({ left: i*122+5 +"px"}, 300 ); //婊戝潡婊戝姩
$("#myjQueryNav li").eq(i).addClass("current").siblings().removeClass("current");
}