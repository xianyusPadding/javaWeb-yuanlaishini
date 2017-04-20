<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>缘来是你</title>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery-validate.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript" src="js/personal.js"></script>
	<script type="text/javascript" src="js/area.js"></script>
	<script type="text/javascript" src="js/offline_Activity.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/personal.css">
	<link rel="stylesheet" href="css/offline_Activity.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="fl-nav" style="background: #EA6678;">
	<div class="container" >
		<div class="navbar-header">
			<a href="#" class="navbar-brand" style="margin:0;padding: 0;"><img src="images/logo3.png" alt=""/></a>
		</div>
		<div class="fl-navbar-main">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<c:choose>
				<c:when test="${user==null }">
					<c:out value="<script type='text/javascript'>alert('请先登录!');location.href='index.jsp';</script>" escapeXml="false"></c:out>
				</c:when>
				<c:otherwise>
					<p class="navbar-text navbar-right fl-login"><a href="logoutServlet" class="navbar-link fl-login" >注销</a></p>
					<p class="navbar-text navbar-right fl-login"><a href="personalServlet" class="navbar-link fl-login" >${user.username}</a></p>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<div class="collapse navbar-collapse" id="navbar-collapse" style="margin-top:-5px">
			<ul class="nav navbar-nav" style="margin: 0px">
				<li><a href="indexServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personalServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriendServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matchingServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>

<div id='fl-main'>
	<div id="myCarousel" class="carousel slide container" data-ride="carousel"> <!-- data-ride="carousel"自动播放 -->
		<ol class="carousel-indicators">
			<li class="active" data-target="#myCarousel" data-slide-to="0" style="opacity: 0.4"></li>
			<li data-target="#myCarousel" data-slide-to="1" style="opacity: 0.4"></li>
			<li data-target="#myCarousel" data-slide-to="2" style="opacity: 0.4"></li>
			<li data-target="#myCarousel" data-slide-to="3" style="opacity: 0.4"></li> <!--轮播器的3个小按钮-->
		</ol>
		<div class="carousel-inner">
			<div class="item active">  <!-- item隐藏图片 -->
				<img class="fl-carousel-img" src="images/party2.jpg" alt="">
				<div class="fl-content">
					<p class="fl-content-time">2014.4.1</p>
					<h4 class="fl-content-title">愚人节party</h4>
					<p class="fl-content-main">
						爱，这世上最简单却也最困难的事情。随着社会的发展，婚姻大事不再束缚于封建思想，大多都能由自己做主。
						但是，随着中国生育计划的实施，男女比例越来越不平衡了，现如今，男多女少的问题已经非常明显，在大城市里，
						许许多多的相亲节目兴起，如（非诚勿扰、百里挑一等），在乡镇上，也有很多相亲的人儿，甚至有一些村子，
						基本都是单身汉子。据我了解，在农村，他们拿到的异性资料大部分是来自于媒婆，
						而媒婆手里的异性的资料也是寥寥无几，就那么三五七八。为解决部分乡村的婚姻问题，
						我们决定做一个这样的婚姻交友网站
					</p>
				</div>
				</img>
			</div>
			<div class="item">
				<img class="fl-carousel-img" src="images/party1.jpg" alt="">
				<div class="fl-content">
					<p class="fl-content-time">2014.4.1</p>
					<h4 class="fl-content-title">愚人节party</h4>
					<p class="fl-content-main">
						爱，这世上最简单却也最困难的事情。随着社会的发展，婚姻大事不再束缚于封建思想，大多都能由自己做主。
						但是，随着中国生育计划的实施，男女比例越来越不平衡了，现如今，男多女少的问题已经非常明显，在大城市里，
						许许多多的相亲节目兴起，如（非诚勿扰、百里挑一等），在乡镇上，也有很多相亲的人儿，甚至有一些村子，
						基本都是单身汉子。据我了解，在农村，他们拿到的异性资料大部分是来自于媒婆，
						而媒婆手里的异性的资料也是寥寥无几，就那么三五七八。为解决部分乡村的婚姻问题，
						我们决定做一个这样的婚姻交友网站
					</p>
				</div>
				</img>
			</div>	

			<div class="item">
				<img class="fl-carousel-img" src="images/party4.jpg" alt="">
				<div class="fl-content-black">					
					<p class="fl-content-time">2014.4.1</p>					
					<h4 class="fl-content-title">愚人节party</h4>
					<p class="fl-content-main">
						爱，这世上最简单却也最困难的事情。随着社会的发展，婚姻大事不再束缚于封建思想，大多都能由自己做主。
						但是，随着中国生育计划的实施，男女比例越来越不平衡了，现如今，男多女少的问题已经非常明显，在大城市里，
						许许多多的相亲节目兴起，如（非诚勿扰、百里挑一等），在乡镇上，也有很多相亲的人儿，甚至有一些村子，
						基本都是单身汉子。据我了解，在农村，他们拿到的异性资料大部分是来自于媒婆，
						而媒婆手里的异性的资料也是寥寥无几，就那么三五七八。为解决部分乡村的婚姻问题，
						我们决定做一个这样的婚姻交友网站
					</p>
				</div>
				</img>
			</div>

			<div class="item">
				<img class="fl-carousel-img" src="images/party3.png" alt="">
				<div class="fl-content">
					<p class="fl-content-time">2014.4.1</p>
					<h4 class="fl-content-title">愚人节party</h4>
					<p class="fl-content-main">
						爱，这世上最简单却也最困难的事情。随着社会的发展，婚姻大事不再束缚于封建思想，大多都能由自己做主。
						但是，随着中国生育计划的实施，男女比例越来越不平衡了，现如今，男多女少的问题已经非常明显，在大城市里，
						许许多多的相亲节目兴起，如（非诚勿扰、百里挑一等），在乡镇上，也有很多相亲的人儿，甚至有一些村子，
						基本都是单身汉子。据我了解，在农村，他们拿到的异性资料大部分是来自于媒婆，
						而媒婆手里的异性的资料也是寥寥无几，就那么三五七八。为解决部分乡村的婚姻问题，
						我们决定做一个这样的婚姻交友网站
					</p>
				</div>
				</img>
			</div>
			
		
			<a href="#myCarousel" data-slide="prev" class="carousel-control left">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a href="#myCarousel" data-slide="next" class="carousel-control right">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
</div>



<div id="fl-bigPhotoshow">
	<span class="glyphicon glyphicon-remove fl-bigPhotoshow-closebtn" ></span>
	<img src="" alt="" class="fl-bigPhotoshow-img"/>
</div>

<div id="fl-footer">
	<div class="container text-muted" style="height:50px;color:#000">
		<p style="text-align: center"><a href="">隐私保护</a> | <a href="">联系我们</a> | <a href="">帮助中心</a> | <a href="">交友提示</a> | <a href="">诚征英才</a></p>
		<p style="text-align: center">©2016-2017 缘来是你官方网站All Right Reserved</p>
</div>
</div>

<div id="fl-background-img"></div>
</body>
</html>