<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人商品信息</title>
<script language="JavaScript">
	function dateStart() {
		//月份对应天数
		MonHead = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

		//给年下拉框赋内容   
		var y = new Date().getFullYear();
		for (var i = (y - 50); i < (y + 50); i++)
			//以今年为准，前50年，后50年   
			document.date.year.options.add(new Option(" " + i + " 年", i));

		//给月下拉框赋内容   
		for (var i = 1; i < 13; i++)
			document.date.month.options.add(new Option(" " + i + " 月", i));

		document.date.year.value = y;
		document.date.month.value = new Date().getMonth() + 1;
		var n = MonHead[new Date().getMonth()];
		if (new Date().getMonth() == 1 && IsPinYear(yearvalue))
			n++;
		writeDay(n); //赋日期下拉框   
		document.date.day.value = new Date().getDate();
	}

	if (document.attachEvent)
		window.attachEvent("onload", dateStart);
	else
		window.addEventListener('load', dateStart, false);

	function selectYear(str) //年发生变化时日期发生变化(主要是判断闰平年)   
	{
		var monthvalue = document.date.month.options[document.date.month.selectedIndex].value;
		if (monthvalue == "") {
			var e = document.date.day;
			optionsClear(e);
			return;
		}
		var n = MonHead[monthvalue - 1];
		if (monthvalue == 2 && IsPinYear(str))
			n++;
		writeDay(n);
	}

	function selectMonth(str) //月发生变化时日期联动   
	{
		var yearvalue = document.date.year.options[document.date.year.selectedIndex].value;
		if (yearvalue == "") {
			var e = document.date.day;
			optionsClear(e);
			return;
		}
		var n = MonHead[str - 1];
		if (str == 2 && IsPinYear(yearvalue))
			n++;
		writeDay(n);
	}

	function writeDay(n) //据条件写日期的下拉框   
	{
		var e = document.date.day;
		optionsClear(e);
		for (var i = 1; i < (n + 1); i++)
			e.options.add(new Option(" " + i + " 日", i));
	}

	function IsPinYear(year)//判断是否闰平年   
	{
		return (0 == year % 4 && (year % 100 != 0 || year % 400 == 0));
	}

	function optionsClear(e) {
		e.options.length = 1;
	}
</script>
</head>
<body>
	<form class="am-form am-form-horizontal"
		action="${pageContext.request.contextPath }/editmygoods.action"
		method="post" enctype="multipart/form-data" onsubmit="return check()"
		name="date" id="form1">
		<div class="am-form-group">
			<label for="l_name" class="am-u-sm-3 am-form-label">商品ID</label>
			<div class="am-u-sm-9">
				<input type="text" id="id" name="id"
					value="${MYGOODS_SESSION.id}">
			</div>
		</div>
		<div class="am-form-group">
			<label for="l_name" class="am-u-sm-3 am-form-label">商品名称</label>
			<div class="am-u-sm-9">
				<input type="text" id="l_name" name="l_name"
					value="${MYGOODS_SESSION.l_name}">
			</div>
		</div>
		<div class="am-form-group">
			<label class="am-u-sm-3 am-form-label">上传封面：</label> <input
				type="file" name="file" value="${MYGOODS_SESSION.l_image}">
		</div>
		<div class="am-form-group">
			<label for="l_price" class="am-u-sm-3 am-form-label">价格</label>
			<div class="am-u-sm-9">
				<input type="text" id="l_price" name="l_price"
					value="${MYGOODS_SESSION.l_price}"
					onkeyup="this.value=this.value.replace(/[^\d\.]/g)">
			</div>
		</div>

		<div class="am-form-group">
			<label for="l_info" class="am-u-sm-3 am-form-label">商品信息</label>
			<div class="am-u-sm-9">
				<input type="text" id="l_info" name="l_info"
					value="${MYGOODS_SESSION.l_info}">
			</div>
		</div>
		<div class="am-form-group">
			<label for="l_out_time" class="am-u-sm-3 am-form-label">允许租赁时间:</label>
			<div class="am-u-sm-9">

				<input id="l_out_time" name="l_out_time" type="text" value=""
					readonly="true" />
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
				</select> <select name="month" id="month" onchange="selectMonth(this.value)">
					<option value="mothe">选择 月</option>
				</select> <select name="day" id="day">
					<option value="day">选择 日</option>
				</select>

			</div>
		</div>

		<div class="am-form-group"></div>

		<div class="am-form-group">
			<label for="u_id" class="am-u-sm-3 am-form-label">卖家ID：</label>
			<div class="am-u-sm-9">
				<input id="u_id" name="u_id" type="text" value="${USER_SESSION.id}"
					readonly="readonly">

			</div>
		</div>


		<div class="am-form-group">
			<label for="u_id" class="am-u-sm-3 am-form-label">卖家：</label>
			<div class="am-u-sm-9">
				<input id="u_name" name="u_name" type="text"
					value="${USER_SESSION.username}" readonly="readonly">

			</div>
		</div>

		<div class="am-form-group">
			<label for="l_addr" class="am-u-sm-3 am-form-label">商品地址</label>
			<div class="am-u-sm-9">
				<input class="" id="l_addr" name="l_addr" value="${MYGOODS_SESSION.l_addr}">

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