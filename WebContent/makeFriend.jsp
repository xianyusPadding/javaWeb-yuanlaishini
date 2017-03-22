<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<%if(session.getAttribute("username")==null){ 
				out.print("<script type='text/javascript'>alert('请先登录!');location.href='index.jsp';</script>"); 
			} else{ %>
			<p class="navbar-text navbar-right fl-login"><a href="logoutServlet" class="navbar-link fl-login" >注销</a></p>
			<p class="navbar-text navbar-right fl-login"><a href="personal.jsp" class="navbar-link fl-login" >${username}</a></p>
			<%} %>
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


<div id="fl-main" style="height:1500px;margin-top:-6px">
	<div class="container" style="">
		<div class="row">
			<div class="col-md-2 col-sm-4 fl-navbar-left">
				<div>
					<div class="input-group fl-navbarLeft-search">
						<!-- <span class="input-group-addon glyphicon glyphicon-search"></span> -->
						<input type="text" class="form-control" placeholder="搜索">
					</div>
					<ul class="nav nav-pills nav-stacked" style="margin-top=10px;">
						<li><a href="#"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-star-empty"></span> 我的收藏</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> 我的赞</a></li>
					</ul>
					<p style="margin:30px 0 10px 15px">分组</p>
					<ul class="fl-navbar-left1 nav nav-pills nav-stacked">
						<li><a href="#">1. 我的好友</a><span class="glyphicon glyphicon-triangle-right"></span></li>
						<li><a href="#">2. 我喜欢的人</a><span class="glyphicon glyphicon-triangle-right"></span></li>
						<li><a href="#">3. 闺蜜</a><span class="glyphicon glyphicon-triangle-right"></span></li>
						<!--<li><a href=""></a></li>
						<li><a href="">5</a></li>-->
					</ul>
					<button class="btn btn-default" style="margin:20px 0 0 60px;">展开</button>
				</div>
			</div>
			
			<div class="col-md-7 col-sm-8">
				<div class="row" style="margin-top:0">
					<div class="fl-share">
						<div class="fl-share-publish" style="height:300px">
							<h5 style="">小分享，大快乐，来一起分享你的故事吧！</h5>
							<textarea name="" class="fl-share-publishMain" cols="30" rows="10"></textarea>
							<ul class="nav nav-pills" style="float:left">
								<li><a href="#"><span class="glyphicon glyphicon-th-large"></span> 表情</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-picture"></span> 图片</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-fire"></span> 话题</a></li>
							</ul>
							<button style="float:right" class="btn btn-default">发表</button>
						</div>
					</div>				
				</div>
				<div class="row" style="height:300px;background: #eee;">
					<div class="fl-trends">					
					</div>
				</div>
				<div class="row" style="height:300px;background: #eee;">
					
				</div>
				<div class="row" style="height:300px;background: #eee;">
					
				</div>		
				<div class="row" style="height:300px;background: #eee;">
					
				</div>		
							
				
			</div>
			
			<div class="col-md-3">
				<div class="row" style="background: #DEDDD8;height:300px;margin:0">
					个人资料 头像 简介
				</div>
				<div class="row" style="background: #DEDDD8;height:500px;margin:5px 0 0 0">
					许愿树 可匿名发布
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