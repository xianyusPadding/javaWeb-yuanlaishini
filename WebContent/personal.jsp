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
	<script type="text/javascript" src="js/personal.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/personal.css">
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
				<li><a href="#" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>



<div id="fl-section-cover">
	<div class="container">
		<button class="fl-cover-button btn"><span class="glyphicon glyphicon-open"></span>上传封面</button>
		<!-- <input type="button" value="button"> -->
		<div class="fl-cover-img">
			<img src="images/personalCover.png" alt="">
		</div>
		<div class="fl-cover-float">
			<img src="images/photoalbum1.jpg" class="fl-cover-icon" alt="">
			<p class="fl-cover-id">myID</p>
			<p class="fl-cover-signature">personalSignature</p>
		</div>
	</div>
</div>
<div id="fl-tabs">
	<div class="container" style="background: #eee">
		<ul>
			<li class="fl-tabs-link"><a href="#fl-tab1">个人动态</a></li>
			<li class="fl-tabs-link"><a href="#fl-tab2">我的相册</a></li>
			<li class="fl-tabs-link"><a href="#fl-tab3">管理中心</a></li>
		</ul>
		 <div id="fl-tab1">
			<div id=container>
				<div class="row fl-tab1-publish">
					<h5>有什么新鲜或者记忆深刻的事想告诉大家？</h5>
					<textarea name="" class="fl-tab1-publishMain" cols="30" rows="10"></textarea>
					<ul class="nav nav-pills" style="float:left">
						<li><a href="#"><span class="glyphicon glyphicon-th-large"></span> 表情</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-picture"></span> 图片</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-fire"></span> 话题</a></li>
					</ul>
					<button style="float:right" class="btn btn-default">发表</button>
				</div>

				<div class="row fl-personal-dynamic" style="margin-top: 10px;padding-top:10px;background:#B97A57">
					<div class="row">
						<div class="col-md-1" style="float:left">
							<img src="images/photoalbum1.jpg" style="width:60px;height:60px;border-radius: 50px;" alt="">
						</div>
						<div class="col-md-11" style="float:left">
							<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
						</div>
					</div>
					<div class="row">
						<ul class="nav nav-tabs nav-justified" style="">
							<li style=""><a href="">阅读121</a></li>
							<li><a href="">转发</a></li>
							<li><a href="">评论</a></li>
							<li><a href="">赞</a></li>
						</ul>
					</div>
				</div>

				<div class="row fl-personal-dynamic" style="margin-top: 10px;padding-top:10px;background:#B97A57">
					<div class="row">
						<div class="col-md-1" style="float:left">
							<img src="images/photoalbum1.jpg" style="width:60px;height:60px;border-radius: 50px;" alt="">
						</div>
						<div class="col-md-11" style="float:left">
							<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">#白骨精心得#1012:某新朋问我为什么别人赞我的时候我没什么反应, 答:我已经过了那个阶段,领悟到了人必须有自知之明,人的优秀是相对的,从不同的角度看,用不同的参照物做对比，结果都截然不同,所以无论赞弹,不必太介意,重点是你懂得知道怎样经营自己的工作,生活及快乐,懂得欣赏别人及看到自己的差距。 ​​​​ </p>
						</div>
					</div>
					<div class="row">
						<ul class="nav nav-tabs nav-justified" style="">
							<li style=""><a href="">阅读121</a></li>
							<li><a href="">转发</a></li>
							<li><a href="">评论</a></li>
							<li><a href="">赞</a></li>
						</ul>
					</div>
				</div>
				
				<div class="row fl-personal-dynamic" style="margin-top: 10px;padding-top:10px;background:#B97A57">
					<div class="row">
						<div class="col-md-1" style="float:left">
							<img src="images/photoalbum1.jpg" style="width:60px;height:60px;border-radius: 50px;" alt="">
						</div>
						<div class="col-md-11" style="float:left">
							<h4>myId</h4>
							<p style="font-size: 12px">2016-1-1</p>
							<p style="font-size: 15px">执子之手，与子偕老！</p>
						</div>
					</div>
					<div class="row">
						<ul class="nav nav-tabs nav-justified" style="">
							<li style=""><a href="">阅读121</a></li>
							<li><a href="">转发</a></li>
							<li><a href="">评论</a></li>
							<li><a href="">赞</a></li>
						</ul>
					</div>
				</div>
				
			</div>
			
		</div>
		<div id="fl-tab2">
			<div class="container">
				<div class="row">
					<p>2016.1</p>
					<div class="wrapper" >
						<ul class="thumbs" id="thumbs">
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<p>2016.2</p>
					<div class="wrapper" >
						<ul class="thumbs" id="thumbs">
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<p>2016.3</p>
					<div class="wrapper" >
						<ul class="thumbs" id="thumbs">
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
							<li><img src="images/1.png" alt=""><div></div></li>
							<li><img src="images/2.png" alt=""><div></div></li>
							<li><img src="images/3.png" alt=""><div></div></li>
							<li><img src="images/4.png" alt=""><div></div></li>
							<li><img src="images/5.png" alt=""><div></div></li>
						</ul>
					</div>
				</div>
				
				<!-- <p style="float:left">2016.1</p> -->
				<!-- <div class="wrapper" style="display: block">
					<ul class="thumbs" id="thumbs">
						<li><img src="images/1.png" alt=""><div></div></li>
						<li><img src="images/2.png" alt=""><div></div></li>
						<li><img src="images/3.png" alt=""><div></div></li>
						<li><img src="images/4.png" alt=""><div></div></li>
						<li><img src="images/5.png" alt=""><div></div></li>
						<li><img src="images/1.png" alt=""><div></div></li>
						<li><img src="images/2.png" alt=""><div></div></li>
						<li><img src="images/3.png" alt=""><div></div></li>
						<li><img src="images/4.png" alt=""><div></div></li>
						<li><img src="images/5.png" alt=""><div></div></li>
					</ul>
				</div> -->
			</div>

		</div>
		<div id="fl-tab3">tab3-content</div>
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