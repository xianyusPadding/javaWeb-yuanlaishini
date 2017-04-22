$(function(){
	
	var body_width = $('body').width();
	$('#myCarousel').width(body_width);
	
	var fl_contentTop = ($('.fl-carousel-img').height() - $('.fl-content').height())/2;
	var fl_contentLeft = $('.fl-carousel-img').width()*0.1;
	$('.fl-content').css('top',fl_contentTop).css('right',fl_contentLeft);
	$('.fl-content-black').css('top',fl_contentTop).css('left',fl_contentLeft);
		
	$(window).resize(function(){
		
		body_width = $('body').width();
		$('#myCarousel').width(body_width);
		
		fl_contentTop = ($('.fl-carousel-img').height() - $('.fl-content').height())/2;
		fl_contentLeft = $('.fl-carousel-img').width()*0.1;
		$('.fl-content').css('top',fl_contentTop).css('right',fl_contentLeft);
		$('.fl-content-black').css('top',fl_contentTop).css('left',fl_contentLeft);
	})

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
