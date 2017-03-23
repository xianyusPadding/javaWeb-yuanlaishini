<%@page contentType="text/html;charset=UTF-8"%>     
<%@page pageEncoding="UTF-8"%>  
<%request.setCharacterEncoding("UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta content= "text/html; charset=UTF-8 ">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<title>缘来是你</title>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery-validate.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/index.css">
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
					<p class="navbar-text navbar-right fl-login" style="margin-right: 5px;"><a href="#" class="navbar-link" id="fl-register">注册</a></p>
					<p class="navbar-text navbar-right fl-login"><a href="#" class="navbar-link fl-login" id="fl-login">登录</a></p>
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

<form id="fl-registerreg" action="regisiterServlet" method="post">
	<p  class="myerror"></p>
	<p>
		<label for="username">昵称：</label>
		<input type="text" name="username" class="text" id="username" placeholder="请输入用户名，不少于2位：">
		<span class="star">*</span>
		<p class="myerror"></p>
	</p>
	<p>
		<label for="fl-user">账号：</label>
		<input type="text" name="user" class="text" id="fl-user" placeholder="请输入用户账号，不少于3位：">
		<span class="star">*</span>
		<p class="myerror"></p>
	</p>
	<p>
		<label for="fl-pass">密码：</label>
		<input type=password name="pass" class="text" id="fl-pass" placeholder="请输入密码，不少于8位：">
		<span class="star">*</span>
		<p class="myerror"></p>
	</p>
	<p>
		<label for="fl-password">确认：</label>
		<input type="password" name="password" class="text" id="fl-password" placeholder="请再次输入密码，不少于8位：">
		<span class="star">*</span>
		<p class="myerror"></p>
	</p>
	<p>
		<label for="fl-email">邮箱：</label>
		<input type="text" name="email" class="text" id="fl-email" placeholder="请输入正确邮箱地址：">
		<span class="star">*</span>
		<p class="myerror"></p>
	</p>
	<p>
		<label>性别：</label>
		<input type="radio" value="fl-male" name="sex" id="fl-male" checked="checked"><label for="fl-male">男</label>
		<input type="radio" value="fl-female" name="sex" id="fl-female"><label for="fl-female">女</label>
	</p>
	<!-- <p>
		<label for="fl-birthday">生日：</label>
		<input type="text" name="birthday" class="select" id="fl-birthday">
	</p> -->
</form>

<form id="fl-loginreg" action="loginServlet" method="post">
	<!-- <p  class="myerror"></p> -->
	<p>
		<label for="fl-user">账号：</label>
		<input type="text" name="user" class="text" id="fl-user" placeholder="请输入用户账号，不少于3位：">
		<span class="star">*</span>
	</p>
	<p>
		<label for="fl-pass">密码：</label>
		<input type="password" name="pass" class="text" id="fl-pass" placeholder="请输入密码，不少于8位：">
		<span class="star">*</span>
	</p>
</form>

<div id="myCarousel" class="carousel slide container" data-ride="carousel"> <!-- data-ride="carousel"自动播放 -->
	<ol class="carousel-indicators">
		<li class="active" data-target="#myCarousel" data-slide-to="0" style="opacity: 0.4"></li>
		<li data-target="#myCarousel" data-slide-to="1" style="opacity: 0.4"></li>
		<li data-target="#myCarousel" data-slide-to="2" style="opacity: 0.4"></li> <!--轮播器的3个小按钮-->
	</ol>
	<div class="carousel-inner">
		<div class="item active"><img src="images/slide1.png" alt=""></div> <!-- item隐藏图片 -->
		<div class="item"><img src="images/slide2.png" alt=""></div>
		<div class="item"><img src="images/slide3.jpg" alt=""></div>
	</div>
	<a href="#myCarousel" data-slide="prev" class="carousel-control left">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	<a href="#myCarousel" data-slide="next" class="carousel-control right">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>

<div id="fl-main">
	<div class="container">
		<div class="photoalbum">
			<p style="margin:20px 15px 0 15px">会员相册ALBUL<a href="">MORE</a></p>
		</div>
		<div class="row" style="background: #fff">
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
			<div class="col-md-1 col-sm-2 col-xs-3 hidden-xs  hidden-sm">
				<div class="thumbnail fl-thumbnail">
					<a href=""><img src="images/photoalbum1.jpg" alt=""></a>
				</div>
			</div>
		</div>
		<!-- <div class="row" style="background: #fff;">
			

		</div> -->
		<div class="row" style="background: #eee;">
			<div class="col-md-6" style="height: 500px">
				<div>
					<p style="border-bottom:2px solid #EF95A8;margin-top:20px">会员日记</p>
					<div class="fl-diary-main">内容
						
					</div>
				</div>
			</div>
			<div class="col-md-6" style="height: 500px">
				<div>
					<p style="border-bottom:2px solid #EF95A8;margin-top:20px">型事追击</p>
					<div class="fl-followUp-main">内容</div>
				</div>
			</div>
		</div>
		<div class="fl-activity" style="height:300px;">			
			<p style="border-bottom:2px solid #EF95A8;margin-top:20px">线下活动</p>
			<div class="fl-activity-main">
				<!-- <input type="button" id="fl-button" value="123"> -->
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
</html>