<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>缘来是你</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/matching.css">
	<script type="text/javascript" src="js/area.js"></script>
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
		</div>
		
		
		<div class="collapse navbar-collapse" id="navbar-collapse" style="margin-top:-5px">
			<ul class="nav navbar-nav" style="margin: 0px">
				<li class="active b"><a href="index.html" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personal.html" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriend.html" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matching.html" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.html" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>

<div id="fl-main-top" style="margin-top: 58px;">
	<div class="fl-main-select container">
		<div class="row" >	
			<ul class="fl-Select-navbar">
				<li><a href="#" class="btn btn-default">女士</a>
					<ul class="fl-selectNavber2">
						<li>请选择性别：</li>
						<li>
							<select name="" id="">
								<option value="" selected="selected">女士</option>
								<option value="">男士</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">年龄</a>
					<ul class="fl-selectNavber2">
						<li>请选择年龄：</li>
						<li>
							<select name="" id="" class=" fl-select-age" >
								<option>不限</option>
							</select>&nbsp;-
							<select name="" id="" class=" fl-select-age">
								<option>不限</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">地址</a>
					<ul class="fl-selectNavber2">
						<li>请选择地区：</li>
						<li>
							<select id='s_province' name='s_province' ></select>  
						    <select id='s_city' name='s_city' ></select>  
						    <select id='s_county' name='s_county' ></select>
						     <script type='text/javascript'>_init_area();</script>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">身高</a>
					<ul class="fl-selectNavber2">
						<li>请选择身高：</li>
						<li>
							<select name="" id="" class=" fl-select-height">
								<option>不限</option>
							</select>&nbsp;-
							<select name="" id="" class=" fl-select-height">
								<option>不限</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">薪水</a>
					<ul class="fl-selectNavber2">
						<li>请选择薪水：</li>
						<li><input type="text" class="form-control" name="salary" style="width:75px;display: inline;"/>-<input type="text" name="salary" class="form-control" style="width:75px;display: inline;"/></li>
						<li><button class="btn btn-default" style='margin:5px 0 5px 102px;'>确定</button></li>
					</ul>
				</li>
			</ul>
			<div class="input-group fl-navbarLeft-search" style="margin-right:10px">
				<input type="text" class="form-control" placeholder="ID昵称搜索：">
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<button class="btn btn-danger fl-select-btn">搜索</button>
		</div>
	</div>	
</div>

<div id="fl-main-middle">
	<div class="container">
		<div class="wrapper">
			<figure>
				<img src="images/photoalbum1.jpg" alt="" />
				<figcaption>
					<p>Tom</p>
					<p>18岁&nbsp;&nbsp;湛江赤坎&nbsp;&nbsp;180cm</p>
					<p>想找一个活泼开朗的女孩~</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum2.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum4.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum3.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum5.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum6.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum7.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/photoalbum8.jpg" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<!--<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>
			<figure>
				<img src="images/1.png" alt="" />
				<figcaption>
					<p>{information.name}</p>
					<p>{usre.age}&nbsp;&nbsp;{usre.city}{usre.country}&nbsp;&nbsp;{usre.tall}</p>
					<p>{information.motto}</p>
				</figcaption>
			</figure>-->
			
			
			
				
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
<script type="text/javascript">
	var Gid  = document.getElementById ;
	var showArea = function(){
		Gid('show').innerHTML = '<h3>省' + Gid('s_province').value + ' - 市' + 	
		Gid('s_city').value + ' - 县/区' + 
		Gid('s_county').value + '</h3>'
								}
	Gid('s_county').setAttribute('onchange','showArea()');
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-validate.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/matching.js"></script>
</html>