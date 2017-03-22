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

})

 