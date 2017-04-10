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
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/46908/58e1f727f629d81290e4c7b4.css' rel='stylesheet' type='text/css' />
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
				<li><a href="indexServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personalServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li class="active"><a href="makeFriendServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matchingServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>




<div id="fl-main" style="margin-top:47px;">
	<div class="container" style="">
		<div class="row">
			<div class="fl-navbar-left">	
				<p style="font-size: 45px;font-family:'GoodVibrationsR9d7d6b9c3189d8';">
					 romantic page
				</p>
					<div class="input-group fl-navbarLeft-search" style="margin:5px">
						<!-- <span class="input-group-addon glyphicon glyphicon-search"></span> -->
						<input type="text" class="form-control" placeholder="搜索">
					</div>
					<ul class="nav nav-pills nav-stacked" style="margin-top=10px;">
						<li><a href="#" ><span class="glyphicon glyphicon-home"></span>  首页</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-star-empty"></span>  我的收藏</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span>  我的赞</a></li>
					</ul>
					<p style="margin:30px 0 10px 15px;">分组</p>
					<ul class="fl-navbar-group nav nav-pills nav-stacked">
						<li class="dropdown"><a href="#" data-toggle="dropdown">1.  我的好友 <span class="glyphicon glyphicon-chevron-down"></span></a>
							<ul class="dropdown-menu" style="background: #DEDDD8;">
								<c:forEach var="fri" items="${userFriend}" >
									<li><a href="otherPersonalServlet?uid=${fri.u_id}">${fri.username }</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="dropdown"><a href="#" data-toggle="dropdown">2.  有好感的人 <span class="glyphicon glyphicon-chevron-down"></span></a>
							<ul class="dropdown-menu" style="background: #DEDDD8;">
								<c:forEach var="f_feel" items="${userFeel}" >
									<li><a href="otherPersonalServlet?uid=${f_feel.u_id}">${f_feel.username }</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="dropdown"><a href="#" data-toggle="dropdown">3.  特别收藏 <span class="glyphicon glyphicon-chevron-down"></span></a>
							<ul class="dropdown-menu" style="background: #DEDDD8;">
								<c:forEach var="f_fcollect" items="${userFcollect}" >
									<li><a href="otherPersonalServlet?uid=${f_fcollect.u_id}">${f_fcollect.username }</a></li>
								</c:forEach>

							</ul>
						</li>
						<li><a href="#">4.  初中同学<span class="glyphicon glyphicon-chevron-down"></span></a></li>
						<li><a href="#">5.  大学同学<span class="glyphicon glyphicon-chevron-down"></span></a></li>
					</ul>
					<button class="fl-group-openBtn btn btn-default" style="margin:20px 0 10px 60px;">展开</button>
					<button class="fl-group-closeBtn btn btn-default" style="margin:20px 0 10px 60px;display:none">收起</button>
				
			</div>
			<div  class="col-md-7 col-md-offset-2 col-sm-9 col-sm-offset-3 col-xs-12" class="fl-center fl-main-middle">		
				<c:forEach var="s" items="${shareList}" varStatus="s_status">
					<div class="row fl-dynamic" style="margin-top:0">
						<div class="row">
							<div class="col-md-1" style="float:left">
								<c:choose>
									<c:when test="${s.user.u_id ==user.u_id}">
										<a href="personalServlet"><img src="${s.user.i_p_url }" class="fl-dynamic-img" alt=""></a>
									</c:when>
									<c:otherwise>
									<a href="otherPersonalServlet?uid=${s.user.u_id }"><img src="${s.user.i_p_url }" class="fl-dynamic-img" alt=""></a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-md-11" style="float:left">
								<h4>${s.user.username }</h4>
								<p style="font-size: 12px">${s.date}</p>
								<p style="font-size: 15px">${s.s_content}</p>
							</div>
						</div>
						<div class="row">
							<ul class="nav nav-tabs nav-justified fl-comment-parent" style="">
								<li style=""><a href="" style="border:none;">阅读(${s.readNum})</a></li>
								<li><a href="">转发</a></li>
								<li class="fl-href-comment"><input type='text' value='${s.s_id }' hidden='hidden'><a href="#1">评论</a></li>
								<li><a href="">赞(${s.startNum})</a></li>
							</ul>
							<div class='fl-comment row' style='display: none;background: #B66F58;'>
								<div class='row' >
									<div class='col-md-1'>
										<img class=''  src='${user.i_p_url }' style='border-radius: 50px;' alt=''/>
									</div>
									<textarea class='col-md-11 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>
									<input type='text' value='${s.s_id }' hidden='hidden'>
								</div>
								<div class='row fl-commentSubmit'>
									<input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' />
								</div>
								<div class='row' >
									<!-- 每一条评论 -->
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-3 hidden-sm hidden-xs">
				<div class="row" style="background:url(images/blackMatte.png);margin:0">
					<div class="fl-easy-introduction">
						<img src="${user.i_p_url }" alt="" />
						<h4>${user.username }</h4>
						<p>来自:${user.province }-${user.city }-${user.country }</p>
						<p>喜欢打篮球，游泳</p>
					</div>
				</div>
				<div class="row fl-desireTree" >
					<a href=""><img src="images/wishingTree.jpg" alt=""/></a>
					<div class="">
						<textarea class="form-control fl-desire-textarea" name="" rows="5" cols="30" placeholder="许愿树留言："></textarea>
						<input type="submit" class="btn btn-default fl-desire-submit" style="" value="留言"/>
					</div>	
				</div>
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