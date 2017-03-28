$(function() {
	//封面width随着容器大小变化	
	$(".fl-cover-img img").css("width", $(".container").width() + "px");
	$(window).resize(function() {
		$(".fl-cover-img img").css("width", $(".container").width() + "px");
	})

	$(".fl-cover-float").css("left", ($(".fl-cover-img img").width() - $(".fl-cover-float").width()) / 2 + "px");
	$(".fl-cover-float").css("top", ($(".fl-cover-img img").height() - $(".fl-cover-float").height()) / 2 + "px");
	$(".fl-tabs-link").css("width", $(".container").width() / 3 - 8 + "px");
	$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
	$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
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
		$(".fl-tabs-link").css("width", $(".container").width() / 3 - 8 + "px");
		$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
		$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
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

//$("#fl-bulid-photoalbum").validate({
//	rules:{
//		title:{
//			required:true,
//		},
//	},
//	messages:{
//		title:{
//			required:"相册名称不得为空"
//		},
//	},
//})

	//上传图片的dialog
	$(".fl-uploadPhoto-btn").click(function() {
		$("#fl-upload-photo").dialog("open");
		$("#fl-bulid-photoalbum").dialog("close");
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
	        	console.log(response);
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
		$('#fl-tab3-height').append('<option>'+i+'</option>');
	
	for(i=30;i<=130;i++)
		$('#fl-tab3-weight').append('<option>'+i+'</option>');
		
	for(i=18;i<=45;i++)
		$('#fl-tab3-age').append('<option>'+i+'</option>');
	

})