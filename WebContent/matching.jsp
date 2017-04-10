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
				<li class="active b"><a href="index.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="personalServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriendServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matchingServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>

<div id="fl-main-top" style="margin-top: 58px;">
	<div class="fl-main-select container">
	<form action="matchingSearcHServlet" method="post">
		<div class="row" >	
			<ul class="fl-Select-navbar">
				<li><a href="#" class="btn btn-default">全部</a>
					<ul class="fl-selectNavber2">
						<li>请选择性别：</li>
						<li>
							<select name="sex" id="">
								<option value="">全部</option>
								<option value="女">女士</option>
								<option value="男">男士</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">年龄</a>
					<ul class="fl-selectNavber2">
						<li>请选择年龄：</li>
						<li>
							<select name="age" id="" class=" fl-select-age" >
								<option value="">不限</option>
							</select>&nbsp;-
							<select name="ageEnd" id="" class=" fl-select-ageEnd">
								<option value="">不限</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">地址</a>
					<ul class="fl-selectNavber2">
						<li>请选择地区：</li>
						<li>
							<select id='s_province' name='province' ></select>  
						    <select id='s_city' name='city' ></select>  
						    <select id='s_county' name='county' ></select>
						     <script type='text/javascript'>_init_area();</script>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">身高</a>
					<ul class="fl-selectNavber2">
						<li>请选择身高：</li>
						<li>
							<select name="height" id="" class=" fl-select-height">
								<option value="">不限</option>
							</select>&nbsp;-
							<select name="heightEnd" id="" class=" fl-select-heightEnd">
								<option value="">不限</option>
							</select>
						</li>
					</ul>
				</li>
				<li><a href="#" class="btn btn-default">薪水</a>
					<ul class="fl-selectNavber2">
						<li>请选择薪水：</li>
						<li><input type="text" class="form-control" name="salary" style="width:75px;display: inline;"/>-<input type="text" name="salaryEnd" class="form-control" style="width:75px;display: inline;"/></li>
						<li><button class="btn btn-default" style='margin:5px 0 5px 102px;'>确定</button></li>
					</ul>
				</li>
			</ul>
			<div class="input-group fl-navbarLeft-search" style="margin-right:10px">
				<input type="text" name="uid" class="form-control" placeholder="ID昵称搜索：">
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<!-- <button class="btn btn-danger fl-select-btn">搜索</button> -->
			<input class="btn btn-danger fl-select-btn" type="submit" value="搜索">
		</div>
	</form>
	</div>	
</div>

<div id="fl-main-middle">
	<div class="container">
		<div class="wrapper">
		<c:forEach var="user" items="${userList}" >
			<figure>
			<a href="otherPersonalServlet?uid=${user.u_id }"><img src="${user.i_p_url }" alt="" /></a>
				<figcaption>
					<p>${user.username}</p>
					<p>${user.age}岁&nbsp;&nbsp;</p>
					<p>${user.province }&nbsp;${user.city }&nbsp;${user.country }&nbsp;&nbsp;</p>
					<p>${user.information.height}cm</p>
					<p>${user.information.motto}</p>
				</figcaption>
				
			</figure>
		
		</c:forEach>
				<!-- <figure>
			<a href="otherPersonalServlet?uid=2014354131"><img src="./upload/g3.png" alt="" /></a>
				<figcaption>
					<p>一缕春风</p>
					<p>27岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;阳江市&nbsp;阳东县&nbsp;&nbsp;</p>
					<p>172cm</p>
					<p>想把我唱给你听...</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=2014354124"><img src="./upload/b1.png" alt="" /></a>
				<figcaption>
					<p>鲁班</p>
					<p>24岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;茂名市&nbsp;信宜市&nbsp;&nbsp;</p>
					<p>170cm</p>
					<p>唱一半的歌、剩下的一半由你来唱。</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=841583911"><img src="./upload/g1.png" alt="" /></a>
				<figcaption>
					<p>阿智</p>
					<p>22岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;阳江市&nbsp;阳东县&nbsp;&nbsp;</p>
					<p>165cm</p>
					<p>茉莉花香...</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=2014354130"><img src="./upload/b2.png" alt="" /></a>
				<figcaption>
					<p>夜夜笙歌</p>
					<p>25岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;茂名市&nbsp;信宜市&nbsp;&nbsp;</p>
					<p>168cm</p>
					<p>想找个温柔，顾家的女孩...</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=daji123456"><img src="./upload/g2.png" alt="" /></a>
				<figcaption>
					<p>妲己</p>
					<p>24岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;阳江市&nbsp;阳东县&nbsp;&nbsp;</p>
					<p>165cm</p>
					<p>  </p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=xueer"><img src="./upload/photoalbum4.jpg" alt="" /></a>
				<figcaption>
					<p>雪儿</p>
					<p>24岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;广州市&nbsp;越秀区&nbsp;&nbsp;</p>
					<p>166cm</p>
					<p>想找个稳重，成熟的男生...</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=841583918"><img src="./upload/photoalbum3.jpg" alt="" /></a>
				<figcaption>
					<p>鹹魚_一車事一車情 </p>
					<p>0岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;茂名市&nbsp;信宜市&nbsp;&nbsp;</p>
					<p>175cm</p>
					<p>ideal  一些事一些情、樂觀自信愛</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=xianyu"><img src="./upload/photoalbum7.jpg" alt="" /></a>
				<figcaption>
					<p>咸鱼</p>
					<p>19岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;广州市&nbsp;越秀区&nbsp;&nbsp;</p>
					<p>184cm</p>
					<p>如果我只是个单纯的过客，为何要让我闯入你的生活？</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=feilong"><img src="./upload/photoalbum8.jpg" alt="" /></a>
				<figcaption>
					<p>飞龙</p>
					<p>22岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;茂名市&nbsp;信宜市&nbsp;&nbsp;</p>
					<p>175cm</p>
					<p>其实莪一直都在，看着妳不变旳动态。</p>
				</figcaption>
				
			</figure>
		
		
			<figure>
			<a href="otherPersonalServlet?uid=minmin"><img src="./upload/photoalbum2.jpg" alt="" /></a>
				<figcaption>
					<p>敏敏</p>
					<p>23岁&nbsp;&nbsp;</p>
					<p>广东省&nbsp;茂名市&nbsp;化州市&nbsp;&nbsp;</p>
					<p>155cm</p>
					<p>学会做个彪悍的姑娘 不矫揉不造作不发嗲不懦弱 怎么骄傲怎么活.</p>
				</figcaption>
				
			</figure> -->
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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-validate.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/matching.js"></script>
</html>