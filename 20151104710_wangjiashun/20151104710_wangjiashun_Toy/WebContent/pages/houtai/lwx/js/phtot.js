/**
	*鼠标进入时
	*/
	function getPathOver(obj){
		$("#pic").toggle(500);
		$('#pic').attr({"src":obj.src});
	}
	/**
	*鼠标退出时
	*/
	function getPathOut(){
		$('#pic').css({"display":"none"});
	}
	
	
	
	