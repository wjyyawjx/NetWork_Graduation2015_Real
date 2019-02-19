function b(){
	h = $(window).height();
	t = $(document).scrollTop();
	if(t > h){
		$('#gotop').show();
	}else{
		$('#gotop').hide();
	}
}
$(document).ready(function(e) {
	b();
	$('#gotop').click(function(){
		$(document).scrollTop(0);	
	})
	$("#top_cut").click(function(){
	  if(jQuery.trim($("#buy_number").val()) != '1'){
	 	 var num = parseInt(jQuery.trim($("#buy_number").val()))-1;
	     $("#buy_number").val(num);
	  }
	});
	$("#top_add").click(function(){
			var num = parseInt(jQuery.trim($("#buy_number").val()))+1;
			 $("#buy_number").val(num);
	});
});

$(window).scroll(function(e){
	b();		
})
// JavaScript Document
$(function(){
	//榧犳爣绉昏嚦id="tab-title"涓嬬殑span鏍囩鏃讹紝瑙﹀彂
	$('#tab-title span').mouseover(function(){
		//缁欏綋鍓嶇殑娣诲姞class="current"锛屽苟涓旇鍏跺悓杈堝厓绱狅紙鍗冲叾浣�#tab-title span锛夌Щ闄lass="current"锛�
		$(this).addClass("current").siblings().removeClass(); 
 		//璁ヽlass="榧犳爣绉昏嚦鐨剆pan鐨刬d"锛堝嵆tab-content涓搴攗l涓殑鍐呭锛夋樉绀猴紝骞朵笖璁╁叾鍚岃緢鍏冪礌锛堝嵆#tab-content ul锛夐殣钘忥紱
		$("."+$(this).attr("id")).show().siblings().hide(); 
	});
 
});

