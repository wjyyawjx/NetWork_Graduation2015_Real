<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买商品信息</title>
</head>
<body>
<form class="am-form am-form-horizontal"
								action="${pageContext.request.contextPath }/addgoods.action"
								method="post" enctype="multipart/form-data"
								onsubmit="return check()" name="date" id="form1">
								<div class="am-form-group">
									<label for="l_name" class="am-u-sm-3 am-form-label">商品名称</label>
									<div class="am-u-sm-9">
										<input type="text" id="l_name" name="l_name"
											placeholder="商品名称"> <small>输入商品的名字，让别人记住你。</small>
									</div>
								</div>


								
								<div class="am-form-group">
									<label class="am-u-sm-3 am-form-label">上传封面：</label>
									<input type="file" name="file">
								</div>
								<div class="am-form-group">
									<label for="l_price" class="am-u-sm-3 am-form-label">价格</label>
									<div class="am-u-sm-9">
										<input type="text" id="l_price" name="l_price"
											placeholder="输入你的商品价格 / Price,仅允许数字"
											onkeyup="this.value=this.value.replace(/[^\d\.]/g)">
									</div>
								</div>

								<div class="am-form-group">
									<label for="l_info" class="am-u-sm-3 am-form-label">商品信息</label>
									<div class="am-u-sm-9">
										<input type="text" id="l_info" name="l_info"
											placeholder="输入你的商品信息">
									</div>
								</div>


								<div class="am-form-group">
									<label for="l_type" class="am-u-sm-3 am-form-label">商品类型
										<span class="tpl-form-line-small-title">Type</span>
									</label>
									<div class="am-u-sm-9">
										<select data-am-selected="{searchBox: 1}" name="l_type" id="l_type">
											<option value="笔记">笔记</option>
											<option value="图书">图书</option>
											<option value="工具">工具</option>
											<option value="娱乐">娱乐</option>
										</select>
									</div>
								</div>





								<div class="am-form-group">
									<label for="l_out_time" class="am-u-sm-3 am-form-label">允许租赁时间:</label>
									<div class="am-u-sm-9">

										<input id="l_out_time" name="l_out_time" type="text" value="" readonly="true"/>
									</div>
								</div>
								<script language="javascript" type="text/javascript">
									function shijian() {
										var D = new Date();
										var yy = D.getFullYear();
										var mm = D.getMonth() + 1;
										var dd = D.getDate();

										var time = yy + "-" + mm + "-" + dd;
										document.getElementById("l_out_time").value = time;
										setTimeout("shijian()", 1000);
									}
									shijian();
								</script>
								<div class="am-form-group">
									<label for="l_in_time" class="am-u-sm-3 am-form-label">租赁截止日期</label>
									<div class="am-u-sm-9">

										 <select name="year" id="year" onchange="selectYear(this.value)">
											<option value="year">选择 年</option>
										</select> <select name="month" id="month"  onchange="selectMonth(this.value)">
											<option value="mothe">选择 月</option>
										</select> <select name="day" id="day" >
											<option value="day">选择 日</option>
										</select> 
                                       
									</div>
								</div>

								<div class="am-form-group">
									
									
								</div>



								<div class="am-form-group">
									<label for="u_id" class="am-u-sm-3 am-form-label">物主id</label>
									<div class="am-u-sm-9">
										<textarea class="" id="u_id" name="u_id" placeholder="物主id"></textarea>

									</div>
								</div>

								<div class="am-form-group">
									<label for="l_addr" class="am-u-sm-3 am-form-label">商品地址</label>
									<div class="am-u-sm-9">
										<textarea class="" id="l_addr" name="l_addr"
											placeholder="请输入地址"></textarea>

									</div>
								</div>

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<button type="submit" class="am-btn am-btn-primary">保存修改</button>
									</div>
								</div>
							</form>
</body>
</html>