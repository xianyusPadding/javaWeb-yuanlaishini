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
	<link rel="stylesheet" href="css/diaryShow.css" />
	<link href='http://cdn.webfont.youziku.com/webfonts/nomal/100824/47383/58e9f9a3f629d811b8f741c4.css' rel='stylesheet' type='text/css' />
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
					<p class="navbar-text navbar-right fl-login"><a href="personal.jsp" class="navbar-link fl-login" >${user.username}</a></p>
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
		<button class="fl-cover-button btn"><span class="glyphicon glyphicon-open"></span>上传封面</button>
		<!-- <input type="button" value="button"> -->
		<div class="fl-cover-img">
			<img src="images/personalCover.png" alt="">
		</div>
		<div class="fl-cover-float" style="text-align: center;">
			<img src='<c:out value="${user.i_p_url}"></c:out>' class="fl-cover-icon" alt='' />
			<p class="fl-cover-id"><c:out value="${user.username}"></c:out></p> 
			<c:choose>
				<c:when test="${information.motto ==null }">
					<p class="fl-cover-signature" >个性签名</p>
				</c:when>
				<c:otherwise>
					<p class="fl-cover-signature" ><c:out value="${information.motto }"></c:out></p>
				</c:otherwise>
			</c:choose>
			<input type="text" class="form-control fl-signature-input" placeholder="请输入你的个性签名："/>
			
			
			<div class="dropdown fl-hadAddfriend" style="display: none;">
				<button class="btn btn-default fl-hadAddfriend-btn"  data-toggle="dropdown">
					已加好友
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li id="fl-deleteFriend"><a href="#">删除好友</a></li>
					<li id="fl-openGroup"><a href="#">设置分组</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<form id="fl-upload-headphoto" action="uploadServlet" method="post" enctype="multipart/form-data">
	<label for='img-headphoto'><a   class="fl-browsePhoto btn btn-default">选择图片<input type='file' id='img-headphoto' name='photoalbum' onChange='show_image1()'/></a></label>
	<input name='type' type="text" value="alterHeadPhoto" hidden="hidden">
	<div id='showImage-headphoto'><img src='' id='show-headphoto'></div>
	<input class="fl-btn-closeHeadphoto btn btn-default btn-group-justified " type="submit" value="上传"/>
</form>

<!--分组对话框-->
<form id="fl-friendGroup">
	<h4>为<c:out value="${user.username}"></c:out> 选择分组</h4>
	<div class="fl-friendGroup-checkbox">
		<div class="checkbox" name='friendbx' style="margin-left:25px">
			<label ><input type="checkbox"  name='friend'/>我的好友</label>
			<label ><input type="checkbox"  name='f_feeling' />有好感的人</label>
			<label ><input type="checkbox" name='f_collection' />特别收藏</label>
		</div>
	</div>
	<input type="submit" class="btn btn-success fl-fgSuccess-btn" value="保存" style="margin:15px 0 0 150px;"/ >
	<input type="button" class="btn btn-default " id="fl-fgClose-btn" value="取消"  style="margin-top:15px"/>
</form>

