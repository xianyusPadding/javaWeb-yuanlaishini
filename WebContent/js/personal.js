$(function() {
	//封面width随着容器大小变化	
	$(".fl-cover-img img").css("width", $(".container").width() + "px");
	$(window).resize(function() {
		$(".fl-cover-img img").css("width", $(".container").width() + "px");
	})

	$(".fl-cover-float").css("left", ($(".fl-cover-img img").width() - $(".fl-cover-float").width()) / 2 + "px");
	$(".fl-cover-float").css("top", ($(".fl-cover-img img").height() - $(".fl-cover-float").height()) / 2 + "px");
	$(".fl-tabs-link").css("width", $(".container").width() / 4 - 8 + "px");
	$(".fl-tabs-link1").css("width", $(".container").width() / 3 - 8 + "px");
	$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
	$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
	$(".fl-tabs-link1 a").css("margin-left", ($(".fl-tabs-link1").width() - $(".fl-tabs-link1 a").width()) / 2 + "px");
	var arrH = [];
	var arrW = [];
	$.each($("#fl-tab2 ul li img"), function(index, value) {
		arrH[index] = $(value).height() + 14 + "px";
		arrW[index] = $(value).width() + 14 + "px";
		$("#fl-tab2 ul").find("img").eq(index).css("height", arrH[index]);
		$("#fl-tab2 ul").find("img").eq(index).css("width", arrW[index]);
	})

	$(window).resize(function() {
		$(".fl-cover-float").css("left", ($(".fl-cover-img img").width() - $(".fl-cover-float").width()) / 2 + "px");
		$(".fl-cover-float").css("top", ($(".fl-cover-img img").height() - $(".fl-cover-float").height()) / 2 + "px");
		$(".fl-tabs-link").css("width", $(".container").width() / 4 - 8 + "px");
		$(".fl-tabs-link1").css("width", $(".container").width() / 3 - 8 + "px");
		$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
		$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
		$(".fl-tabs-link1 a").css("margin-left", ($(".fl-tabs-link1").width() - $(".fl-tabs-link1 a").width()) / 2 + "px");
	})

	//个人中心的选项卡
	$("#fl-tabs").tabs({
		active: 0,
	});

	//创建相册的dialog
	$(".fl-photoalbum-btn").click(function() {
		$("#fl-bulid-photoalbum").dialog("open");
		$("#fl-upload-photo").dialog("close");
	})

	$("#fl-bulid-photoalbum").dialog({
		title: "创建相册",
		width: 300,
		height: 200,
		autoOpen: false,
	})


	//上传图片的dialog
	$(".fl-uploadPhoto-btn").click(function() {
		$("#fl-upload-photo").dialog("open");
		$("#fl-bulid-photoalbum").dialog("close");
		$('#show').attr('src','');
	})

	$("#fl-upload-photo").dialog({
		title: "上传图片",
		width: 500,
		height: 400,
		autoOpen: false,
	})

	//点击dialog里面的“确认”和“上传”按钮，关闭对话框
	$(".fl-btn-closeBulidAlbum").click(function() {
		if($(".fl-phototitle").val()==""){
			alert("相册名称不得为空");
			return false;
		}
		else
			$("#fl-bulid-photoalbum").dialog("close");
	})

	$(".fl-btn-closeBulidUpload").click(function() {
		$("#fl-upload-photo").dialog("close");
	})


	$("#fl-photoShow").dialog({
		title:$(".fl-photoAlbum").parent().find("h4").html(),
		width:860,
		autoOpen:false,
	})
	
	$(".fl-photoAlbum").click(function(){
		var a_id=$(this).attr("id");
		var u_id=$(this).attr("name");
		var a_title=$(this).prev().prev().html();
		var thumbs=$("#thumbs");
		$.ajax({
	        type:'POST',
	        url:'photoSelectServlet',
	        data:{
	        	a_id:a_id,
	        	u_id:u_id
	        },
	        success:function(response){
	        	thumbs.html(response);
	        	$("#fl-photoShow").dialog("option","title", a_title).dialog("open");
	        }
	    });
	})
	$("#share_submit").click(function(){
		var shareContent=$("#share_content");
		
		$.ajax({
	        type:'POST',
	        url:'shareAddServlet',
	        data:{
	        	content:$("#s_content").val(),
	        	s_p_url:$("#s_p_url").val(),
	        	flag:$("#flag").val()
	        },
	        success:function(response){
	        	if(response=="0"){
	        		alert("请先登录!");
	        		location.href="index.jsp";
	        	}else if(response=="1"){
	        		alert("动态内容不能为空");
	        	}else if(response=="2"){
	        		alert("未知错误");
	        	}else{
	        		shareContent.html(response);
	        	}
	        	$("#s_content").val("");
	        	$("#s_p_url").val("");
	        	$("#flag").val("");
	        }
	    });
	})
	$(".fl-showPriphoto").dialog({
		width:1263,
		autoOpen:false,
	})

	$(".fl-btn-closeBulidUpload").attr("disabled", true);
	
	/**
	 * 支持给动态元素和属性绑定事件的是live和on，
	 * 其中live在JQUERY 1.7之后就不推荐使用了。
	 * 现在主要用on，使用on的时候也要注意，on前面的元素也必须在页面加载的时候就存在于dom里面。
	 * 动态的元素或者样式等，可以放在on的第二个参数里面。
	 * */
	//显示评论
	$("#share_content").on('click', '.fl-href-comment', function() {
		var div=$(this).parent().parent().parent().next();
		var s_id=$(this).find('input').val();
		//清除上一次评论和回复的内容
		div.find('Textarea').val("");
		if(div.css("display")=="none"){
				$(".fl-comment").css("display","none");
				$.ajax({
			        type:'POST',
			        url:'comSelectServlet',
			        data:{
			        	type:"personal",
			        	s_id:s_id
			        },
			        success:function(response){
			        	if(response=="0"){
			        		alert("请先登录!");
			        		location.href="index.jsp";
			        	}else if(response!=""){
			        		div.html(response);
			        	}
			        	div.css("display","");
			        }
			    });

		}else
			div.css("display","none");
		}); 

	//显示回复
	$("#share_content").on('click', '.fl-reply', function() {
		var div1=$(this).next();
		if(div1.css("display")=="none"){
			$(".fl-replyArea").css("display","none");
			div1.css("display","");
		}else
			div1.css("display","none");
	})

	//评论异步提交ajax
	$("#share_content").on('click', '.comment_submit', function() {
		var commentDiv=$(this).parent().next();
		var comment_content=$(this).parent().prev().find('Textarea');
		var s_id=comment_content.next().val();
		if(comment_content.val()==""){
			alert("评论内容不能为空");
			return;
		}
		$.ajax({
	        type:'POST',
	        url:'comAddServlet',
	        data:{
	        	type:"personal",
	        	s_id:s_id,
	        	c_content:comment_content.val()
	        },
	        success:function(response){
	        	if(response=="0"){
	        		alert("请先登录!");
	        		location.href="index.jsp";
	        	}else if(response=="1"){
	        		alert("评论内容不能为空");
	        	}else if(response=="2"){
	        		alert("未知错误");
	        	}else{
	        		commentDiv.html(response);
	        	}
	        	comment_content.val("");
	        }
	    });
	})
	
	//管理中心的选项卡
	$.each($('.fl-tab3-navbar li'),function(index,value){
		$('.fl-tab3-navbar li').eq(index).click(function(){
			var i;
			for(i=0;i<8;i++){
				if(i==index)
					$('.fl-tab3-navbar li').eq(index).parent().parent().next().find('.fl-tab3-1').eq(i).css('display','');
				else
					$('.fl-tab3-navbar li').eq(index).parent().parent().next().find('.fl-tab3-1').eq(i).css('display','none');
				}
		})
	})
	
	//身高 体重 年龄的option
	var i;
	for(i=140;i<=210;i++)
		$('#fl-tab3-height').append('<option value='+i+'>'+i+'</option>');
	
	for(i=30;i<=130;i++)
		$('#fl-tab3-weight').append('<option value='+i+'>'+i+'</option>');
		
	for(i=18;i<=45;i++)
		$('#fl-tab3-age').append('<option value='+i+'>'+i+'</option>');
	
	//分组设置的dialog
	$('#fl-friendGroup').dialog({
		title:'设置分组',
		width:300,
		autoOpen:false,
	})
	
	//加为好友的按钮
	$('.fl-cover-float').on('click','.fl-addFriend-btn',function(){
		$('#fl-friendGroup').dialog("open");
		
	})
	
	//提交成功时修改按钮为已加好友
	$('#fl-friendGroup').submit(function(){
		var friend =$('input:checkbox[name="friend"]:checked');
		var f_feeling =$('input:checkbox[name="f_feeling"]:checked');
		var f_collection =$('input:checkbox[name="f_collection"]:checked');
		var uid=$('input:text[name="uid"]').val();
		var fid=$('input:text[name="fid"]').val();
		if(friend.val()!=1&&f_feeling.val()!=1&&f_collection.val()!=1){
			alert("请选择");
			return false;
		}
		$.ajax({
	        type:'POST',
	        url:'friendAddServlet',
	        data:{
	        	uid:uid,
	        	fid:fid,
	        	friend:friend.val(),
	        	f_feeling:f_feeling.val(),
	        	f_collection:f_collection.val()
	        },
	        success:function(response){
	        	if(response=="0"){
	        		alert("未知错误");
	        	}else{
	        		$('.fl-addFriend-btn').css('display','none');
	        		$('.fl-hadAddfriend').css('display','');
	        		$('#fl-friendGroup').dialog("close");
	        	}
	        }
	    });
		return false;
	})
	
	$('#fl-friendGroup').on('click','#fl-fgClose-btn',function(){
		$('#fl-friendGroup').dialog("close");
	})
	
	//
	$('.dropdown-menu').on('click','#fl-deleteFriend',function(){
		var uid=$('input:text[name="uid"]').val();
		var fid=$('input:text[name="fid"]').val();
		$.ajax({
	        type:'POST',
	        url:'friendDelServlet',
	        data:{
	        	uid:uid,
	        	fid:fid
	        },
	        success:function(response){
	        	if(response=="0"){
	        		alert("未知错误");
	        	}
				$('.fl-addFriend-btn').css('display','');
				$('.fl-hadAddfriend').css('display','none');
	        }
	    });
	})
	
	//修改分组
	$('.dropdown-menu').on('click','#fl-openGroup',function(){
		$('#fl-friendGroup').dialog("open");
	})
	
	
	//给分组dialog加css
	$('#fl-friendGroup').prev().css("border","none").css("background","#fff");
	$('#fl-friendGroup').parent().css("border-top","3px solid #5CB85C");
	
	//个性签名的修改	
	$('.fl-cover-float').on('click','.fl-cover-signature',function(){
		$('.fl-cover-signature').hide();
		$('.fl-signature-input').show();
	})
	
	$('.fl-signature-input').keydown(function(event){
			var key_code=	event.keyCode;
			var signature=$('.fl-signature-input');
			var cover_signature=$('.fl-cover-signature');
			if(key_code==13){
				if(signature.val()=="")
					alert("签名不得为空！");
				else{
					$.ajax({
				        type:'POST',
				        url:'inforSignatureServlet',
				        data:{
				        	motto:signature.val()
				        },
				        success:function(response){
				        	if(response=="0"){
				        		alert("未知错误");
				        	}else{
				        		cover_signature.html(response);
				        	}
				        	signature.val("");
				        	signature.hide();
				        	cover_signature.show();
				        }
				    });
				}
			}
	})
	
	//上传头像dialog
	$('#fl-upload-headphoto').dialog({
		title: "修改头像",
		width: 500,
		height: 400,
		autoOpen: false,
	})
	
	$('.fl-btn-closeHeadphoto').attr("disabled",true).click(function(){
		$('#fl-upload-headphoto').dialog("close");
//		$('#fl-upload-headphoto').submit(function(){
//			return false;
//		})
	});
	
	$('.fl-cover-float').on('click','.fl-cover-icon',function(){
		$('#fl-upload-headphoto').dialog("open");
		$('#show-headphoto').attr("src","");
	})
	
	//相册图片原图显示
	$('#thumbs').on('click','.fl-showPhoto',function() {	
		var photoshow_src = $(this).attr('src');
		$("#fl-bigPhotoshow img").attr("src", photoshow_src);
		$("#fl-bigPhotoshow").show();
		var body_width = $(window).width();
		var body_height = $(window).height();
		var img_width=$("#fl-bigPhotoshow img").width()+14;
		var img_height=$("#fl-bigPhotoshow img").height()+14;
		var ratio_width=img_width/body_width;
		var ratio_height=img_height/body_height;
		if(img_width>body_width || img_height>body_height){
			if(ratio_width>ratio_height){
				$("#fl-bigPhotoshow img").css('width',img_width/ratio_width+'px');
				$("#fl-bigPhotoshow img").css('height',img_height/ratio_width+'px');
			}
			else{
				$("#fl-bigPhotoshow img").css('width',img_width/ratio_height+'px');
				$("#fl-bigPhotoshow img").css('height',img_height/ratio_height+'px');
			}
		}
		var img_width=$("#fl-bigPhotoshow img").width()+14;
		var img_height=$("#fl-bigPhotoshow img").height()+14;
		if(img_width<=body_width && img_height<=body_height){
			$("#fl-bigPhotoshow img").css("margin-left",(body_width-img_width)/2+"px");
			$("#fl-bigPhotoshow img").css("margin-top",(body_height-img_height)/2+"px");
		}

		$(window).resize(function(){
			var photoshow_src = $(this).attr('src');
			$("#fl-bigPhotoshow img").attr("src", photoshow_src);
			$("#fl-bigPhotoshow").show();
			var body_width = $(window).width();
			var body_height = $(window).height();
			var img_width=$("#fl-bigPhotoshow img").width()+14;
			var img_height=$("#fl-bigPhotoshow img").height()+14;
			var ratio_width=img_width/body_width;
			var ratio_height=img_height/body_height;
			if(img_width>body_width || img_height>body_height){
				if(ratio_width>ratio_height){
					$("#fl-bigPhotoshow img").css('width',img_width/ratio_width+'px');
					$("#fl-bigPhotoshow img").css('height',img_height/ratio_width+'px');
				}
				else{
					$("#fl-bigPhotoshow img").css('width',img_width/ratio_height+'px');
					$("#fl-bigPhotoshow img").css('height',img_height/ratio_height+'px');
				}
			}
			var img_width=$("#fl-bigPhotoshow img").width()+14;
			var img_height=$("#fl-bigPhotoshow img").height()+14;
			if(img_width<=body_width && img_height<=body_height){
				$("#fl-bigPhotoshow img").css("margin-left",(body_width-img_width)/2+"px");
				$("#fl-bigPhotoshow img").css("margin-top",(body_height-img_height)/2+"px");
			}
			
		})
	
	})
	//相片显示的关闭按钮
	$('#fl-bigPhotoshow').on('click','.fl-bigPhotoshow-closebtn',function(){
		$('#fl-bigPhotoshow').hide();
	});
	
	
	//在body的高度小于window高度时，把footer置于底部
	$.each($('.fl-tabs-link'),function(index,value){
		$('.fl-tabs-link').eq(index).on('click',function(){

			//在body的高度小于window高度时，把footer置于底部
			var body_height1 = $('body').height();
			var window_height = $(window).height();
			var window_width = $(window).width();
			
			if(body_height1 < window_height)
				$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
			else
				$('#fl-footer').css("position","relative");
			
			$(window).resize(function(){		
				body_height1 = $('body').height();
			    window_height = $(window).height();
			    window_width = $(window).width();	
			    
				if(body_height1 < window_height)
					$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
				else
					$('#fl-footer').css("position","relative");
			})
			
		})
	})
	
})