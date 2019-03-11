var curPage = 1; //当前页数
var maxPage = 0; //最大页数

	$(function() {
		 //默认加载数据
	    loadData(null);
	    $("#query").click(function() {
	    	curPage = 1;
	    	$("#curPage").val(curPage);
	        var data = $("#queryForm").serialize(); //将表单序列化
	        loadData(data);
	    });
	    
	});
	//分页的方法
	function pageReload(pages) {
	    if (pages == 0) {
	        alert("已经第一页了");
	        return;
	    } else if (pages > maxPage) {
	        alert("已经最后一页了");
	        return;
	    }
	    curPage = pages;
	    $(".pagination").children(":first").html('<a href="javascript:pageReload(' + (curPage - 1) + ')">&laquo;</a>')
	    $(".pagination").children(":last").html('<a href="javascript:pageReload(' + (curPage + 1) + ')">&raquo;</a>')
	    $("#curPage").val(curPage);
	   
	    var data = $("#queryForm").serialize(); //将表单序列化
	    
	    loadData(data);
	}
	
	/**
	加载数据
	*/
	function loadData(data) {
	    var url = getRootPath()+"photo/selectAll.action";
	    var data = data;
	    $("#tb").html("");
	    $.post(url, data, function(mes) {
	        $.each(mes, function(index, item) {
	        	
	            $("#tb").append("<tr><td><img style='width:50px;height:50px' onmouseover='getPathOver(this)' onmouseout='getPathOut()' src='../../"+item.photoPath+"' /></td><td>" + item.photoRemark + "<td><a href='"+getRootPath()+"photo/delete.action?id="+item.photoId+"' class='btn btn-warning'>删除</a><button type='button' class='btn btn-danger' onclick=\"updateForm(\'"+item.photoId+"\')\">修改</button></td></tr>")
	        });
	    }, "json");
	    pages(data);
	}
	/**
	 * 增加
	 * @returns
	 */
	function showForm() {
	    $("#formMain").show(1000);
	}
	/**
	 * 显示修改页面
	 * @param id
	 * @returns
	 */
	function updateForm(id){
		 $("#formMain").show(1000);
		 
		 var url = getRootPath()+"photo/findById.action";
		 var data = {id:id}
		 $.post(url,data,function(mes){
			 //$("#flName").val(mes.flName);
			 var options = { jsonValue: mes }; 
			 $("#flowerForm").initForm(options); //通过json直接给表单的控件赋值
		 },"json");
		 
	}

	/**
	分页
	*/
	function pages(data){
		$(".pagination").html("");
		var url = getRootPath()+"photo/getPages.action";
		$.post(url, data, function(mes) {
	        $(".pagination").append('<li><a href="javascript:pageReload(' + (curPage - 1) + ')">&laquo;</a></li>');
	        //alert(mes.totalPage);
	        maxPage = mes.totalPage;
	        for (var i = 1; i <= mes.totalPage; i++) {
	            $(".pagination").append('<li><a href="javascript:pageReload(\'' + i + '\')">' + i + '</a></li>');
	        }
	        $(".pagination").append('<li><a href="javascript:pageReload(' + (curPage + 1) + ')">&raquo;</a></li>');
	    }, "json");
	}
	
	
	function formHidden(){
		 $("#formMain").hide(1000);
	}
	
	function formSubmit(){
		
		
		
		$("#flowerForm").attr("action",getRootPath()+"photo/addOrUpdate.action");
		$("#flowerForm").submit();
	}
	
	
	
	