<div id="fl-tabs">
	<div class="container" style="background: #eee">
		<ul>
			<li class="fl-tabs-link"><a href="#fl-tab1">个人动态</a></li>
			<li class="fl-tabs-link"><a href="#fl-tab2">我的相册</a></li>
			<li class="fl-tabs-link"><a href="#fl-tab3">我的日记</a></li>
			<li class="fl-tabs-link"><a href="#fl-tab4">管理中心</a></li>
		</ul>
		 <div id="fl-tab1">
			<div id="container">
			<!-- <form action="ajaxShareServlet" method="post"> -->
				<div class="row fl-tab1-publish" style="position: relative;">
					<h5>有什么新鲜或者记忆深刻的事想告诉大家？</h5>
					<textarea id="s_content" name="content" class="fl-tab1-publishMain" cols="30" rows="10"></textarea>
					<img src="images/rose.png" alt=""/>
					<input id="s_p_url" type="text" name="s_p_url" hidden="hidden" value="null">
					<input id="flag" type="text" name="flag" hidden="hidden" value="0">
					<ul class="nav nav-pills" style="float:left">
						<li><a href="#"><span class="glyphicon glyphicon-th-large"></span> 表情</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-picture"></span> 图片</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-fire"></span> 话题</a></li>
					</ul>
					<button id="share_submit" style="float:right" class="btn btn-default">发表</button>
				</div>
			<!-- </form> -->
				<div id="share_content">
					<c:choose>
						<c:when test="${shareSize==0 }">
						</c:when>
						<c:otherwise>
							<c:forEach var="s" items="${shareList}" varStatus="s_status">
							<div class="row fl-personal-dynamic">
								<div class="row">
									<div class='col-md-1 col-sm-1 col-xs-2' style='float:left'>
										<img class="fl-dynamic-img" src="${user.i_p_url }">
									</div>
									<div class='col-md-11 col-sm-11 col-xs-10' style='float:left'>
										<h4>${user.username }</h4>
										<p style="font-size: 12px">${s.date}</p>
										<p style="font-size: 15px">${s.s_content}</p>
									</div>
								</div>
								<div class="row">
									<ul class="nav nav-tabs nav-justified" style="">
										<li style=""><a href="">阅读(${s.readNum})</a></li>
										<li><a href="">转发</a></li>
										<li class="fl-href-comment"><input type='text' value='${s.s_id }' hidden='hidden'><a href="#1">评论</a></li>
										<li><a href="">赞(${s.startNum})</a></li>
									</ul>
								</div>
							</div>
								<!--评论区-->
								<div class='fl-comment row' style='display: none;background: #B66F58;'>
									<div class='row' >
										<div class='col-md-1 col-sm-1 col-xs-2'>
											<img class='fl-dynamic-img' src='${user.i_p_url }' style='border-radius: 50px;'alt=''/>
										</div>
										<textarea class='col-md-11 col-sm-11 col-xs-10 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>
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
			<div class="container" id="fl-photoalbum-style" >
				<div class="row" style="margin-left:10px">
					<button class="btn btn-default fl-photoalbum-btn" style="margin-bottom:20px"><a href="#">创建相册</a></button>
					<button class="btn btn-default fl-uploadPhoto-btn" style="margin-bottom:20px"><a href="#">上传相片</a></button>
				</div>
				<div class="row">
				<!-- 相册封面 -->
				<c:if test="${a_size==0 }">
								<div class="col-md-3 col-sm-3 col-xs-3 fl-textcenter" style="display:inline-block">
									<p>创建你的相册</p><img src="images/4.png" alt="" class="fl-photoAlbum-none">
								</div>
				</c:if>
				<%!  int i=0; %>
					<c:forEach var="a" items="${a_list}" varStatus="a_status">
							<c:choose>
									<c:when test="${p_s_size==0 }">
											<div class="col-md-3 col-sm-3 col-xs-3 fl-textcenter" style="display:inline-block">
													<img src="images/4.png" alt="" class="fl-photoAlbum">
													<h4>${a.a_title } </h4><p>${a.date }(${a.flag })</p>
											</div>	
									</c:when>
									<c:otherwise>
												<%   i=0; %>
											 	<div class="col-md-3 col-sm-3 col-xs-3 fl-textcenter" style="display:inline-block">
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
													<h4 >${a.a_title } </h4><p>${a.date }(${a.flag })</p>
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
		
		
		<div id='fl-tab4'>
			<div class='container'>
				<div class='row' style='position: relative;background: ;'>
					<div class='col-md-3 fl-tab3-left'>
						<div class='fl-center' style='margin-top:50px;border-bottom: 1px solid #ddd;'>
							<img src='<c:out value="${user.i_p_url}"></c:out>' alt='' />
							<p><c:out value="${user.username }"></c:out></p>
						</div>
						<ul class='nav navbar fl-center fl-tab3-navbar' style=''>
							<li><a href='#fl-tab3-1'>基本资料<span class='glyphicon  glyphicon-chevron-right' ></span></a></li>
							<li><a href='#fl-tab3-2'>详细资料<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-3'>工作生活<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-4'>趣爱好<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-5'>姻观<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-6'>我的认证<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-7'>好友管理<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
							<li><a href='#fl-tab3-8'>系统设置<span class='glyphicon  glyphicon-chevron-right'></span></a></li>
						</ul>
					</div>
					<div class='col-md-9 fl-tab3-right'>
						<div class='fl-tab3-1 fl-tab3-base' >
						<form action="userServlet" method="post">
							<ul>
								<li class='form-inline'><label for='' style='color:red'>昵称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input name='username' type="text" class="form-control" value="<c:out value="${user.username }"></c:out>"/></li>
								<li class='form-inline'><label for=''>I D ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><c:out value="${user.u_id }"></c:out></li>
								<li class='form-inline'><label for='' style='color:red'>性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" name='sex' class="form-control" value="<c:out value="${user.sex }"></c:out>"/></li>
								<li class='form-inline'><label for=''>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" name='email' class="form-control" value="<c:out value="${user.email }"></c:out>"/></li>
								<li class='form-inline'><label for='' style='color:red'>年龄：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name='age' class='form-control' id='fl-tab3-age'>
										<c:choose>
											<c:when test="${user.age==0}"><option value='0'>请选择</option></c:when>
											<c:otherwise><option value='<c:out value="${user.age }"></c:out>' selected="selected"><c:out value="${user.age }"></c:out></option></c:otherwise>
										</c:choose>
									</select>
								</li>								
								<li class='form-inline'><label for='' style='color:red'>工作地区：</label>
									<select id='s_province' name='s_province' class='form-control'></select>  
								    <select id='s_city' name='s_city' class='form-control'></select>  
								    <select id='s_county' name='s_county' class='form-control'></select>
								    <script type='text/javascript'>_init_area('<c:out value="${user.province }"></c:out>','<c:out value="${user.city }"></c:out>','<c:out value="${user.country }"></c:out>');</script>
								</li>	
								<li class='form-inline'>
									<label for='salary'>月收入：&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" name='salary' class="form-control" value='<c:out value="${user.salary}"></c:out>' />								
								</li>
								<li class='form-inline'><label for=''>加入时间：&nbsp;</label>2016.1.1</li>
								<input type="submit" value="保存" class="btn btn-default fl-keep-btn">
							</ul>
							</form>
	
						</div>
						<form action="informationServlet" method="post">
						<div class='fl-tab3-1 fl-tab3-details' style='display:none'>
							<ul>
								<li class='form-inline'><label for='' style='color:red'>真实姓名：</label><input name="name" type='text' class='form-control' value='<c:out value="${information.name }"></c:out>'/></li>
								<li class='form-inline'><label for=''>身高：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name='tall' class='form-control' id='fl-tab3-height'>
										<c:choose>
											<c:when test="${information.height ==0}">
												<option value=''>请选择</option>
											</c:when>
											<c:otherwise>
												<option value='<c:out value="${information.height }"></c:out>'><c:out value="${information.height }"></c:out></option>
											</c:otherwise>
										</c:choose>
									</select>
									<label for=''>cm</label>
								</li>
								<li class='form-inline'><label for='' >体重：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name='weight' class='form-control'  id='fl-tab3-weight'>
										<c:choose>
											<c:when test="${information.weight ==0}">
												<option value=''>请选择</option>
											</c:when>
											<c:otherwise>
												<option value='<c:out value="${information.weight }"></c:out>'><c:out value="${information.weight }"></c:out></option>
											</c:otherwise>
										</c:choose>
									</select>
									<label for=''>kg</label>
								</li>
								
								<li class='form-inline'><label for=''>血型：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name='blood_type' class='form-control'>
										<c:choose>
											<c:when test="${information.bloodtype ==null}">
												<option value=''>请选择</option>
											</c:when>
											<c:otherwise>
												<option value='<c:out value="${information.bloodtype }"></c:out>'><c:out value="${information.bloodtype }"></c:out></option>
											</c:otherwise>
										</c:choose>
										<option value='A型'>A型</option>
										<option value='B型'>B型</option>
										<option value='AB型'>AB型</option>
										<option value='C型'>C型</option>
										<option value='O型'>O型</option>
									</select>
								</li>
								<li class='form-inline'><label for=''>民族：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name='nation' class='form-control'>
										<c:choose>
											<c:when test="${information.nation ==null}">
												<option value=''>请选择</option>
											</c:when>
											<c:otherwise>
												<option value='<c:out value="${information.nation }"></c:out>'><c:out value="${information.nation }"></c:out></option>
											</c:otherwise>
										</c:choose>
										<option value='汉族'>汉族</option>
										<option value='藏族族'>藏族族</option>
										<option value='蒙古族族'>蒙古族族</option>
										<option value='满族'>满族</option>
										<option value='壮族'>壮族</option>
										<option value='其他'>其他</option>
									</select>
								</li>
								
								<li class='form-inline'>
									<label for=''>住房条件：</label>
											<select name='house' class='form-control'>
													<c:choose>
														<c:when test="${information.house ==null}">
															<option value=''>请选择</option>
														</c:when>
														<c:otherwise>
															<option value='<c:out value="${information.house }"></c:out>'><c:out value="${information.house }"></c:out></option>
														</c:otherwise>
													</c:choose>
													<option value='和家人同住'>和家人同住</option>
													<option value='已购房'>已购房</option>
													<option value='租房'>租房</option>
													<option value='打算婚后购房'>打算婚后购房</option>
													<option value='单位宿舍'>单位宿舍</option>
											</select>
								</li>
								<li class='form-inline'>
									<label for=''>有无孩子：</label>
										<select name='hava_child_not' class='form-control'>
												<c:choose>
														<c:when test="${information.have_child_not ==null}">
															<option value=''>请选择</option>
														</c:when>
														<c:otherwise>
															<option value='<c:out value="${information.have_child_not }"></c:out>'><c:out value="${information.have_child_not }"></c:out></option>
														</c:otherwise>
													</c:choose>
												<option value='有'>有</option>
												<option value='没有'>没有</option>
										</select>
								</li>
								<li class='form-inline'><label for=''>毕业院校：</label>
									<input name="graduate_school" type="text" class="form-control" value='<c:out value="${information.graduate_school }"></c:out>'/>
								</li>
								<input type="submit" value ="保存" class="btn btn-default fl-keep-btn" >
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
				<div class="fl-right col-md-4 col-sm-4 col-xs-12">
					<div class="col-md-12 fl-center">
						<img src='<c:out value="${user.i_p_url}"></c:out>' alt='' />
						<p><c:out value="${user.username}"></c:out></p> 
					</div>
					<div class="col-md-12 fl-center fl-diary-title" >
						<buttton class="fl-writeDiary-btn btn btn-default">写日记</buttton>
						<select name="" id="" class="btn btn-default" >
							<option value="" >默认日记</option>
						</select>
						<ul>
							<li class='fl-diaryTitle'>1.有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</li>
							<li class='fl-diaryTitle'>2.缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</li>
						</ul>
					</div>
					
				</div>
				
				<div class="fl-left col-md-8 col-sm-8 col-xs-12" style="padding:0">				
					<div class="fl-diary-write col-md-12 col-xs-12">
						<select name="" id="" class="btn btn-default">
							<option value="" >默认日记</option>
						</select>
						<button class="btn btn-default fl-delGroup-btn" style="float: right;">删除分组</button>
						<button class="btn btn-default fl-addGroup-btn" style="float: right;margin-right:10px">添加分组</button>					
						<input type="text" placeholder="标题" class="form-control"/>
						<textarea name="" rows="24" cols="" class="col-md-12 col-xs-12 form-control" placeholder="来写写吧" ></textarea>
						<button class=" btn btn-default" style="float: right;margin-top: 10px;">提交</button>
					</div>				
					<div class="fl-diary" class="col-md-12 col-xs-12">
						<div class="fl-diary-tab" style="display: none;">
							<h4 class="fl-center">日记1</h4>
							<p>有无佛山F 想认识下新朋友，对的时间遇到对的人真系好难...</p>
						</div>
						
						<div class="fl-diary-tab" style="display: none;">
							<h4 class="fl-center">日记2</h4>
							<p>缘分是一场偶遇也是一场痛苦，在游戏认识了我认识了Z小姐，因为某次...</p>
						</div>					
					</div>				
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

