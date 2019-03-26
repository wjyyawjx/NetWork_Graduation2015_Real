<%@page import="com.qst.bean.BuytodayBean"%>
<%@page import="java.util.List"%>
<%@page import="com.qst.service.BuytodayService"%>
<%@page import="com.qst.service.BuytodayServiceimp"%>
<%@page import="com.qst.bean.BuytodayBean" %>
<%@page import="com.qst.service.TmbuyService"%>
<%@page import="com.qst.service.TmbuyServiceimp"%>
<%@page import="com.qst.bean.TmbuyBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
  <script type="text/javascript" src="../res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="login.html">登录</a></div>
        <div class="sp-cart"><a href="html/shopcart.html">购物车</a></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
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


  <div class="content content-nav-base buytoday-content">
    <div id="list-cont">
      <div class="main-nav">
        <div class="inner-cont0">
          <div class="inner-cont1 w1200">
            <div class="inner-cont2">
              <a href="commodity.jsp">所有商品</a>
              <a href="buytoday.html" class="active">今日团购</a>
              <a href="information.html">手机资讯</a>
              <a href="about.html">关于我们</a>
            </div>
          </div>
        </div>
      </div>
      <div class="banner-box">
        <div class="banner"></div>
      </div>
      <div class="product-list-box">
        <div class="product-list w1200">  
          <div class="tab-title">
            <a href="javascript:;" class="active tuang" data-content="tuangou">今日团购</a>
            <a href="javascript:;" data-content="yukao">明日预告</a>
          </div>
          <div class="list-cont" cont = 'tuangou'>
           <%
             		session.removeAttribute("list");
  					BuytodayService buyService = new BuytodayServiceimp();
                    List<BuytodayBean> list = buyService.getAllBuytoday();
                    session.setAttribute("list", list);
                     for(BuytodayBean buy:list){ 
                 %>
            <div class="item-box layui-clear">
              <div class="item">
                <img src="../res/static/img/tuan_img1.jpg" alt="">
                <div class="text-box">
                  <p class="title"><%=buy.getTyname()%></p>
                  <p class="plic">
                    <span class="ciur-pic"><%=buy.getPresent()%></span>
                    <span class="Ori-pic"><%=buy.getOriginal()%></span>
                    <span class="discount"><%=buy.getDscount()%></span>
                  </p>
                </div>
              </div>

            </div>
            <%} %>
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>  
      </div>
      <div class="footer-wrap">
        <div class="footer w1200">
          <div class="title">
            <h3>团购销量榜</h3>
          </div>
          <div class="list-box layui-clear" id="footerList">
           <%
             		session.removeAttribute("list");
  					TmbuyService tmService = new TmbuyServiceimp();
                    List<TmbuyBean> list = tmService.getAllTmbuy();
                    session.setAttribute("list", list);
                     for(TmbuyBean tm:list){ 
                 %>
            <div class="item">
              <img src="../res/static/img/tuan_img5.jpg" alt="">
              <div class="text">
                <div class="right-title-number"><%=tm.getTmnum()%></div>
                <div class="commod">
                  <p><%=tm.getTmname()%></p>
                  <span><%=tm.getTmprice()%></span>
                </div>
              </div>
            </div>
             <%} %>
          </div>
        </div>
      </div>
    </div>
  </div>
<script>

  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$;
     mm = layui.mm;
      laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });


      $('body').on('click','*[data-content]',function(){
        $(this).addClass('active').siblings().removeClass('active')
        var dataConte = $(this).attr('data-content');
        $('*[cont]').each(function(i,item){
          var itemCont = $(item).attr('cont');
          console.log(item)
          if(dataConte === itemCont){
            $(item).removeClass('layui-hide');
          }else{
            $(item).addClass('layui-hide');
          }
        })
      })

});
</script>


</body>
</html>