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
			<p class="fl-cover-id"><c:out value="${user.username}"></c:out></p> 
			<p class="fl-cover-signature">人没有了梦想，就和飞龙一样...</p>
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
		<div id="fl-tab2" style="padding:0 0 60px 0">
			<div class="container" >
				<div class="row" style="margin-left:10px">
					<button class="btn btn-default fl-photoalbum-btn" style="margin-bottom:20px"><a href="#">创建相册</a></button>
					<button class="btn btn-default fl-uploadPhoto-btn" style="margin-bottom:20px"><a href="#">上传相片</a></button>
				</div>
				<div class="row">
				<!-- 相册封面 -->
				<c:if test="${a_size==0 }">
								<div class="col-md-3 fl-textcenter" style="display:inline-block">
									<p>创建你的相册</p><img src="images/4.png" alt="" class="fl-photoAlbum-none">
								</div>
				</c:if>
				<%!  int i=0; %>
					<c:forEach var="a" items="${a_list}" varStatus="a_status">
							<c:choose>
									<c:when test="${p_s_size==0 }">
											<div class="col-md-3 fl-textcenter" style="display:inline-block">
													<h4>${a.a_title } </h4><p>${a.date }(${a.flag })</p>
													<img src="images/4.png" alt="" class="fl-photoAlbum">
											</div>	
									</c:when>
									<c:otherwise>
												<%   i=0; %>
											 	<div class="col-md-3 fl-textcenter" style="display:inline-block">
													<h4 >${a.a_title } </h4><p>${a.date }(${a.flag })</p>
													<c:forEach var="ps" items="${p_s_list}" varStatus="p_status">
															<c:choose>
																<c:when test="${ps.a_id==a.a_id }">
																	<img id ="${a.a_id} " src="${ps.a_p_url }" name="${a.u_id}" alt="${ps.u_p_id }" class="fl-photoAlbum" ><div>${ps.a_id }</div>
																	<% i =1; %>
																</c:when>
																<c:otherwise>
																	<%if(i==0) {%>
																		<c:if test="${p_status.last==true}"><img id ="${a.a_id} " name="${a.u_id}" src="images/4.png" alt="" class="fl-photoAlbum"></c:if>
																	<%} %>
																</c:otherwise>
															</c:choose>
													</c:forEach>
												</div>
									</c:otherwise>
							</c:choose>				
					</c:forEach>
				</div>

			</div>
		</div>
		<form id="fl-photoShow">
			<div class="wrapper" >
					<ul class="thumbs" id="thumbs"></ul>
			</div>
		</form>
				
		<form id="fl-bulid-photoalbum"  action="albumServlet" method="post">
			<input class="form-control fl-phototitle" type="text" name="title" placeholder="相册名称" style="margin:10px 0"/>
			<input class="fl-photoalbum-flag" type="radio" name="flag" id="flag" value="0" checked="checked"/><label for="flag">公开</label>
			<input class="fl-photoalbum-flag"  type="radio" name="flag" id="flaga" value="1"/><label for="flaga">私密</label>
			<input class="fl-btn-closeBulidAlbum btn btn-default btn-group-justified" type="submit" value="确定" style="margin:10px 0"/>
		</form>
		
		<form id="fl-upload-photo" action="uploadServlet" method="post" enctype="multipart/form-data">
			<label for='img'><a   class="fl-browsePhoto btn btn-default">选择图片<input type='file' id='img' name='photoalbum' onChange='show_image()'/></a></label>
			<c:choose>
				<c:when test="${a_size==0}">
				你还没有相册哦，先创建一个相册吧。
				</c:when>
				<c:otherwise>
					<select name="album" class="btn btn-default">
						<c:forEach var="a" items="${a_list}">
							<option value="${a.a_id }">${a.a_title }</option>
						</c:forEach>
					</select>
				</c:otherwise>
			</c:choose>
			<div id='showImage'><img src='' id='show'></div>
			<input class="fl-btn-closeBulidUpload btn btn-default btn-group-justified " type="submit" value="上传"/>
		</form>
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
<script type="text/javascript">
	function show_image() {
		var file_img = document.getElementById("show");
		iptfileupload = document.getElementById('img');
		//以下即为完整客户端路径
		getPath(file_img, iptfileupload, file_img);
		 if($("#fl-upload-photo").find("option").length !=0 && $("#showImage").find("img").length !=0 )		
				$(".fl-btn-closeBulidUpload").attr("disabled", false);
	}

	function getPath(obj, fileQuery, transImg) {
		var imgSrc = '',
			imgArr = [],
			strSrc = '';
		// IE浏览器判断
		if(window.navigator.userAgent.indexOf("MSIE") >= 1) {
			if(obj.select) {
				obj.select();
				var path = document.selection.createRange().text;
				obj.removeAttribute("src");
				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.setAttribute("src", transImg);
					obj.style.filter =
						"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + path + "', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
				} else {
					throw new Error('File type Error! please image file upload..');
				}
			} else {
				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.src = fileQuery.value;
				} else {
					throw new Error('File type Error! please image file upload..');
				}

			}
		} else {
			// 支持360浏览器 支持谷歌浏览器 支持火狐浏览器
			var file = fileQuery.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {

				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.setAttribute("src", e.target.result);
				} else {
					throw new Error('File type Error! please image file upload..');
				}

			}
			reader.readAsDataURL(file);
		}
	}
</script>
</html>