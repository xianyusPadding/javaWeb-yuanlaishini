<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>缘来是你</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/briefIntro.css">
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/35481/58e9f103f629d811b8f741b0.css' rel='stylesheet' type='text/css' />
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/47019/58e9f355f629d811b8f741b8.css' rel='stylesheet' type='text/css' />
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/46614/58eb444ff629d817a412b491.css' rel='stylesheet' type='text/css' />
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
				<li class="active"><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>

<div id='fl-main'>
	<div class="container">
		<div class="row">
			<h1 class="fl-title font1">Business introduce</h1>
		</div>
		<div class="row">
			<div class="col-md-6  fl-serve">
				<div class="fl-serve-main">
					<img class="fl-smallPerson-icon" src="images/smallPeosonIcon.png" alt=""/>
					<h2 class="fl-serve-title font3">公司服务</h2>
					<ul>
						<li><a href="#">1、本站提供网上交友平台，可供各位friend交友互动</a></li>
						<li><a href="#">2、提供情感社区，日记分享，聊天室，来互相倾诉</a></li>
						<li><a href="#">3、每月定期举行线下活动</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-6 fl-future ">
				<div class="fl-future-main">
					<h2 class="fl-future-title font3">公司理念</h2>
					<ul>
						<li><a href="#">1、基于交友，立足婚姻，旨在做得更好</a></li>
						<li><a href="#">2、希望更多的朋友在这里可以找到属于自己的另一半</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row fl-about">
			<div class="fl-about-main">
				<h2 class="fl-about-title font3">关于公司</h2>
				<ul>
					<li><a href="#">1、工作邮箱：820728252@qq.com</a></li>
					<li><a href="#">2、工作室：缘来是你</a></li>
					<li><a href="#">3、情感FAQ</a></li>
					<li><a href="#">4、合作伙伴：腾讯qq、一些事一些情、珍爱网、新浪微博</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="fl-footer">
	<div class="container text-muted" style="height:50px;color:#000">
		<p style="text-align: center"><a href="">隐私保护</a> | <a href="">联系我们</a> | <a href="">帮助中心</a> | <a href="">交友提示</a> | <a href="">诚征英才</a></p>
		<p style="text-align: center">©2016-2017 缘来是你官方网站All Right Reserved</p>
</div>
</div>
<div id="fl-background-img"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-validate.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/briefIntro.js"></script>
</html>