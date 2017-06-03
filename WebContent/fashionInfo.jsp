<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
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
	<script type="text/javascript" src="js/personal.js"></script>
	<script type="text/javascript" src="js/area.js"></script>
	<script type="text/javascript" src="js/fashionInfo.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/personal.css">
	<link rel="stylesheet" href="css/fashionInfo.css">
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
					<c:out value="<script type='text/javascript'>alert('请先登录!');location.href='index.jsp';</script>" escapeXml="false"></c:out>
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

<div id='fl-main' >
	<div class="container">
		<div class="row" style="border:1px solid #ccc">
			<p class="col-md-12 fl-navbar">
				<a href="indexServlet" ><span class="glyphicon glyphicon-home"></span><span class="glyphicon glyphicon-chevron-right"></span>首页</a>
				<span class="glyphicon glyphicon-chevron-right" ></span>型事追击
			</p>
			<div class="col-md-12" style='border-bottom: 1px solid #ccc;background: #fff;'>
				<h3 class="fl-center" style='font-size: 28px;'>回头可以测测你的女朋友！女生真爱你都有这些表现！</h3>
				<ul class="fl-contentAbo-navbar">
					<li>2014-5-10 15:10</li>
					<li>发布者：jinbiao</li>
					<li>作者：tom</li>
					<li>阅读：101</li>
				</ul>
			</div>	
			<div class="col-md-12 fl-content"  style='border-bottom: 1px solid #ccc;height:650px'>
				<!--<img src="images/1.png" alt="" />-->
				<p>三月，醉一场青春的流年。慢步在三月的春光里，走走停停，看花开嫣然，看春雨绵绵，感受春风拂面，春天，就是青春的流年。青春，是人生中最美的风景。青春，是一场花开的遇见；青春，是一场痛并快乐着的旅行；青春，是一场轰轰烈烈的比赛；青春，是一场鲜衣奴马的争荣岁月；青春，是一场风花雪月的光阴。
 
　　青春往事，多么甜蜜；青春岁月，多么靓丽；青春流年，如火如荼。青春里，我们向着梦想前进。跌倒过，伤心过，快乐过，痛苦过，孤独过，彷徨过，迷茫过。总是，在悠悠的岁月中徘徊；总是，在如春的生命中成长；总是，在季节的交替中感悟人生四季的美妙与韵律；总是，在多愁善感中体悟青春的美好与无奈。
 
　　三月的鲜花，一树树，一束束，一簇簇，而青春，就是像三月的鲜花一样美丽迷人，生机盎然，姹紫嫣红，生机勃勃。三月，是青春里最美最温暖的风景。三月的美，就像青春的美，充满活力，充满生机，充满昂扬的斗志。三月的美，就像青春的花季，在那里我们可以感受青春的跳动与感动，感受青春的曼妙与奇妙；感受青春的悸动与心跳。
 
　　青春，如三月的春光，安暖向阳。在美丽的青春年华，我们手牵手，肩并肩，跨过岁月山河，跨过锦瑟流年，跨过天涯海角，在三月的春光里沐浴金色的光泽。三月的春光，让青春的我们看到希望，看到自己有一颗年轻跳动的心，看到蓝天白云，看到明媚的灿烂。三月的春光，温暖无比，就像我们的青春，有着长辈的呵护，有着老师的循循教导，它们就像春光，照耀着我们年轻的心。
 
　　青春，如三月的春雨，我们在春雨中得到滋润。春雨，淅淅沥沥，纷纷扬扬，打在青春的雨季，打在我们心里，打在我们的生活里，打在我们的生命中，打在我们的灵魂深处。一场春雨，滋润着我们的青春流年，让我们快乐成长，让我们如沐春雨，让我们感受亲恩。三月的春雨，就像我们的父母，用他们的爱心，滋润着我们幼小不安的心灵。
 
　　青春，如三月的春风，我们沐浴在春风里。三月的春风，是我们的朋友，是我们的同窗，是陪伴我们成长的玩伴。因为有了春风，我们感受到友谊的温暖；因为有了春风，我们不再寂寞；因为有了春风，我们总在需要帮助的时候，有他们伸出援助之手。春风，是那样感情丰富，温婉细腻。在春风里，我们跳着，唱着，欢呼着，只因为这如春风的情谊。
 
　　青春，如三月的春花，我们陶醉在春花里。三月的春花，是我们的初恋。花开半夏，岁月静好，浅笑安然。三月春花，有着不同的颜色，不同的形状，不同的意向。那水灵灵的粉红的桃花，恋着春风，恋着春雨； 那纯白娇小的茉莉，散发着淡淡的清香；那深红的杜鹃，像燃烧着红色的火焰。初恋，是一种颜色鲜艳的花朵；初恋，是一种幽幽的馨香；初恋，是一种岁月的沉淀。
 
　　青春，是三月的风景，美到极致。我们，在三月的春雨中奔跑嬉戏，在春风中感受它的温润，在春光里感受暖暖的温度，在春花里享醉人的芬芳。三月的风景，陪我们一路向梦想的地方进发；三月的风景，让我们路上不再孤独，不再迷茫，不再彷徨；三月的风景，让我们的青春更加色彩斑斓，鸟语花香。
 
　　三月，醉一场青春的流年。我们珍惜三月，就像我们珍惜来之不易的幸福青春。三月的雨，三月的风，三月的春光，三月的花香，让我们沉醉不知归路，兴尽晚回舟。在这样一场盛大而清新的流年，我们懂得，青春是一种一去不复返的风景，应当好好保护；青春是一种美丽而活跃的热情，我们必须耐心保持；青春是一种来之不易的懂得，我们必须细心呵护。
 
　　三月，醉一场青春的流年。风过无痕，花开向暖。无论是哪一年的三月，都是青春是里最美丽的花朵，都是青春里最难舍的风景，都是青春里最妩媚的清香。无论在哪一年的三月，无论我们有没有老去，心中的青春千万不能割舍，心中的青春永远跳动着快乐，心中的青春永远伴随我们一生一世。
 
　　三月，醉一场青春的流年。人生的三月，我们正值青春，风华正茂。在这样一个充满活力的年纪，我们要把握机遇，朝人生的巅峰冲刺；我们要珍惜每一个让我们流连忘返的风景，保持年青的心态，随时准备着与时间赛跑；我们要在时光深处，保持一种淡然而洒脱，矜持而深情的微笑，让三月的风景陪我们笑语盈盈，清芬一路。</p>
		</div>
	</div>
</div>



<div id="fl-bigPhotoshow">
	<span class="glyphicon glyphicon-remove fl-bigPhotoshow-closebtn" ></span>
	<img src="" alt="" class="fl-bigPhotoshow-img"/>
</div>

<div id="fl-footer">
	<div class="container text-muted" style="height:50px;color:#000">
		<p style="text-align: center"><a href="">隐私保护</a> | <a href="">联系我们</a> | <a href="">帮助中心</a> | <a href="">交友提示</a> | <a href="">诚征英才</a></p>
		<p style="text-align: center">©2016-2017 缘来是你官方网站All Right Reserved</p>
</div>
</div>

<div id="fl-background-img"></div>
</body>
</html>