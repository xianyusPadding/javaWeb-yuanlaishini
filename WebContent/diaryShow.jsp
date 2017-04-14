<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<title>缘来是你</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/diaryShow.css">
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

<div id="fl-main">
	<div class="container">
		<div class="row">
		
			<div class="col-md-4 col-sm-4 col-xs-12 fl-right" >
				<div class="col-md-12 fl-center">
					<img src="images/photoalbum1.jpg" alt="" />
					<p class="fl-diary-id">myID</p>
				</div>
				<div class="col-md-12 fl-center" >
					<buttton class="fl-writeDiary-btn btn btn-default" >写日记</buttton>
					<p class="form-control center-block fl-mydiary-title" >我的日记</p>
					<ul>
						<li class="fl-diary-title">haha</li>
					</ul>
				</div>	
			</div>
			
			<div class="col-md-8 col-sm-8 col-xs-12 fl-left" >
				<textarea name="" rows="24" cols="" class="fl-diary-write col-md-12 col-xs-12" placeholder="来写写吧"></textarea>
				<div class="fl-diary" class="col-md-12 col-xs-12" ></div>
			</div>
		</div>
	</div>
</div>

<div id="fl-footer">
	<div class="container text-muted">
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
<script type="text/javascript" src="js/diaryShow.js"></script>
<script>
	var url=window.location.href;
	var str=url.split('?');
	var action=str[1].split('=');
	var id=$('.fl-diary-id');
	var title=$('.fl-diary-title');
	if(action[1]==1){
	id.html("<p>Kingle</p>");
	title.html("<p>1.有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</p>");
	}
	if(action[1]==2){
	id.html("<p>等待漫长岁月</p>");
	title.html("<p>1.缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</p>");
	}
	if(action[1]==3){
	id.html("<p>hikky</p>");
	title.html("<p>1.却不知道后悔还是悲伤，连和你说话都懒得费劲了。婚姻就像是钟钱书先..</p>");
	}
	if(action[1]==4){
	id.html("<p>婷婷</p>");
	title.html("<p>1.对的时间遇到对的人真系好难</p>");
	}
	if(action[1]==5){
	id.html("<p>Kingle</p>");
	title.html("<p>1.有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</p>");
	}
	if(action[1]==6){
	id.html("<p>等待漫长岁月</p>");
	title.html("<p>1.缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</p>");
	}
	if(action[1]==7){
	id.html("<p>hikky</p>");
	title.html("<p>1.却不知道后悔还是悲伤，连和你说话都懒得费劲了。婚姻就像是钟钱书先..</p>");
	}
	if(action[1]==8){
	id.html("<p>婷婷</p>");
	title.html("<p>1.对的时间遇到对的人真系好难</p>");
	}
</script>
</html>