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
	<link rel="stylesheet" href="css/admin.css">
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
			<div class="col-md-2 fl-left" style="">
				<ul class="fl-navbar-ul">
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;公告管理</li>
					<ul class="fl-admin-navbar2">
							<li><a href="#fl-tab1">发表公告</a></li>
							<li><a href="#fl-tab2">删除公告</a></li>
					</ul>
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;会员管理</li>
					<ul class="fl-admin-navbar2">
						<li><a href="#fl-tab3">删除会员</a></li>
						<li><a href="#fl-tab4">职务修改</a></li>
					</ul>
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;动态管理</li>
					<ul class="fl-admin-navbar2">
						<li><a href="#fl-tab5">动态审核</a></li>
						<li><a href="#fl-tab6">删除动态</a></li>
					</ul>
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;日记管理</li>
					<ul class="fl-admin-navbar2">
						<li><a href="#fl-tab7">推送日记</a></li>
						<li><a href="#fl-tab8">删除日记</a></li>
					</ul>
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;型事管理</li>
					<ul class="fl-admin-navbar2">
						<li><a href="#fl-tab9">推送型事</a></li>
						<li><a href="#fl-tab10">删除型事</a></li>
					</ul>
					<li class="fl-admin-navbar"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;线下活动管理</li>
					<ul class="fl-admin-navbar2">
						<li><a href="#fl-tab11">推送活动</a></li>
						<li><a href="#fl-tab12">删除活动</a></li>
					</ul>
				</ul>
			</div>
			
			<div class="col-md-9 col-md-offset-1 fl-right" >
				<div class="fl-tab" style="display: block">
					<textarea name="" rows="10" cols="" placeholder="公告栏：" class="form-control"></textarea>
					<button class="btn btn-default fl-">发布</button>
				</div>
				<div class="fl-tab">
					<h4>公告：</h4>
					<label ><input type="checkbox"  name='' value =''/>公告1</label>
					<label ><input type="checkbox"  name='' value =''/>公告2</label>
					<input type="button" value="加载更多" class="btn btn-default fl-more-btn"/>
					<button class="btn btn-default fl-" >删除</button>
				</div>
				<div class="fl-tab">
					<h4>普通会员：</h4>
					<label ><input type="checkbox"  name='' value =''/>会员1</label>
					<label ><input type="checkbox"  name='' value =''/>会员2</label>
					<button class="btn btn-default fl-">删除</button>
				</div>
				<div class="fl-tab">
					<h4>管理员：</h4>
					<ul>
						<li>jinbiao</li>
						<li>咸鱼</li>
						<li>guanfu</li>
					</ul>
					<input type="text" placeholder="请输入会员id：" class="form-control">
					<button class="btn btn-default">添加</button>
				</div>
				<div class="fl-tab">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="搜索" style="margin-top: 2px;"/>
						<span class="input-group-addon glyphicon glyphicon-search"></span>
					</div>
					<h4>动态：</h4>
					<label ><input type="checkbox"  name='' value =''/>动态1</label>
					<label ><input type="checkbox"  name='' value =''/>动态2</label>
					<label ><input type="checkbox"  name='' value =''/>动态3</label>
					<button class="btn btn-default">通过</button>
				</div>
				<div class="fl-tab">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="搜索" style="margin-top: 2px;"/>
						<span class="input-group-addon glyphicon glyphicon-search"></span>
					</div>
					<h4>动态：</h4>
					<label ><input type="checkbox"  name='' value =''/>动态1</label>
					<label ><input type="checkbox"  name='' value =''/>动态2</label>
					<label ><input type="checkbox"  name='' value =''/>动态3</label>
					<button class="btn btn-default">删除</button>
				</div>
				<div class="fl-tab">
					<input type="text" placeholder="日记名称：" class="form-control"/>
					<button class="btn btn-default fl-">推送</button>
				</div>
				<div class="fl-tab">
					<h4>首页日记：</h4>
					<label ><input type="checkbox"  name='' value =''/>日记1</label>
					<label ><input type="checkbox"  name='' value =''/>日记2</label>
					<button class="btn btn-default">删除</button>
				</div>
				<div class="fl-tab">
					<input type="text" placeholder="型事名称：" class="form-control"/>
					<textarea name="" rows="10" cols="" placeholder="型事追击：" class="form-control"></textarea>
					<button class="btn btn-default fl-">推送</button>
				</div>
				<div class="fl-tab">
					<h4>首页型事：</h4>
					<label ><input type="checkbox"  name='' value =''/>型事1</label>
					<label ><input type="checkbox"  name='' value =''/>型事2</label>
					<button class="btn btn-default">删除</button>
				</div>
				<div class="fl-tab">
					<input type="text" placeholder="活动名称：" class="form-control"/>
					<textarea name="" rows="10" cols="" placeholder="线下活动：" class="form-control"></textarea>
					<button class="btn btn-default fl-">推送</button>
				</div>
				<div class="fl-tab">
					<h4>首页活动：</h4>
					<label ><input type="checkbox"  name='' value =''/>活动1</label>
					<label ><input type="checkbox"  name='' value =''/>活动2</label>
					<button class="btn btn-default">删除</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="fl-footer">
	<div class="container text-muted">
		<p style="text-align: center"><a href="#">隐私保护</a> | <a href="#">联系我们</a> | <a href="#">帮助中心</a> | <a href="#">交友提示</a> | <a href="#">诚征英才</a></p>
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
<script type="text/javascript" src="js/admin.js"></script>
</html>