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
			<c:choose>
				<c:when test="${user==null }">
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

<div id="fl-main">
	<div class="container">
		<div class="row">
			<input id='SelectGp' type="text" value="${diary.dg_id }"  hidden="hidden"/>
			<input type="text" value="${index }" hidden="hidden" id='diarySelectID'>
			<div class="fl-right col-md-4 col-sm-4 col-xs-12">
				<div class="col-md-12 fl-center">
					<img src='<c:out value="${diary.user.i_p_url}"></c:out>' alt='' />
					<p><c:out value="${diary.user.username}"></c:out></p>
				</div>
				<div class="col-md-12 fl-center fl-diary-title" >
				<input id='uid' type="text" value="${diary.user.u_id }" hidden="hidden" />
					<select name="" id="fl-diary-select" class="btn btn-default" autocomplete="off">
						<option value="0" selected="selected">默认日记</option>
						<c:forEach  var="dg" items="${dg_list}">
									<option value="${dg.dg_id }">${dg.dg_title }</option>
						</c:forEach>
					</select>
					<ul>
						<c:forEach var="diary"  items="${diaryList }">
							<li class='fl-diaryTitle'><a href="#">${diary.s_title }</a></li>
						</c:forEach>
						<!-- <li class='fl-diaryTitle'><a href="#">1.有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</a></li>
						<li class='fl-diaryTitle'><a href="#">2.缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</a></li> -->
					</ul>
				</div>
			</div>
			<div class="fl-left col-md-8 col-sm-8 col-xs-12" style="padding:0">				
				<div class="fl-diary" class="col-md-12 col-xs-12">
					<c:forEach var="diary"  items="${diaryList }">
							<div class="fl-diary-tab">
								<h4 class="fl-center">${diary.s_title }</h4>
								<p>${diary.s_content }</p>
							</div>
					</c:forEach>
				</div>				
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

<div id="fl-add-group">
	<input type="text" class="fl-addGroup-title form-control " placeholder="请输入分组名称："/>
	<button class="btn btn-default fl-addGroup-okBtn" style="">确定</button>
</div>
<div id="fl-del-group">
	<input type="text" class="fl-delGroup-title form-control " placeholder="请输入分组名称："/>
	<button class="btn btn-default fl-delGroup-okBtn" style="">确定</button>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-validate.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/diaryShow.js"></script>
</html>