$(function(){
	var bootstrapButton = $.fn.button.noConflict();
	$.fn.bootstrapBtn = bootstrapButton;

	//轮播自动播放
	$("#myCarousel").carousel({
		interval:4000,
	});
	
	$(".carousel-control").css("line-height",$(".carousel-inner img").height()+"px");
	$(window).resize(function(){
		var $height=$(".carousel-inner img").eq(0).height()||
				   $(".carousel-inner img").eq(1).height()||
				   $(".carousel-inner img").eq(2).height();
		$(".carousel-control").css("line-height",$height+"px");
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

 