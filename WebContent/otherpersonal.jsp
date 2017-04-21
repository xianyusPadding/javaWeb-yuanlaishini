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
	<script type="text/javascript" src="js/diaryShow.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/personal.css">
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
				<li class="active"><a href="personalServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
				<li><a href="makeFriendServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-list"></span> 交友广场</a></li>
				<li><a href="matchingServlet" class="fl-navbar-link"><span class="glyphicon glyphicon-fire"></span> 完美匹配</a></li>
				<li><a href="briefIntro.jsp" class="fl-navbar-link"><span class="glyphicon glyphicon-question-sign"></span> 公司简介</a></li>
			</ul>
		</div>
	</div>
</nav>



<div id="fl-section-cover">
	<div class="container">
		<div class="fl-cover-img">
			<img src="images/personalCover.png" alt="">
		</div>
		<div class="fl-cover-float" style="text-align: center;">
			<img src='<c:out value="${other.i_p_url}"></c:out>' class="fl-cover-icon" alt='' />
			<p class="fl-cover-id"><c:out value="${other.username}"></c:out></p> 
			<p><c:out value="${information.motto }"></c:out></p>
			<button class="btn btn-default fl-addFriend-btn">加为好友</button>
			<button class="btn btn-default fl-praise-btn">赞+1</button>
			<div class="dropdown fl-hadAddfriend" style="display: none;">
				<button class="btn btn-default fl-hadAddfriend-btn"  data-toggle="dropdown">
					已加好友
					<span class="caret"></span>
				</button>
				<button class="btn btn-default fl-chat-btn"><a href="tencent://Message/?Uin=978624366websiteName=qzone.qq.com&Menu=yes" style="color:#fff; text-decoration:none">聊天</a></button>
				<ul class="dropdown-menu">
					<li id="fl-deleteFriend"><a href="#">删除好友</a></li>
					<li id="fl-openGroup"><a href="#">设置分组</a></li>
				</ul>
			</div>
			
			<c:choose>
				<c:when test="${friend.user.date==null}">
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						$('.fl-addFriend-btn').css('display','none');
		        		$('.fl-hadAddfriend').css('display','');
		        		$('#fl-friendGroup').dialog("close");
					</script>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<!--分组对话框-->
<form id="fl-friendGroup">
	<h4>为<c:out value="${other.username}"></c:out> 选择分组</h4>
	<div class="fl-friendGroup-checkbox">
		<div class="checkbox" name='friendbx' style="margin-left:25px">
			<label ><input type="checkbox"  name='friend' value ='1'/>我的好友</label>
			<label ><input type="checkbox"  name='f_feeling' value ='1'/>有好感的人</label>
			<label ><input type="checkbox" name='f_collection' value ='1'/>特别收藏</label>
			<input type="text" name="uid" hidden="hidden" value='<c:out value="${user.u_id}"></c:out>'>
			<input type="text" name="fid" hidden="hidden" value='<c:out value="${other.u_id}"></c:out>'>
		</div>
	</div>
	<input type="submit" class="btn btn-success fl-fgSuccess-btn" value="保存" style="margin:15px 0 0 150px;"/ >
	<input type="button" class="btn btn-default " id="fl-fgClose-btn" value="取消"  style="margin-top:15px"/>
</form>

