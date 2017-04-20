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
	<script type="text/javascript" src="js/fashionInfo.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/personal.css">
	<link rel="stylesheet" href="css/fashionInfo.css">
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

<div id='fl-main' >
	<div class="container">
		<div class="row" style="border:1px solid #ccc">
			<p class="col-md-12 fl-navbar">
				<a href="indexServlet" ><span class="glyphicon glyphicon-home"></span><span class="glyphicon glyphicon-chevron-right"></span>首页</a>
				<span class="glyphicon glyphicon-chevron-right" ></span>型事追击
			</p>
			<div class="col-md-12" style='border-bottom: 1px solid #ccc;background: #fff;'>
				<h3 class="fl-center" style='font-size: 28px;'>title</h3>
				<ul class="fl-contentAbo-navbar">
					<li>2014-5-10 15:10</li>
					<li>发布者：jinbiao</li>
					<li>作者：tom</li>
					<li>阅读：101</li>
				</ul>
			</div>	
			<div class="col-md-12 fl-content"  style='border-bottom: 1px solid #ccc;height:650px'>
				<!--<img src="images/1.png" alt="" />-->
				<p>11111111111111111111111111111111111111111111111</p>
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