var pp = 1 ;//默认第一页
var count = 0 ;//默认总有0页
$(function(){
	 //初始化列表
	showList(null);
	showPage(null); 
		
		
	 
		
		/**
		 * 点击增加时,弹出层
		 */
		$("#addBtn").click(function(){
			setClasses();
			$("#addOrUpdateDiv").show();
		});
		
		$("#cancelBtn").click(function(){
			$("#addOrUpdateDiv").hide();
		})
		
		/**
		 * 提交
		 */
		$("#studentSubmit").click(function(){
			  
			var url = "../user/addOrUpdate.action";
			var data = $("#studentForm").serialize();
			$.post(url,data,function(mes){
				if(mes.state==1){
					swal("操作成功!");
					$("#addOrUpdateDiv").hide();
					showList(null);
				}
			},"json");
		})

});

function showPage(data){
	$(".pagination").html("");
	/**
	 * 分页的查询
	 */
	var url = "../user/findPage.action";
	 
	$.post(url,data,function(mes){
		count = mes.totalPages ;//总页数
		//alert(count);
		if(count>0){
			$(".pagination").append('<li><a href="javascript:findPagePre()">&laquo;</a></li>');
		}
		for(var i=0;i<count;i++){
			$(".pagination").append('<li id="'+(i+1)+'"><a href="javascript:findAllPage('+(i+1)+')">'+(i+1)+'</a></li>');
		}
		if(count>0){
			$(".pagination").append('<li><a href="javascript:findPageNext()">&raquo;</a></li>');
		}
		
	},"json");
}

/**
 * 点击分页时,显示列表
 * @param curPage
 * @returns
 */
function findAllPage(curPage){
	$("li").removeClass("active");
	$("#"+curPage).addClass("active");
	pp = curPage ;
	var data = {"vo.curPage":curPage};
	showList(data);
	 
}


/**
 * 显示所有行的方法
 */
function showList(data){
	var url = "../user/findAll.action";
	$("#tab").html(""); 
	$.post(url,data,function(mes){
		$.each(mes,function(index,item){
			$("#tab").append("<tr><td>"+item.stuId+"</td><td>"+item.stuName+"</td><td>"+item.stuAge+"</td><td>"+item.stuBalance+"</td><td>"+item.stuJobTimeStr+"</td><td>"+item.className+"</td><td><input type='button' class='btn btn-primary' value='修改' onclick=showUpdate(\'"+item.stuId+"\')><input type='button' class='btn' value='删除'  onclick=deletItem(\'"+item.stuId+"\')></td></tr>");
		})
		
	},"json");
}

/**
 * 上一页
 */
function findPagePre(){
	if(pp<=1){
		swal("已经到了第一页");
		return ;
	}
	pp--;
	findAllPage(pp);
}

/**
 * 下一页
 */
function findPageNext(){
	if(pp>=count){
		swal("已经到了最后一页");
		return ;
	}
	pp++;
	findAllPage(pp);
}


/**
 * 显示修改
 */
function showUpdate(id){
	setClasses();//加载班级
	
	var url = "../user/showUpdate.action";
	var data = {"vo.stuId":id};
	$.post(url,data,function(mes){
		
		if(mes){
			$("#addOrUpdateDiv").show();
			$.setForm('#studentForm',mes);
			//$("")
		}else{
			swal("找不到该学生!");
		}
		
	},"json")
}

/**
 * 加载班级下拉框
 * @returns
 */
function setClasses(){
	
	var url="../classes/findAll.action";
	var data = null ;
	$("#classId").html("");
	
	/*
	$.post(url,data,function(mes){
		$.each(mes,function(i,item){
			$("#classId").append("<option value='"+item.clsId+"'>"+item.clsName+"</option>");
		})
	},"json");
	*/
	
	$.ajax({ 	
		type:"post",
		url:url,
		data:data,
		async:false, //同步
		dataType:"json",
		success:function(mes){
			$.each(mes,function(i,item){
				$("#classId").append("<option value='"+item.clsId+"'>"+item.clsName+"</option>");
			})
		},
		error:function(){
			swal("请求失败");
		}
	});
	
}

/**
 * 删除
 * @param id
 * @returns
 */
function deletItem(id){
	var url = "../user/delete.action";
	var data = {"vo.stuId":id};
	$.post(url,data,function(mes){
		
		if(mes.state==1){
			swal("删除成功!");
			showList(null);//刷新页面
		}else{
			swal("操作失败!");
		}
		
	},"json")
}


/**
 * 查询
 * @returns
 */
function queryStu(){
	
	var data = $("#queryForm").serialize();
	showList(data);
	showPage(data);
	
}