<div id="fl-add-group">
	<input type="text" class="fl-addGroup-title form-control " placeholder="请输入分组名称："/>
	<button class="btn btn-default fl-addGroup-okBtn" style="">确定</button>
</div>

<div id="fl-del-group">
	<input type="text" class="fl-delGroup-title form-control " placeholder="请输入分组名称："/>
	<button class="btn btn-default fl-delGroup-okBtn" style="">确定</button>
</div>
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
	
	function show_image1() {
		var file_img = document.getElementById("show-headphoto");
		iptfileupload = document.getElementById('img-headphoto');
		//以下即为完整客户端路径
		getPath(file_img, iptfileupload, file_img);
		 if($("#showImage-headphoto").find("img").length !=0 )		
				$(".fl-btn-closeHeadphoto").attr("disabled", false);
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
			var show_img = $('#show');
			var show_headphoto = $('#show-headphoto');
			reader.onload = function(e) {

				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.setAttribute("src", e.target.result);
					if(show_img.width()>400)
						show_img.width("400");
					if(show_img.height()>260)
						show_img.height("260");
					if(show_headphoto.width()>400)
						show_headphoto.width("400");
					if(show_headphoto.height()>260)
						show_headphoto.height("260");
				} else {
					throw new Error('File type Error! please image file upload..');
				}

			}
			reader.readAsDataURL(file);
		}
	}
</script>
</html>