<div id="fl-tabs">
	<div class="container" style="background: #eee">
		<ul>
			<c:choose>
				<c:when test="${other.sex=='男'}">
						<li class="fl-tabs-link"><a href="#fl-tab1">他的动态</a></li>
						<li class="fl-tabs-link"><a href="#fl-tab2">他的相册</a></li>
						<li class="fl-tabs-link"><a href="#fl-tab3">他的日记</a></li>
				</c:when>
				<c:otherwise>
						<li class="fl-tabs-link"><a href="#fl-tab1">她的动态</a></li>
						<li class="fl-tabs-link"><a href="#fl-tab2">她的相册</a></li>
						<li class="fl-tabs-link"><a href="#fl-tab3">她的日记</a></li>
				</c:otherwise>
				
			</c:choose>	
			<li class="fl-tabs-link"><a href="#fl-tab4">管理中心</a></li>
		</ul>
		 <div id="fl-tab1">
			<div id="container">

				<div id="share_content">
					<c:choose>
						<c:when test="${shareSize==0 }">
						</c:when>
						<c:otherwise>
							<c:forEach var="s" items="${shareList}" varStatus="s_status">
							<div class="row fl-personal-dynamic" >
								<div class="row">
									<div class='col-md-1 col-sm-1 col-xs-2' style='float:left'>
										<img src="${other.i_p_url }" class="fl-dynamic-img" alt="">
									</div>
									<div class='col-md-11 col-sm-11 col-xs-10' style='float:left'>
										<h4>${other.username }</h4>
										<p style="font-size: 12px">${s.date}</p>
										<p style="font-size: 15px">${s.s_content}</p>
									</div>
								</div>
								<div class="row">
									<ul class="nav nav-tabs nav-justified" style="">
										<li><a>阅读(${s.readNum})</a></li>
										<li><a href="">转发</a></li>
										<li class="fl-href-comment"><input type='text' value='${s.s_id }' hidden='hidden'><a href="#1">评论</a></li>
										<li><input type='text' value='${s.s_id }' hidden='hidden'><a style='cursor:pointer;' class='clickStart'>赞(${s.startNum})</a></li>
									</ul>
								</div>
							</div>
								<!--评论区-->
								<div class='fl-comment row' style='display: none;background: #B66F58;'>
									<div class='row' >
										<div class='col-md-1 col-xs-2'>
											<img class='fl-dynamic-img' src='${user.i_p_url }' alt=''/>
										</div>
										<textarea class='col-md-11 col-xs-10 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>
										<input type='text' value='${s.s_id }' hidden='hidden'>
									</div>
									<div class='row fl-commentSubmit'>
										<input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' />
									</div>
									
									<div class='row' >
										<!-- 每一条评论 -->
									</div>
								</div>
								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div id="fl-tab2" style="padding:0 0 60px 0">
			<div class="container" >

				<div class="row">
				<!-- 相册封面 -->
				<c:if test="${a_size==0 }">
								<div class="col-md-3 fl-textcenter" style="display:inline-block">
									<p>空空如也</p><img src="images/4.png" alt="" class="fl-photoAlbum-none">
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
										<c:choose>
											<c:when test="${a.flag=='公开'}">
												<%   i=0; %>
											 	<div class="col-md-3 fl-textcenter" style="display:inline-block">
													<h4 >${a.a_title } </h4><p>${a.date }</p>
													<c:forEach var="ps" items="${p_s_list}" varStatus="p_status">
															<c:choose>
																<c:when test="${ps.a_id==a.a_id }">
																	<img id ="${a.a_id} " src="${ps.a_p_url }" name="${a.u_id}" alt="${ps.u_p_id }" class="fl-photoAlbum" ><div></div>
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
											</c:when>
											<c:otherwise>
												<div class="col-md-3 fl-textcenter" style="display:inline-block">
													<h4>${a.a_title } </h4><p>${a.date }(${a.flag })</p>
													<img src="images/lock.jpg" alt="" class="fl-photoAlbum" >
												</div>	
											</c:otherwise>
										</c:choose>
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
				
		<div id='fl-tab4'>
			<div class='container'>
				<div class='row' style='position: relative;background: ;'>
					<div class='col-md-3 fl-tab3-left'>
						<div class='fl-center' style='margin-top:50px;border-bottom: 1px solid #ddd;'>
							<img src='<c:out value="${other.i_p_url}"></c:out>' alt='' />
							<p><c:out value="${other.username }"></c:out></p>
						</div>
						<ul class='nav navbar fl-center fl-tab3-navbar' style=''>
							<li><a href='#fl-tab3-1'>基本资料<span class='glyphicon  glyphicon-chevron-right' ></span></a></li>
							<li><a href='#fl-tab3-2'>详细资料<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-3'>工作生活<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-4'>兴趣爱好<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-5'>婚姻观<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							
							<c:choose>
								<c:when test="${other.sex=='男'}">
										<li><a href='#fl-tab3-6'>他的认证<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
								</c:when>
								<c:otherwise>
										<li><a href='#fl-tab3-6'>她的认证<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div class='col-md-9 fl-tab3-right'>
						<div class='fl-tab3-1 fl-tab3-base' >
						<form action="userServlet" method="post">
							<ul>
								<li class='form-inline'><label for='' style='color:red'>昵称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.username }"></c:out></li>
								<li class='form-inline'><label for=''>账号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.u_id }"></c:out></li>
								<li class='form-inline'><label for='' style='color:red'>性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.sex }"></c:out></li>
								<li class='form-inline'><label for=''>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.email }"></c:out></li>
								<li class='form-inline'><label for='' style='color:red'>年龄：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.age }"></c:out></li>								
								<li class='form-inline'><label for='' style='color:red'>工作地区：</label>
								    <c:out value="${other.province }"></c:out><c:out value="${other.city }"></c:out><c:out value="${other.country }"></c:out>
								</li>	
								<li class='form-inline'>
									<label for='salary'>月收入：&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${other.salary}"></c:out>			
								</li>
								<li class='form-inline'><label for=''>加入时间：&nbsp;</label>2016.1.1</li>
								<%-- <input type="submit" value="保存" class="btn btn-default fl-keep-btn"> --%>
							</ul>
							</form>
	
						</div>
						<form action="informationServlet" method="post">
						<div class='fl-tab3-1 fl-tab3-details' style='display:none'>
							<ul>
								<li class='form-inline'><label for='' style='color:red'>真实姓名：</label><c:out value="${information.name }"></c:out></li>
								<li class='form-inline'><label for=''>身高：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${information.height }"></c:out><label for=''>cm</label></li>
								<li class='form-inline'><label for='' >体重：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${information.weight }"></c:out><label for=''>kg</label></li>
								<li class='form-inline'><label for=''>血型：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${information.bloodtype }"></c:out></li>
								<li class='form-inline'><label for=''>民族：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${information.nation }"></c:out></li>
								<li class='form-inline'><label for=''>住房条件：</label><c:out value="${information.house }"></c:out></li>
								<li class='form-inline'><label for=''>有无孩子：</label><c:out value="${information.have_child_not }"></c:out></li>
								<li class='form-inline'><label for=''>毕业院校：</label><c:out value="${information.graduate_school }"></c:out></li>
								<%-- <input type="submit" value ="保存" class="btn btn-default fl-keep-btn" > --%>
							</ul>
						</div>
						</form>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-3</div>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-4</div>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-5</div>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-6</div>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-7</div>
						<div class='fl-tab3-1' style='display:none'>fl-tab3-8</div>
					</div>
				</div>
			</div>
		</div>
		<div id="fl-tab3">
			<div class="row">
				<div class="fl-right col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-12 fl-center">
					<img src='<c:out value="${other.i_p_url}"></c:out>' alt='' />
					<p><c:out value="${other.username}"></c:out></p>
				</div>
				<div class="col-md-12 fl-center fl-diary-title" >
					<select name="" id="fl-diary-select" class="btn btn-default" autocomplete="off">
						<option value="" >默认日记</option>
					</select>
					<ul>
						<li class='fl-diaryTitle'><a href="diaryShow.jsp">1.有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</a></li>
						<li class='fl-diaryTitle'><a href="diaryShow.jsp">2.缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</a></li>
					</ul>
				</div>
				
			</div>
			
			<!--<div class="fl-left col-md-8 col-sm-8 col-xs-12" style="padding:0">				
				<div class="fl-diary" class="col-md-12 col-xs-12">
					<div class="fl-diary-tab">
						<h4 class="fl-center">日记1</h4>
						<p><a href="#">    有无佛山F想认识下新朋友，对的时间遇到对的人真系好难...</a></p>
					</div>
					
					<div class="fl-diary-tab" style="display: none;">
						<h4 class="fl-center">日记2</h4>
						<p><a href="">    缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</a></p>
					</div>					
				</div>				
			</div>-->
		</div>
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