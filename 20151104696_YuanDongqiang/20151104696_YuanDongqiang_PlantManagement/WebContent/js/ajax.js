function fajax(url,params,callback,ifcache){
	jQuery.ajaxSetup({
		cache:ifcache
	});
	jQuery.ajax({
		type:"post",
		url:url,
		data:params,
		cache:false,
	    dataType:'json',
	    success:callback
	});
}

function fpost(form_id,refresh){
	$(this).attr('disabled','false');
	var data = $('#'+form_id).serialize();
	var url = $('#'+form_id).attr('action');
	if (refresh === true)
		fajax(url,data,btnCallbackRefresh);
	else if (typeof refresh=='function')
	{
		fajax(url,data,refresh);
	}
	else if (typeof refresh=='string' && refresh.length>0)
	{
		g_next_load_url = refresh;
		fajax(url,data,btnCallbackHref);
	}
	else
	{
		fajax(url,data,btnCallbackNew);
	}
}