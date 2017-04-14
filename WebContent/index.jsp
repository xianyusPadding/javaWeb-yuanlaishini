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
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/47019/58e9f355f629d811b8f741b8.css' rel='stylesheet' type='text/css' />
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
				<li class="active"><a href="indexServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personalServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriendServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matchingServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
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
		<input  type="password" name="pass" class="text" id="fl-pass" placeholder="请输入密码，不少于8位：">
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
		<input type="radio" value="男" name="sex" id="fl-male" checked="checked"><label for="fl-male">男</label>
		<input type="radio" value="女" name="sex" id="fl-female"><label for="fl-female">女</label>
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
		<input type="password" id='fl-pass-keydown' name="pass" class="text" id="fl-pass" placeholder="请输入密码，不少于8位：">
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
			<p class="font1" style="margin:20px 15px 0 15px">会员相册ALBUL<a href="">MORE</a></p>
		</div>
		<div class="row" style="background: #fff">
		<c:forEach var="Iuser" items="${indexUserList}" varStatus="s_status">
				<div class="col-md-1 col-sm-2 col-xs-3">
					<div class="thumbnail fl-thumbnail" >
						<a href="otherPersonalServlet?uid=${Iuser.u_id }"><img src="${Iuser.i_p_url }" alt="" style="height: 60px;"></a>
					</div>
				</div>
		</c:forEach>
			
		</div>
		<div class="row" style="background: #fff;">
			<div class="col-md-6" >
				<div>
					<p class="font1" style="border-bottom:2px solid #EF95A8;margin-top:20px">会员日记&nbsp;DIARY</p>
					<div class="fl-diary-main">
						<div class="row">
							<div class="col-md-6" style="position: relative;">
								<h5>Kingle</h5>
								<p><a href="diaryShow.jsp?action=1">有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</a></p>
							</div>
							<div class="col-md-6 ">
								<h5>等待漫长岁月</h5>
								<p><a href="diaryShow.jsp?action=2">缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</a></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<h5>hikky<h5>
								<p><a href="diaryShow.jsp?action=3">却不知道后悔还是悲伤，连和你说话都懒得费劲了。婚姻就像是钟钱书先...</a></p>
							</div>
							<div class="col-md-6">
								<h5>婷婷</h5>
								<p><a href="diaryShow.jsp?action=4">对的时间遇到对的人真系好难</a></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<h5>Kingle</h5>
								<p><a href="diaryShow.jsp?action=5">有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难</a></p>
							</div>
							<div class="col-md-6">
								<h5>等待漫长岁月</h5>
								<p><a href="diaryShow.jsp?action=6">缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</a></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<h5>hikky<h5>
								<p><a href="diaryShow.jsp?action=7">却不知道后悔还是悲伤，连和你说话都懒得费劲了。婚姻就像是钟钱书先...</a></p>
							</div>
							<div class="col-md-6">
								<h5>婷婷</h5>
								<p><a href="diaryShow.jsp?action=8">对的时间遇到对的人真系好难</a></p>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-6" >
				<div>
					<p class="font1" style="border-bottom:2px solid #EF95A8;margin-top:20px">型事追击&nbsp;FASHION INFO</p>
					<div class="fl-followUp-main">
						<ul>
							<li>回头可以测测你的女朋友！女生真爱你都有这些表现！</li>
							<li>男生看准了！男人收复女人的绝招有这些！</li>
							<li>如何判断一个TA的不仅走肾，而且还走心？</li>
							<li>追女生失败？一定是你的追求方式不对！</li>
							<li>如何判断一个男生是真心还是套路？准爆！</li>
							<li>你们知道吗？女生们往往都喜欢找这样的男生结</li>
							<li>婚前真的适合同居吗？</li>
							<li>看完大写的服！女人收服男人的绝招有这些！</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="fl-activity">
			<p class="fl-activity-title font1">线下活动&nbsp;OFF-LINE ACTIVITY</p>
			<div class="fl-activity-main">
				<ul class="row">
					<li class="col-md-6">
						<figure>
							<img src="images/activity1.jpg" alt="" />
							<figcaption>
								<h5>vo1.林尘街道宵夜，唱k一条龙</h5>
								<p>时间：2016年3月</p>
							</figcaption>
						</figure>
					</li>
					<li class="col-md-6">
						<figure>
							<img src="images/activity2.jpg" alt="" />
							<figcaption>
								<h5>vo2.相识愚人前</h5>
								<p>时间：2016年4月</p>
							</figcaption>
						</figure>
					</li>
					<li class="col-md-6">
						<figure>
							<img src="images/activity3.jpg" alt="" />
							<figcaption>
								<h5>vo3.环保男女沙滩派对</h5>
								<p>时间：2016年7月</p>
							</figcaption>
						</figure>						
					</li>
					<li class="col-md-6">
						<figure>
							<img src="images/activity4.png" alt="" />
							<figcaption>
								<h5>vo4.脱光送温暖</h5>
								<p>时间：2016年7月</p>
							</figcaption>
						</figure>
					</li>
					<li class="col-md-6">
						<figure>
							<img src="images/activity5.jpg" alt="" />
							<figcaption>
								<h5>vo5.圣诞party</h5>
								<p>时间：2016年12月</p>
							</figcaption>
						</figure>					
					</li>
					<li class="col-md-6">
						<figure>
							<img src="images/activity5.jpg" alt="" />
							<figcaption>
								<h5>vo6.圣诞party</h5>
								<p>时间：2017年12月</p>
							</figcaption>
						</figure>
					</li>
				</ul>
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