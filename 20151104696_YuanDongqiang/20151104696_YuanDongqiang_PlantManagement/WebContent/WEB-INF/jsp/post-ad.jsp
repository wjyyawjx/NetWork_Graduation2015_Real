<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- bootstrap-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menu_sideslide.css"
	type="text/css" media="all">
<!-- Navigation-CSS -->
<!-- meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap-select.js"></script>
<script>
	$(document).ready(function() {
		var mySelect = $('#first-disabled2');

		$('#special').on('click', function() {
			mySelect.find('option:selected').prop('disabled', true);
			mySelect.selectpicker('refresh');
		});

		$('#special2').on('click', function() {
			mySelect.find('option:disabled').prop('disabled', false);
			mySelect.selectpicker('refresh');
		});

		$('#basic2').selectpicker({
			liveSearch : true,
			maxOptions : 1
		});
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath }/css/jquery.uls.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.grid.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.lcd.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/jquery.uls.data.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.data.utils.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.uls.lcd.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.languagefilter.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.regionfilter.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.uls.core.js"></script>
<script>
	$(document).ready(function() {
		$('.uls-trigger').uls({
			onSelect : function(language) {
				var languageName = $.uls.data.getAutonym(language);
				$('.uls-trigger').text(languageName);
			},
			quickList : [ 'en', 'hi', 'he', 'ml', 'ta', 'fr' ]
		//FIXME
		});
	});
</script>
</head>
<body>
	<header>
	<div class="w3ls-header">
		<div class="w3ls-header-right">
			<ul>
				<li class="dropdown head-dpdn"><a href="login.jsp"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						${USER_SESSION.u_name}</a></li>
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/help.action"><i
						class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a></li>
			</ul>
		</div>
		<h1>
			<a href="${pageContext.request.contextPath }/index.action"><img
				src="img/core-img/logo.png" alt=""></a>
		</h1>
		<div class="clearfix"></div>
	</div>
	</header>
	<div class="submit-ad main-grid-border">
		<div class="container">
			<h2 class="w3-head">上传植物信息</h2>
			<div class="post-ad-form">
				<form action="${pageContext.request.contextPath }/AddPlanMess.action">
					<label>植物名称 <span>*</span></label> <input type="text" class="phone"
						id="name" name="name" placeholder="">
					<div class="clearfix"></div>
					<label>繁殖方式<span>*</span></label> <select id="category"
						name="category" class="">
						<option>选择类别</option>
						<option>孢子繁殖（由植物体散发出孢子进行繁殖）</option>
						<option>种子繁殖</option>
						<option>无性繁殖（植物体本身的某部分进行繁殖）</option>
					</select>
					<div class="clearfix"></div>
					<label>分布地区<span>*</span></label> <select id="place" name="place"
						class="" >
						<option>选择地区</option>
						<option>华北地区 （北京市 天津市 河北省 内蒙古 山西省 山东省）</option>
						<option>华东地区 （上海市 安徽省 浙江省 江苏省 ）</option>
						<option>华南地区 （广东省 福建省 海南省 广西自治区）</option>
						<option>华中地区 （湖北省 河南省 湖南省 江西省）</option>
						<option>东北地区 （辽宁省 黑龙江省 吉林省）</option>
						<option>西北地区 （陕西省 新疆自治区 甘肃省 宁夏 青海省）</option>
						<option>西南地区 （重庆市 四川省 云南省 贵州省 西藏自治区）</option>
					</select>
					<div class="clearfix"></div>
					<label>植物习性 <span>*</span></label>
					<div style="width: 70%; margin-top: 10px; float: left; border: 1px solid red;">
						生长环境： <br /> 
						<input type="radio" name="sun" value="1" />喜阳植物（生长在阳光充足环境下。）
						<input type="radio" name="sun" value="2" /> 喜阴植物（喜欢在阴暗的环境下生长。） <br />
						寿命： <br /> 
						<input type="radio" name="life" value="3" />多年生植物（寿命在两年以上的植物。）
						<input type="radio" name="life" value="4" />一年生植物（生命周期为一年的植物。） <br />
						常绿/落叶： <br /> 
						<input type="radio" name="green" value="5" />常绿植物（常年不落也植物。）
						<input type="radio" name="green" value="6" />非常绿植物（植物会在一段时间落叶。）
					</div>
					<div class="clearfix"></div>
					<br /> <label>植物描述 <span>*</span></label>
					<textarea class="mess" id="title" name="title"
						placeholder="有关植物的具体描述。"></textarea>
					<div class="clearfix"></div>
					<label>浇水频率 <span>*</span></label> <select id="time1" name="time1" style="width: 100px;">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select> <select id="time2" name="time2" style="width: 60px;">
						<option>日</option>
						<option>周</option>
						<option>月</option>
						<option>年</option>
					</select>
					<select id="time3" name="time3" style="width: 100px;">
						<option>1次</option>
						<option>2次</option>
						<option>3次</option>
						<option>4次</option>
						<option>5次</option>
						<option>6次</option>
						<option>7次</option>
						<option>8次</option>
						<option>9次</option>
						<option>10次</option>
					</select>
					<div class="clearfix"></div>
					<label>培养描述 <span>*</span></label> <textarea class="mess" id="planmess" name="planmess"
						placeholder="对植物的如何进行培养进行详细描述。"></textarea>
					<div class="clearfix"></div>
					<div class="upload-ad-photos">
						<label>植物照片 :</label>
						<div class="photos-upload-view">
							<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE"
								value="300000" />
							<div>
								<input type="file" id="fileselect" name="fileselect"
									multiple="multiple" />
							</div>
							<div id="messages">
								<p>状态信息</p>
							</div>
						</div>
						<div class="clearfix"></div>
						<script src="js/filedrag.js"></script>
					</div>
					<div class="personal-details">
						<p class="post-terms">
							通过点击 <strong>发布按钮</strong> 您接受我们的 <a href="terms.html"
								target="_blank">使用条款 </a> 和 <a href="privacy.html"
								target="_blank">隐私政策</a>
						</p>

						<div class="clearfix"></div>

					</div>
					<input type="submit" value="发布">
				</form>
			</div>
		</div>
	</div>
	<footer>
	<div class="agileits-footer-bottom text-center">
		<div class="container">
			<div class="w3-footer-logo">
				<h1>
					<a href="${pageContext.request.contextPath }/index.actionl"><img
						src="img/core-img/logo.png" alt=""></a>
				</h1>
			</div>
			<div class="w3-footer-social-icons">
				<ul>
					<li><a class="facebook" href="#"><i class="fa fa-facebook"
							aria-hidden="true"></i><span>Facebook</span></a></li>
					<li><a class="twitter" href="#"><i class="fa fa-twitter"
							aria-hidden="true"></i><span>Twitter</span></a></li>
					<li><a class="flickr" href="#"><i class="fa fa-flickr"
							aria-hidden="true"></i><span>Flickr</span></a></li>
					<li><a class="googleplus" href="#"><i
							class="fa fa-google-plus" aria-hidden="true"></i><span>Google+</span></a></li>
					<li><a class="dribbble" href="#"><i class="fa fa-dribbble"
							aria-hidden="true"></i><span>Dribbble</span></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</footer>
</body>
<!-- Navigation-JavaScript -->
<script src="js/classie.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
</html>