<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="js/makeFriend.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/makeFriend.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="fl-nav">
	<div class="container">
		<div class="navbar-header">
			<a href="#" class="navbar-brand">LOGO缘来是你</a>
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
					<p class="navbar-text navbar-right fl-login"><a href="personal.jsp" class="navbar-link fl-login" >${user.username}</a></p>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<div class="collapse navbar-collapse" id="navbar-collapse" style="margin-top:-5px">
			<ul class="nav navbar-nav" style="margin: 0px">
				<li class="active b"><a href="index.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personal.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriend.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matching.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>



<div style="margin-top:50px;background:#ccc;width:100%;height:40px;">
	<!-- <div class="container">
		<div style="background:#ccc;width:100%;height:40px;">
		</div>	
	</div> -->
</div>


<div id="fl-main" style="height:1500px;margin-top:-6px;">
	<div class="container" style="">
		<div class="row">
			<div class=" fl-navbar-left" style="position: fixed;">
				
					<div class="input-group fl-navbarLeft-search">
						<!-- <span class="input-group-addon glyphicon glyphicon-search"></span> -->
						<input type="text" class="form-control" placeholder="搜索">
					</div>
					<ul class="nav nav-pills nav-stacked" style="margin-top=10px;">
						<li><a href="#"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-star-empty"></span> 我的收藏</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> 我的赞</a></li>
					</ul>
					<p style="margin:30px 0 10px 15px;">分组</p>
					<ul class="fl-navbar-left1 nav nav-pills nav-stacked">
						<li><a href="#">1. 我的好友</a></li>
						<li><a href="#">2. 有好感的人</a></li>
						<li><a href="#">3. 特别收藏</a></li>
						<!--<li><a href=""></a></li>
						<li><a href="">5</a></li>-->
					</ul>
					<button class="btn btn-default" style="margin:20px 0 0 60px;">展开</button>
				
			</div>
			
			<div class="col-md-7 col-md-offset-2" class="fl-center">				
				<div class="row fl-dynamic" style="margin-top:0">
					<div class="col-md-1" style="float:left">
						<img class="fl-dynamic-img" src="images/photoalbum5.jpg" alt=""  />
					</div>
					<div class="col-md-11" style="float:left">
						<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
					</div>
					<ul class="nav nav-tabs nav-justified" style="">
						<li style=""><a href="">阅读121</a></li>
						<li><a href="">转发</a></li>
						<li><a href="">评论</a></li>
						<li><a href="">赞</a></li>
					</ul>
				</div>
				<div class="row fl-dynamic" style="">
					<div class="col-md-1" style="float:left">
						<img class="fl-dynamic-img" src="images/photoalbum5.jpg" alt=""  />
					</div>
					<div class="col-md-11" style="float:left">
						<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
					</div>
					<ul class="nav nav-tabs nav-justified" style="">
						<li style=""><a href="">阅读121</a></li>
						<li><a href="">转发</a></li>
						<li><a href="">评论</a></li>
						<li><a href="">赞</a></li>
					</ul>
				</div>
				<div class="row fl-dynamic" style="">
					<div class="col-md-1" style="float:left">
						<img class="fl-dynamic-img" src="images/photoalbum5.jpg" alt=""  />
					</div>
					<div class="col-md-11" style="float:left">
						<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
					</div>
					<ul class="nav nav-tabs nav-justified" style="">
						<li style=""><a href="">阅读121</a></li>
						<li><a href="">转发</a></li>
						<li><a href="">评论</a></li>
						<li><a href="">赞</a></li>
					</ul>
				</div>
				<div class="row fl-dynamic" style="">
					<div class="col-md-1" style="float:left">
						<img class="fl-dynamic-img" src="images/photoalbum5.jpg" alt=""  />
					</div>
					<div class="col-md-11" style="float:left">
						<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
					</div>
					<ul class="nav nav-tabs nav-justified" style="">
						<li style=""><a href="">阅读121</a></li>
						<li><a href="">转发</a></li>
						<li><a href="">评论</a></li>
						<li><a href="">赞</a></li>
					</ul>
				</div>			
			</div>
			
			<div class="col-md-3">
				<div class="row" style="background:url(images/黑色磨砂.png);margin:0">
					<div class="fl-easy-introduction">
						<img src="images/photoalbum5.jpg" alt="" />
						<h4>myId</h4>
						<p>来自广东茂名化州</p>
						<p>喜欢打篮球，游泳</p>
					</div>
				</div>
				<div class="row fl-desireTree" style="background: #DEDDD8;height:500px;margin:5px 0 0 0">
					<a href=""><img src="images/许愿树.jpg" alt="" style="width: 100%;height: 250px;"/></a>
				</div>
				<div class="row"></div>
			</div>
		</div>		
	</div>
</div>


<div id="fl-footer">
	<div class="container text-muted" style="background:#EF95A8;height:50px;color:#000">
		<p style="text-align: center"><a href="">隐私保护</a> | <a href="">联系我们</a> | <a href="">帮助中心</a> | <a href="">交友提示</a> | <a href="">诚征英才</a></p>
		<p style="text-align: center">©2016-2017 缘来是你官方网站All Right Reserved</p>
</div>
</div>
<div id="fl-background-img"></div>
</body>
</html>