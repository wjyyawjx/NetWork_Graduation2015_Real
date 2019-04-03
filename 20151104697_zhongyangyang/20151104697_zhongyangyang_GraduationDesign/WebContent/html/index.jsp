<%@page import="com.qst.bean.RecommendBean"%>
<%@page import="java.util.List"%>
<%@page import="com.qst.service.RecommendService"%>
<%@page import="com.qst.service.RecommendServiceimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../20151104697_zhongyangyang_GraduationDesign/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="../20151104697_zhongyangyang_GraduationDesign/res/layui/css/layui.css">
  <script type="text/javascript" src="../20151104697_zhongyangyang_GraduationDesign/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body id="list-cont">
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="login.jsp">登录</a></div>
        <div class="sp-cart"><a href="html/shopcart.html">购物车</a></div>
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="手机商城">

          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="html/commodity.jsp" class="active">所有商品</a>
            <a href="html/buytoday.html">今日团购</a>
            <a href="html/information.html">手机资讯</a>
            <a href="html/about.html">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear">
              <li class="nav-item">
                <div class="title">华为</div>
                <p><a href="#">新款</a><a href="#">爆款</a><a href="#">性价比</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">小米</div>
                <p><a href="#">手机</a><a href="#">平板</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">iPhone</div>
                <p><a href="#">手机</a><a href="#">平板</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">vivo</div>
                <p><a href="#">新款</a><a href="#">爆款</a><a href="#">性价比</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">OPPO</div>
                <p><a href="#">新款</a><a href="#">爆款</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">三星</div>
                <p><a href="#">新款</a><a href="#">爆款</a><a href="#">性价比</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">摩托罗拉</div>
                <p><a href="#">新款</a><a href="#">爆款</a><a href="#">性价比</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item nobor">
                <div class="title">金立</div>
                <p><a href="#">新款</a><a href="#">爆款</a><a href="#">性价比</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="category-banner">
        <div class="w1200">
          <img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hw5g.jpg" style="width:1200px;height:400px" >
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>






    <div class="hot-recommend-con">
      <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
       <div class="hot-con1 w1200 layui-clear">
          <div class="item">
            <h4>热销推荐</h4>
            <div class="big-img">
              <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hw5g.jpg"style="width:300px;height:200px"></a>
            </div>
            <div class="small-img">
              <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/iPhonex.jpg"style="width:340px;height:100px" alt=""></a>
            </div>
          </div>
          <div class="item">
            <div class="top-img">
              <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/vivox21.jpg"style="width:350px;height:220px"></a>
            </div>
            <div class="bottom-img">
              <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:170px;height:220px"></a>
              <a class="baby-cream" href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/opr15.jpg"style="width:170px;height:220px"></a>
            </div>
          </div>
          <div class="item item1 margin0 padding0">
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/sxs9.jpg"style="width:380px;height:240px"></a>
            <a href="javascript:;"><img class="btm-img" src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/jl.jpg"style="width:380px;height:240px"></a>
          </div>
      </div>
    </div>
    


    <div class="product-cont w1200" id="product-cont">
      <div class="product-item product-item1 layui-clear">
        <div class="left-title">
          <h4><i>1F</i></h4>
          <img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/icon_gou.png">
          <h5>华为</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwl.jpg"style="width:1000px;height:200px" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwm.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwm.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwm.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwm.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/hwm.jpg"style="width:199px;height:196px"></a>
          </div>
        </div>
      </div>
      <div class="product-item product-item2 layui-clear">
        <div class="left-title">
          <h4><i>2F</i></h4>
          <img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/icon_gou.png">
          <h5>iPhone</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ipl.jpg"style="width:1000px;height:200px" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ip6.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ip6.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ip6.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ip6.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/ip6.jpg"style="width:199px;height:196px"></a>
          </div>
        </div>
      </div>
      <div class="product-item product-item3 layui-clear">
        <div class="left-title">
          <h4><i>3F</i></h4>
          <img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/icon_gou.png">
          <h5>小米</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xml.jpg"style="width:1000px;height:200px" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:199px;height:196px"></a>
            <a href="javascript:;"><img src="../20151104697_zhongyangyang_GraduationDesign/res/static/img/xm8.jpg"style="width:199px;height:196px"></a>
          </div>
        </div>
      </div>
    </div>

    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
        <h4>更多推荐</h4>
        
        <div class="product-item-box layui-clear" id="list-cont">
        <%
             		session.removeAttribute("list");
  					RecommendService recService = new RecommendServiceimp();
                    List<RecommendBean> list = recService.getAllRecommend();
                    session.setAttribute("list", list);
                     for(RecommendBean rec:list){
                 %>
          <div class="list-item">
          	<div class="img">
          		<a href="javascript:;"><img src="<%=rec.getPhotoname() %>"  style="width:230px;height:200px;"></a>
          	</div>
          	<div class="text">
          		<p class="title"><%=rec.getComname() %></p>
          	</div>
            <p class="pri">
            	<span><%=rec.getPrice()%>¥</span>
            </p>

          </div>
           <%} %>
        </div>
       
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">手机资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
    </div>
  </div>
  <script type="text/javascript">

layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
});
  </script>
</body>
</html>