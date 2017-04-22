$(function(){
	//让分组里的下拉列表和父元素的li等宽
	$(".dropdown-menu").css("width",$(".dropdown").width()+"px");
	var more_marLeft = ($('.fl-dynamic').width()-$('#more').width())/2;
	$('#more').css('margin-left',more_marLeft);
	$(window).resize(function(){
		$(".dropdown-menu").css("width",$(".dropdown").width()+"px");
		more_marLeft = ($('.fl-dynamic').width()-$('#more').width())/2;
		$('#more').css('margin-left',more_marLeft);
	})
	
	//index大于2的分组隐藏
	$.each($(".fl-navbar-group>li"),function(index,value){
		if(index>2)
			$(value).css("display","none");
	})
	
	//点击展开
	$(".fl-group-openBtn").click(function(){
		$.each($(".fl-navbar-group>li"),function(index,value){
			if(index>2)
				$(value).css("display","");
		})
		$(".fl-group-openBtn").css("display","none");
		$(".fl-group-closeBtn").css("display","");
	})
	
	//点击关闭
	$(".fl-group-closeBtn").click(function(){
		$.each($(".fl-navbar-group>li"),function(index,value){
			if(index>2)
				$(value).css("display","none");
		})
		$(".fl-group-closeBtn").css("display","none");
		$(".fl-group-openBtn").css("display","");
	})
	
	//展开按钮左边距
	$(".fl-group-openBtn").css('margin-left',$('.fl-navbar-left').width()*0.4+'px');
	
	$(window).resize(function(){
		$(".fl-group-openBtn").css('margin-left',$('.fl-navbar-left').width()*0.4+'px');
	})

	//显示评论
	$("#share_content").on('click', '.fl-href-comment', function() {
		var div=$(this).parent().next();
		var s_id=$(this).find('input').val();
		//清除上一次评论和回复的内容
		div.find('Textarea').val("");
		if(div.css("display")=="none"){
				$(".fl-comment").css("display","none");
				$.ajax({
			        type:'POST',
			        url:'comSelectServlet',
			        data:{
			        	type:"makeFriend",
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
	$(".fl-reply-parent").on('click', '.fl-reply', function() {
		var div1=$(this).next();
		if(div1.css("display")=="none"){
			$(".fl-replyArea").css("display","none");
			div1.css("display","");
		}else
			div1.css("display","none");
	})

	//评论异步提交ajax
	$(".fl-commentSubmit").on('click', '.comment_submit', function() {
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
	        	type:"makeFriend",
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
	var index=10;
	$('#more').click(function(){
		var _this=$('#more');
		_this.hide();
		$('#loading').show();
		$.ajax({
			type:'POST',
			url:'sharePageServlet',
			data:{
				index:index
			},
			success:function(response){
				if(response==""){
					$('#more').html("没有更多了");
					$('#more').attr("disabled","disabled");
					$('#more').css('background','#ccc');
				}
				$('#more').prev().html($('#more').prev().html()+response);
				index+=10;
				$('#loading').hide();
				_this.show();
			}
		});
	});
	
	//在body的高度小于window高度时，把footer置于底部
	var body_height = $('body').height();
	var window_height = $(window).height();
	var window_width = $(window).width();
	
	if(body_height < window_height)
		$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
	else
		$('#fl-footer').css("position","relative");
		
	$(window).resize(function(){		
		body_height = $('body').height();
	    window_height = $(window).height();
	    window_width = $(window).width();	
	    
		if(body_height < window_height)
			$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
		else
			$('#fl-footer').css("position","relative");
	})
})